from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional

from database import get_db
from crud import get_places_by_categories_and_type
from schemas import PlaceOut

router = APIRouter()

@router.get("/places", response_model=List[PlaceOut])
def read_places(
    category_id: Optional[List[int]] = Query(None),
    type: Optional[str] = None,
    rating: Optional[float] = None,  # Nuevo parámetro de calificación
    db: Session = Depends(get_db)
):
    places = get_places_by_categories_and_type(db, category_id, type, rating)
    if not places:
        raise HTTPException(status_code=404, detail="No places found for the given criteria")
    return places