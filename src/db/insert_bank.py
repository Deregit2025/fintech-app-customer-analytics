import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))
import pandas as pd
from db_connection import get_connection

def insert_banks():
    # Load CSV
    df = pd.read_csv("data/processed/reviews_with_vader.csv")
    unique_banks = df[['bank_code', 'bank_name']].drop_duplicates()

    conn = get_connection()
    cursor = conn.cursor()

    bank_mapping = {}

    try:
        print("🚀 Inserting banks...")

        for _, row in unique_banks.iterrows():
            # Insert bank or skip if exists
            cursor.execute("""
                INSERT INTO banks (bank_code, bank_name)
                VALUES (%s, %s)
                ON CONFLICT (bank_code) DO NOTHING;
            """, (row['bank_code'], row['bank_name']))

        conn.commit()

        # Now fetch all bank_ids from DB to create mapping
        cursor.execute("SELECT bank_code, bank_id FROM banks;")
        for bank_code, bank_id in cursor.fetchall():
            bank_mapping[bank_code] = bank_id

        print(f"🟢 Total banks in mapping: {len(bank_mapping)}")

    except Exception as e:
        print("🔴 Error inserting banks:", e)
        conn.rollback()

    finally:
        cursor.close()
        conn.close()
        print("🔌 PostgreSQL connection closed.")

    return bank_mapping
