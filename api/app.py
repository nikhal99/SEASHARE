# api/app.py
from app import create_app
from app.utils.db import init_db

init_db()
app = create_app()
