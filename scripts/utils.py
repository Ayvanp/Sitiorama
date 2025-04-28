import json
import os

def save_places_to_json(places, filename):
    os.makedirs("scraping", exist_ok=True)
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(places, f, ensure_ascii=False, indent=2)
