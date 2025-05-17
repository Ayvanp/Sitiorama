from typing import List  # Asegúrate de importar List
from sqlalchemy.orm import Session
from models import Place, PlaceType

def get_places_by_categories_and_type(db: Session, category_ids: List[int] = None, type: str = None, rating: float = None):
    query = db.query(Place)

    if category_ids:
        query = query.filter(Place.category_id.in_(category_ids))

    if type:
        query = query.join(Place.place_types).filter(PlaceType.type == type)

    if rating:
        query = query.filter(Place.rating_avg >= rating)  # Filtra por calificación mínima

    return query.all()

def get_place_by_id(db, place_id: int):
    return db.query(Place).filter(Place.id == place_id).first()