"""
Enhanced Data Preprocessing Script
Task 1: Data Preprocessing

Improvements added:
- Remove duplicates
- Fix & normalize emojis
- Better text cleaning (remove URLs/special chars)
- More robust language detection
"""

import sys
import os
import pandas as pd
import numpy as np
from datetime import datetime
import re
from langdetect import detect, LangDetectException
import emoji  # NEW
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from configs.config import DATA_PATHS

class ReviewPreprocessor:
    """Enhanced Preprocessor class for review data"""

    def __init__(self, input_path=None, output_path=None):
        self.input_path = input_path or DATA_PATHS['raw_reviews']
        self.output_path = output_path or DATA_PATHS['processed_reviews']
        self.df = None
        self.stats = {}

    def load_data(self):
        print("Loading raw data...")
        try:
            self.df = pd.read_csv(self.input_path)
            print(f"Loaded {len(self.df)} reviews")
            self.stats['original_count'] = len(self.df)
            return True
        except Exception as e:
            print(f"ERROR: Failed to load data: {str(e)}")
            return False

    def remove_duplicates(self):
        """Remove duplicate reviews"""
        print("\n[0/7] Removing duplicates...")
        before = len(self.df)
        if 'review_id' in self.df.columns:
            self.df = self.df.drop_duplicates(subset=['review_id'])
        else:
            self.df = self.df.drop_duplicates(subset=['review_text'])
        removed = before - len(self.df)
        print(f"Duplicates removed: {removed}")
        self.stats['duplicates_removed'] = removed

    def check_missing_data(self):
        print("\n[1/7] Checking for missing data...")
        missing = self.df.isnull().sum()
        missing_pct = (missing / len(self.df)) * 100
        print("\nMissing values:")
        for col in missing.index:
            if missing[col] > 0:
                print(f"  {col}: {missing[col]} ({missing_pct[col]:.2f}%)")
        self.stats['missing_before'] = missing.to_dict()

    def handle_missing_values(self):
        print("\n[2/7] Handling missing values...")
        critical_cols = ['review_text', 'rating', 'bank_name']
        before_count = len(self.df)
        self.df = self.df.dropna(subset=critical_cols)
        removed = before_count - len(self.df)
        print(f"Removed {removed} rows with missing critical values")

        self.df['user_name'] = self.df['user_name'].fillna('Anonymous')
        self.df['thumbs_up'] = self.df['thumbs_up'].fillna(0)
        self.df['reply_content'] = self.df['reply_content'].fillna('')
        self.stats['rows_removed_missing'] = removed

    def normalize_dates(self):
        print("\n[3/7] Normalizing dates...")
        try:
            self.df['review_date'] = pd.to_datetime(self.df['review_date']).dt.date
            self.df['review_year'] = pd.to_datetime(self.df['review_date']).dt.year
            self.df['review_month'] = pd.to_datetime(self.df['review_date']).dt.month
        except Exception as e:
            print(f"WARNING: Error normalizing dates: {str(e)}")

    def clean_text(self):
        print("\n[4/7] Cleaning text...")

        def clean_review_text(text):
            if pd.isna(text):
                return ''
            text = str(text)

            # 🔧 Fix encoding issues (mojibake → proper emoji)
            try:
                text = text.encode('latin1', 'ignore').decode('utf-8', 'ignore')
            except:
                pass

            # 🧽 Remove URLs
            text = re.sub(r'http\S+|www\S+|https\S+', '', text)

            # 🧼 Normalize whitespace
            text = re.sub(r'\s+', ' ', text).strip()

            # 💬 Optional: convert emoji to text
            # text = emoji.demojize(text)  # uncomment if needed

            return text

        self.df['review_text'] = self.df['review_text'].apply(clean_review_text)

        # Remove empty text
        before_count = len(self.df)
        self.df = self.df[self.df['review_text'].str.len() > 0]
        removed = before_count - len(self.df)
        print(f"Removed {removed} empty reviews")
        self.stats['empty_reviews_removed'] = removed

        print("Filtering English-only reviews...")
        def is_english(text):
            try:
                return detect(text) == 'en'
            except LangDetectException:
                return False

        before_lang = len(self.df)
        self.df = self.df[self.df['review_text'].apply(lambda x: len(x) > 20 and is_english(x))]
        removed_lang = before_lang - len(self.df)
        print(f"Removed {removed_lang} non-English / very short reviews")
        self.stats['non_english_removed'] = removed_lang

        self.df['text_length'] = self.df['review_text'].str.len()

    def validate_ratings(self):
        print("\n[5/7] Validating ratings...")
        invalid = self.df[(self.df['rating'] < 1) | (self.df['rating'] > 5)]
        if len(invalid) > 0:
            print(f"Invalid ratings removed: {len(invalid)}")
            self.df = self.df[(self.df['rating'] >= 1) & (self.df['rating'] <= 5)]
        self.stats['invalid_ratings_removed'] = len(invalid)

    def prepare_final_output(self):
        print("\n[6/7] Preparing final dataset...")
        output_columns = [
            'review_id', 'review_text', 'rating', 'review_date', 'review_year',
            'review_month', 'bank_code', 'bank_name', 'user_name', 'thumbs_up',
            'text_length', 'source'
        ]
        self.df = self.df[[col for col in output_columns if col in self.df.columns]]
        self.df = self.df.sort_values(['bank_code', 'review_date'], ascending=[True, False]).reset_index(drop=True)
        print(f"Final dataset: {len(self.df)} reviews")

    def save_data(self):
        print("\n[7/7] Saving processed data...")
        try:
            os.makedirs(os.path.dirname(self.output_path), exist_ok=True)
            self.df.to_csv(self.output_path, index=False)
            self.stats['final_count'] = len(self.df)
            print(f"Data saved to: {self.output_path}")
            return True
        except Exception as e:
            print(f"ERROR: Failed to save data: {str(e)}")
            return False

    def generate_report(self):
        print("\n" + "="*60)
        print("PREPROCESSING REPORT")
        print("="*60)
        print(f"\nOriginal records: {self.stats.get('original_count',0)}")
        print(f"Duplicates removed: {self.stats.get('duplicates_removed',0)}")
        print(f"Missing critical removed: {self.stats.get('rows_removed_missing',0)}")
        print(f"Empty reviews removed: {self.stats.get('empty_reviews_removed',0)}")
        print(f"Non-English removed: {self.stats.get('non_english_removed',0)}")
        print(f"Invalid ratings removed: {self.stats.get('invalid_ratings_removed',0)}")
        print(f"Final records: {self.stats.get('final_count',0)}")

    def process(self):
        print("="*60)
        print("STARTING DATA PREPROCESSING")
        print("="*60)

        if not self.load_data(): return False
        self.remove_duplicates()
        self.check_missing_data()
        self.handle_missing_values()
        self.normalize_dates()
        self.clean_text()
        self.validate_ratings()
        self.prepare_final_output()

        if self.save_data():
            self.generate_report()
            print("\n✓ Preprocessing completed successfully!")
            return True
        else:
            print("\n✗ Preprocessing failed!")
            return False

def main():
    preprocessor = ReviewPreprocessor()
    preprocessor.process()

if __name__ == "__main__":
    main()
