# src/db/create_database.py

# Purpose:
# This script checks if the target PostgreSQL database exists.
# If not, it creates the database.
# This is the first step in our pipeline (Task 3) before creating tables or inserting data.

import os
import psycopg2  # PostgreSQL adapter for Python
from dotenv import load_dotenv  # to load environment variables securely

# ----------------------------
# 1. Load environment variables
# ----------------------------
load_dotenv()  # Loads variables from .env into os.environ

# Example .env contents (should be in project root):
# PG_HOST=localhost
# PG_USER=postgres
# PG_PASSWORD=yourpassword
# PG_PORT=5432
# PG_DATABASE=bank_reviews

def create_database():
    """
    Create the target database if it does not exist.
    Connects first to the default 'postgres' database.
    """
    
    # Name of the database we want to create/use
    target_db = os.getenv("PG_DATABASE")

    # ----------------------------
    # 2. Connect to default DB
    # ----------------------------
    # You cannot connect directly to a DB that doesn't exist yet
    # So connect to 'postgres' (default system DB)
    conn = psycopg2.connect(
        host=os.getenv("PG_HOST"),
        user=os.getenv("PG_USER"),
        password=os.getenv("PG_PASSWORD"),
        port=os.getenv("PG_PORT"),
        database="postgres"  # Default DB for creation
    )
    conn.autocommit = True  # Needed to run CREATE DATABASE outside a transaction
    cur = conn.cursor()

    # ----------------------------
    # 3. Check if the target database exists
    # ----------------------------
    cur.execute(f"SELECT 1 FROM pg_database WHERE datname='{target_db}'")
    exists = cur.fetchone()

    # ----------------------------
    # 4. Create database if not exists
    # ----------------------------
    if not exists:
        cur.execute(f"CREATE DATABASE {target_db}")
        print(f"Database '{target_db}' created successfully.")
    else:
        print(f"Database '{target_db}' already exists.")

    # ----------------------------
    # 5. Close connection
    # ----------------------------
    cur.close()
    conn.close()

# ----------------------------
# Run script standalone
# ----------------------------
if __name__ == "__main__":
    create_database()
