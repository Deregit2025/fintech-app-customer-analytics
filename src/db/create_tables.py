import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))
import psycopg2
from db_connection import get_connection

def create_tables():
    conn = get_connection()  # connects to DB_NAME
    if conn is None:
        print("❌ Failed to connect to the database.")
        return

    cursor = conn.cursor()

    try:
        print("🚀 Creating tables...")

        # Create banks table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS banks (
                bank_id SERIAL PRIMARY KEY,
                bank_code VARCHAR(10) UNIQUE NOT NULL,
                bank_name VARCHAR(255) NOT NULL,
                app_name VARCHAR(255)
            );
        """)

        # Create reviews table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS reviews (
                review_id SERIAL PRIMARY KEY,
                bank_id INT NOT NULL,
                review_text TEXT NOT NULL,
                rating FLOAT,
                review_date DATE,
                sentiment_label VARCHAR(50),
                sentiment_score FLOAT,
                source VARCHAR(100),
                FOREIGN KEY (bank_id) REFERENCES banks(bank_id) ON DELETE CASCADE
            );
        """)

        conn.commit()
        print("🟢 Tables 'banks' and 'reviews' created successfully!")

    except Exception as error:
        print("🔴 Error creating tables:", error)
        conn.rollback()

    finally:
        cursor.close()
        conn.close()
        print("🔌 PostgreSQL connection closed.")


if __name__ == "__main__":
    create_tables()
