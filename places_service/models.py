from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from database import Base  # o define Base aquí con declarative_base()

class Place(Base):
    __tablename__ = "places"

    id = Column(Integer, primary_key=True, index=True)
    google_place_id = Column(String, unique=True)
    name = Column(String)
    status = Column(String)
    rating_avg = Column(Float)
    user_ratings_total = Column(Integer)
    scope = Column(String)
    reference = Column(String)
    address = Column(String)
    category_id = Column(Integer, ForeignKey("categories.id"))

    # RELACIONES
    place_types = relationship("PlaceType", back_populates="place", cascade="all, delete-orphan")


class PlaceType(Base):
    __tablename__ = "place_types"

    id = Column(Integer, primary_key=True, index=True)
    place_id = Column(Integer, ForeignKey("places.id"))
    type = Column(String)

    place = relationship("Place", back_populates="place_types")
