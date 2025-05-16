# Dockerfile

FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del servicio
COPY . .

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto FastAPI
EXPOSE 8000

# Comando de arranque
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
