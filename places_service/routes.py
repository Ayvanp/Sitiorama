from fastapi import APIRouter, Depends, HTTPException, Query, Path
from sqlalchemy.orm import Session
from typing import List, Optional

from database import get_db
from crud import get_places_by_categories_and_type, get_place_by_id
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

@router.get("/places/{place_id}", response_model=PlaceOut)
def read_place(
    place_id: int = Path(..., description="El ID del lugar"),
    db: Session = Depends(get_db)
):
    place = get_place_by_id(db, place_id)
    if not place:
        raise HTTPException(status_code=404, detail="Place not found")
    return place