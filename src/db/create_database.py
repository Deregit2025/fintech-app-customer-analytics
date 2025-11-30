import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

import psycopg2
from psycopg2 import sql
from db_connection import get_connection
from configs.config import DB_NAME


def create_database():
    """
    Creates PostgreSQL database with the name in DB_NAME.
    Must connect to the default 'postgres' database first.
    """
    print("🚀 Creating database...")

    # Connect to default 'postgres' DB (not the one we're about to create)
    conn = get_connection("postgres")

    if conn is None:
        print("❌ Failed to connect to PostgreSQL 'postgres' database.")
        return

    try:
        conn.autocommit = True  # Required to execute CREATE DATABASE
        cursor = conn.cursor()

        cursor.execute(sql.SQL("CREATE DATABASE {}").format(
            sql.Identifier(DB_NAME)
        ))

        print(f"🟢 Database '{DB_NAME}' created successfully!")

    except psycopg2.errors.DuplicateDatabase:
        print(f"ℹ Database '{DB_NAME}' already exists. Skipping creation.")

    except Exception as error:
        print("🔴 Error creating database:", error)

    finally:
        cursor.close()
        conn.close()
        print("🔌 PostgreSQL connection closed.")


if __name__ == "__main__":
    create_database()
