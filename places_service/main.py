from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import router  # o como importes tus rutas

app = FastAPI()

# Configura aquí los orígenes permitidos (puedes poner ["*"] para desarrollo)
origins = [
    "http://localhost:4321",
    "http://127.0.0.1:4321"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,  # permite solo tu frontend
    allow_credentials=True,
    allow_methods=["*"],  # permite GET, POST, PUT, DELETE, etc
    allow_headers=["*"],
)

app.include_router(router)