from fpdf import FPDF
import json
import os

categories_files = {
    "Gastronomía": "scraping/gastronomia.json",
    "Atracciones": "scraping/atracciones.json",
    "Compras": "scraping/compras.json",
    "Transporte": "scraping/transporte.json",
    "Servicios Básicos": "scraping/servicios_basicos.json"
}

class PDF(FPDF):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.title = "" # Inicializar title para evitar errores tempranos

    def header(self):
        self.set_font('Arial', 'B', 14)
        self.cell(0, 10, self.title, ln=True, align='C')
        self.ln(10)

    def chapter_title(self, title):
        self.set_font('Arial', 'B', 12)
        # Asegurarse de que el título sea un string y codificarlo a UTF-8
        if not isinstance(title, str):
            title = str(title)
        self.cell(0, 10, title.encode('latin1', 'ignore').decode('latin1'), ln=True)
        self.ln(4)

    def chapter_body(self, text):
        self.set_font('Arial', '', 10)
        # Asegurarse de que el texto sea un string y codificarlo a UTF-8
        if not isinstance(text, str):
            text = str(text)
        self.multi_cell(0, 10, text.encode('latin1', 'ignore').decode('latin1'))
        self.ln()

def create_pdf(title, places, filename):
    # Especificar la codificación al crear el objeto PDF
    pdf = PDF()
    pdf.set_title(title)
    pdf.add_page()

    for place in places:
        name = place.get("name", "Sin nombre")
        rating = place.get("rating", "N/A")
        reviews = place.get("user_ratings_total", "N/A")
        address = place.get("vicinity", "N/A")
        price_level = place.get("price_level", "N/A")
        phone = place.get("formatted_phone_number", "N/A")
        website = place.get("website", "N/A")

        text = f"Nombre: {name}\nCalificación: {rating} ({reviews} reseñas)\nDirección: {address}\nNivel de precio: {price_level}\nTeléfono: {phone}\nSitio Web: {website}\n"
        pdf.chapter_title(name)
        pdf.chapter_body(text)

    os.makedirs("scraping", exist_ok=True)
    pdf.output(filename)

def main():
    for category, filepath in categories_files.items():
        if os.path.exists(filepath):
            with open(filepath, "r", encoding="utf-8") as f:
                places = json.load(f)
            output_filename = f"scraping/{category.lower().replace(' ', '_')}.pdf"
            create_pdf(category, places, output_filename)
            print(f"{output_filename} generado correctamente.")
        else:
            print(f"Archivo {filepath} no encontrado.")

if __name__ == "__main__":
    main()