#!/usr/bin/env python3
"""
Indexador PDF → ChromaDB para Sitiorama
---------------------------------------

• Recorre una carpeta con PDF y extrae el texto.
• Limpia, fragmenta y embebe los trozos con OpenAI.
• Crea (o actualiza) una colección Chroma persistente.

Uso básico:
    python scripts/indexer.py PDF_pruebas

Parámetros opcionales:
    --collection  Nombre de la colección   (por defecto: pruebas_sitiorama)
    --chunk       Tamaño de fragmento      (por defecto: 1 000 caracteres)
    --overlap     Solapamiento             (por defecto: 200 caracteres)
    --force       Elimina colección previa y la recrea
"""

from __future__ import annotations

import argparse
import os
import re
import uuid
from pathlib import Path

import chromadb
from langchain_openai import OpenAIEmbeddings
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import Chroma
from pypdf import PdfReader
from dotenv import load_dotenv

load_dotenv(dotenv_path=Path(__file__).resolve().parent.parent / ".env")

# ─────────────── Config global ────────────────
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    raise RuntimeError("Debes definir la variable de entorno OPENAI_API_KEY.")

CHROMA_DIR = Path(__file__).resolve().parent.parent / "chroma"

# ─────────────── Helpers ──────────────────────
def clean_text(raw: str) -> str:
    """Elimina saltos y espacios duplicados para ahorrar tokens."""
    text = re.sub(r"\n+", " ", raw)
    text = re.sub(r"\s+", " ", text)
    text = re.sub(r"\s([?.!,¿])", r"\1", text)
    return text.strip()


def iter_pdf_texts(folder: Path) -> tuple[str, str]:
    """Yield (filename, full_text) for each PDF in folder."""
    for pdf_path in folder.glob("*.pdf"):
        reader = PdfReader(pdf_path)
        pages = [p.extract_text() or "" for p in reader.pages]
        text = clean_text(" ".join(pages))
        yield pdf_path.name, text

# ─────────────── Indexación ───────────────────
def build_collection(
    pdf_dir: Path,
    collection_name: str,
    chunk_size: int,
    overlap: int,
    force: bool,
) -> None:
    embeddings = OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY)

    if force and (CHROMA_DIR / "index").exists():
        print("⚠️  Borrando colección previa…")
        for p in CHROMA_DIR.rglob("*"):
            if p.is_file():
                p.unlink()
        (CHROMA_DIR / "index").mkdir(parents=True, exist_ok=True)

    db = Chroma(
        collection_name=collection_name,
        persist_directory=str(CHROMA_DIR),
        embedding_function=embeddings,
    )

    splitter = RecursiveCharacterTextSplitter(
        chunk_size=chunk_size, chunk_overlap=overlap
    )

    total_chunks = 0
    for filename, text in iter_pdf_texts(pdf_dir):
        if not text.strip():
            print(f"⚠️  {filename} no contiene texto extraíble. ¿Es un PDF basado en imagen?")
            continue

        chunks = splitter.split_text(text)
        if not chunks:
            print(f"⚠️  {filename} no generó fragmentos. Puede tener poco o mal texto.")
            continue

        ids = [str(uuid.uuid4()) for _ in chunks]
        metadata = [{"source": filename}] * len(chunks)

        print(f"• {filename}: {len(chunks)} fragmentos")
        db.add_texts(chunks, ids=ids, metadatas=metadata)
        total_chunks += len(chunks)

    db.persist()
    print(f"✅ Indexación completada. {total_chunks} fragmentos guardados en '{collection_name}'.")
    print(f"📂 Colección persistida en {CHROMA_DIR.resolve()}")

# ─────────────── CLI ──────────────────────────
def main() -> None:
    parser = argparse.ArgumentParser(description="Genera colección Chroma desde PDFs")
    parser.add_argument("pdf_folder", type=Path, help="Carpeta con archivos PDF")
    parser.add_argument("--collection", default="pruebas_sitiorama")
    parser.add_argument("--chunk", type=int, default=1000, help="Tamaño de fragmento")
    parser.add_argument("--overlap", type=int, default=200, help="Solapamiento")
    parser.add_argument("--force", action="store_true", help="Recrear colección")
    args = parser.parse_args()

    if not args.pdf_folder.is_dir():
        raise SystemExit(f"Carpeta {args.pdf_folder} no existe o no es un directorio.")

    CHROMA_DIR.mkdir(parents=True, exist_ok=True)
    build_collection(
        args.pdf_folder, args.collection, args.chunk, args.overlap, args.force
    )


if __name__ == "__main__":
    main()
