import requests
import json
import os
from utils import save_places_to_json

# Carga tu API Key de un archivo .env (más seguro)

API_KEY = "AIzaSyDwUP8gDux_-Ro0kY4tpCUkDHT7PIuvPKc"

# Base URL de búsqueda
PLACES_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"

# Coordenadas de Valdivia, Chile
LOCATION = "-39.8142,-73.2459"
RADIUS = 5000  # 5 km a la redonda

# Definir categorías
categories = {
    "gastronomia": ["restaurant", "cafe", "bar", "bakery", "meal_takeaway", "meal_delivery"],
    "atracciones": ["park", "tourist_attraction", "campground"],
    "compras": ["shopping_mall", "store", "clothing_store", "book_store"],
    "transporte": ["bus_station", "transit_station", "train_station"],
    "servicios_basicos": ["hospital", "pharmacy", "doctor", "library", "school", "university"]
}

def fetch_places(type_place):
    params = {
        "location": LOCATION,
        "radius": RADIUS,
        "type": type_place,
        "key": API_KEY
    }
    response = requests.get(PLACES_URL, params=params)
    data = response.json()
    return data.get("results", [])

def main():
    for category, types in categories.items():
        all_places = []
        for place_type in types:
            print(f"Buscando lugares de tipo: {place_type}...")
            places = fetch_places(place_type)
            all_places.extend(places)
        
        print(f"Guardando {len(all_places)} lugares en {category}.json")
        save_places_to_json(all_places, f"scraping/{category}.json")

if __name__ == "__main__":
    main()
