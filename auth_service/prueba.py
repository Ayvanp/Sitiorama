hashed_password = "$2b$12$Q9ym53zVzJNgkcbMSNdKCejCk1Pz6UMm0tQMjF6gUpwEaNxkBbrW."
plain_password = "admin123"

from passlib.context import CryptContext
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

print(pwd_context.verify(plain_password, hashed_password))  # Esto debería imprimir True