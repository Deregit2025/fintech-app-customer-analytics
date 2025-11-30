# src/db/db_connection.py

# Purpose:
# Provides a function to connect to the target PostgreSQL database.
# Any script that needs to read/write data will import this function.

import os
import psycopg2
from dotenv import load_dotenv

# ----------------------------
# 1. Load environment variables
# ----------------------------
load_dotenv()  # Loads PG_HOST, PG_USER, PG_PASSWORD, PG_PORT, PG_DATABASE from .env

def get_db_connection():
    """
    Returns a connection object to the target PostgreSQL database.
    Use this function wherever you need to interact with the DB.
    """
    conn = psycopg2.connect(
        host=os.getenv("PG_HOST"),
        user=os.getenv("PG_USER"),
        password=os.getenv("PG_PASSWORD"),
        port=os.getenv("PG_PORT"),
        database=os.getenv("PG_DATABASE")  # Connect directly to the target DB now
    )
    return conn

# ----------------------------
# Optional: test the connection
# ----------------------------
if __name__ == "__main__":
    try:
        conn = get_db_connection()
        print("Connection to database successful!")
        conn.close()
    except Exception as e:
        print(f"Error connecting to database: {e}")
