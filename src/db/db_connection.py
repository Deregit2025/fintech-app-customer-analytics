import psycopg2
from psycopg2 import OperationalError
from configs.config import DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD


def get_connection(dbname=None):
    """
    Creates and returns a PostgreSQL connection.
    If dbname is not provided, it connects to the DB_NAME from config.
    """
    try:
        connection = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            database=dbname or DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        print(f"🟢 Successfully connected to database: {dbname or DB_NAME}")
        return connection

    except OperationalError as error:
        print("🔴 Error connecting to PostgreSQL database:", error)
        return None


if __name__ == "__main__":
    # Optional: Test the connection directly
    conn = get_connection()
    if conn:
        conn.close()
        print("🔌 Connection closed successfully.")
