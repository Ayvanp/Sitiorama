"""
FastAPI gateway para el motor RAG de Sitiorama.

• POST /api/chat  ← endpoint que ahora coincide con el frontend
"""

from __future__ import annotations

import os
from pathlib import Path

from fastapi import FastAPI, HTTPException, APIRouter
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from dotenv import load_dotenv

from langchain_openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma        # <- usa el paquete nuevo
import openai

# ────────────────────── Carga de variables ──────────────────────
load_dotenv(dotenv_path=Path(__file__).parent / ".env")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    raise RuntimeError("Debes definir la variable de entorno OPENAI_API_KEY.")

# ─────────────────── Config rutas y colecciones ─────────────────
CHROMA_DIR = Path(__file__).parent / "chroma"
COLLECTION_NAME = "pruebas_sitiorama"
MODEL_NAME = "gpt-4o-mini"

# ───────────────────── Inicialización de recursos ───────────────
embeddings = OpenAIEmbeddings(api_key=OPENAI_API_KEY)
db = Chroma(
    collection_name=COLLECTION_NAME,
    persist_directory=str(CHROMA_DIR),
    embedding_function=embeddings,
)
openai_client = openai.OpenAI(api_key=OPENAI_API_KEY)

# ─────────────────────────── FastAPI ────────────────────────────
app = FastAPI(
    title="Sitiorama RAG API",
    description="Servicio de respuesta conversacional con recuperación aumentada.",
    version="1.0.0",
)

# CORS para desarrollo
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["POST"],
    allow_headers=["*"],
)

# ──────────────── Modelos de entrada / salida ───────────────────
class ChatRequest(BaseModel):
    question: str = Field(..., min_length=2)
    k: int = Field(6, ge=1, le=20)
    temperature: float = Field(0.2, ge=0.0, le=1.0)

class ChatResponse(BaseModel):
    answer: str
    context_fragments: list[str]

# ──────────────────────── Lógica principal ──────────────────────
def obtener_respuesta(q: str, k: int, temp: float) -> tuple[str, list[str]]:
    docs = db.similarity_search(q, k=k)
    context = "\n".join(d.page_content for d in docs)

    prompt = (
        "Eres un asistente experto en recomendaciones sobre Valdivia, Chile.\n\n"
        f"### Contexto\n{context}\n\n"
        f"### Pregunta\n{q}\n\n### Respuesta:"
    )

    chat = openai_client.chat.completions.create(
        model=MODEL_NAME,
        messages=[{"role": "user", "content": prompt}],
        temperature=temp,
    )
    answer = chat.choices[0].message.content.strip()
    return answer, [d.page_content for d in docs]

# ─────────────────────── Rutas con prefijo /api ─────────────────
router = APIRouter(prefix="/api")

@router.post("/chat", response_model=ChatResponse, tags=["Chat"])
async def chat(req: ChatRequest):
    try:
        answer, ctx = obtener_respuesta(req.question, req.k, req.temperature)
    except Exception as exc:
        raise HTTPException(500, str(exc)) from exc
    return {"answer": answer, "context_fragments": ctx}

app.include_router(router)
