from typing import List, Optional
from pydantic import BaseModel


class PlaceTypeOut(BaseModel):
    type: str

    class Config:
        orm_mode = True


class PlaceOut(BaseModel):
    id: int
    name: str
    address: str
    category_id: int
    rating_avg: Optional[float]
    user_ratings_total: Optional[int]
    place_types: List[PlaceTypeOut] = []

    class Config:
        orm_mode = True