from pydantic import BaseModel, EmailStr
from datetime import datetime

class UserBase(BaseModel):
    name: str
    email: EmailStr

class UserCreate(UserBase):
    password: str
    # no incluir role aquí: se toma "user" por defecto

class UserOut(UserBase):
    id: int
    role: str                       # ← hacemos visible el rol
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True