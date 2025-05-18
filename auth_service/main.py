from fastapi import FastAPI
from routes import router
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Permitir el origen del frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:4321"],  # o "*" pero no con credentials
    allow_credentials=True,  # <--- debe estar en True para cookies
    allow_methods=["*"],
    allow_headers=["*"],
)

# Rutas
from routes import router
app.include_router(router)
