# src/insights/drivers_pain_points.py

import pandas as pd
import os

def get_top_keywords(file_path, top_n=5):
    """Reads a CSV file and returns top N entries based on TF-IDF or frequency score."""
    df = pd.read_csv(file_path)
    return df.head(top_n)

def extract_drivers_and_pain_points(bank_name):
    base_path = "data/processed"
    
    files = {
        "noun_phrases": f"{bank_name}_noun_phrases.csv",
        "freq_keywords": f"{bank_name}_frequency_keywords.csv",
        "tfidf": f"{bank_name}_tfidf_keywords.csv"
    }
    
    print(f"\n📌 {bank_name} – Key Drivers & Pain Points")
    
    for key, file in files.items():
        path = os.path.join(base_path, file)
        if os.path.exists(path):
            print(f"\n🔍 Top {key.replace('_', ' ')}:")
            print(get_top_keywords(path))
        else:
            print(f"⚠ File not found: {path}")

if __name__ == "__main__":
    banks = [
        "Commercial Bank of Ethiopia",
        "Bank of Abyssinia",
        "Dashen Bank"
    ]
    
    for bank in banks:
        extract_drivers_and_pain_points(bank)
