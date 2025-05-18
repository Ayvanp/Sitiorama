from sqlalchemy.ext.asyncio import AsyncSession
from . import models
from sqlalchemy.future import select

async def get_user_by_email(db: AsyncSession, email: str):
    result = await db.execute(select(models.User).where(models.User.email == email))
    return result.scalar_one_or_none()
