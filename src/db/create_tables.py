# src/db/create_tables.py

# Purpose:
# This script creates the necessary tables for storing bank info and reviews.
# It uses the reusable connection from db_connection.py

import psycopg2
from db_connection import get_db_connection

def create_tables():
    """
    Creates 'banks' and 'reviews' tables in the target database.
    """
    # SQL statements to create tables
    create_banks_table = """
    CREATE TABLE IF NOT EXISTS banks (
        bank_id SERIAL PRIMARY KEY,
        bank_name VARCHAR(100) NOT NULL,
        app_name VARCHAR(100) NOT NULL
    );
    """

    create_reviews_table = """
    CREATE TABLE IF NOT EXISTS reviews (
        review_id SERIAL PRIMARY KEY,
        bank_id INT NOT NULL REFERENCES banks(bank_id),
        review_text TEXT NOT NULL,
        rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
        review_date DATE,
        sentiment_label VARCHAR(20),
        sentiment_score FLOAT,
        source VARCHAR(50)
    );
    """

    try:
        # Get DB connection
        conn = get_db_connection()
        cur = conn.cursor()

        # Execute table creation
        cur.execute(create_banks_table)
        cur.execute(create_reviews_table)

        # Commit changes
        conn.commit()
        print("Tables created successfully!")

        # Close cursor and connection
        cur.close()
        conn.close()

    except Exception as e:
        print(f"Error creating tables: {e}")

# ----------------------------
# Optional test: run this script
# ----------------------------
if __name__ == "__main__":
    create_tables()
