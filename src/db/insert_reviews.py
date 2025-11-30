import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

import pandas as pd
from db_connection import get_connection
from insert_bank import insert_banks  # Improved version with full mapping

def insert_reviews():
    # Get bank mapping (bank_code -> bank_id)
    bank_mapping = insert_banks()

    if not bank_mapping:
        print("❌ Bank mapping is empty. Cannot insert reviews.")
        return

    # Load processed reviews CSV
    df = pd.read_csv("data/processed/reviews_with_vader.csv")

    # Rename sentiment columns to match DB
    df = df.rename(columns={
        'sentiment_label_vader': 'sentiment_label',
        'sentiment_score_vader': 'sentiment_score'
    })

    # Connect to DB
    conn = get_connection()
    if conn is None:
        print("❌ Failed to connect to the database.")
        return

    cursor = conn.cursor()

    try:
        print("🚀 Inserting reviews...")

        for _, row in df.iterrows():
            bank_id = bank_mapping.get(row['bank_code'])
            if not bank_id:
                print(f"⚠ Warning: Bank code {row['bank_code']} not found. Skipping review.")
                continue

            cursor.execute("""
                INSERT INTO reviews (
                    bank_id, review_text, rating, review_date,
                    sentiment_label, sentiment_score, source
                ) VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (
                bank_id,
                row['review_text'],
                row['rating'],
                row['review_date'],
                row['sentiment_label'],
                row['sentiment_score'],
                row['source']
            ))

        conn.commit()
        print(f"🟢 Inserted {len(df)} reviews successfully!")

    except Exception as error:
        print("🔴 Error inserting reviews:", error)
        conn.rollback()

    finally:
        cursor.close()
        conn.close()
        print("🔌 PostgreSQL connection closed.")


if __name__ == "__main__":
    insert_reviews()
