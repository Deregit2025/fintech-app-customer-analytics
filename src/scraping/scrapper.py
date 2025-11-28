"""
Google Play Store Review Scraper
Task 1: Data Collection

This script scrapes user reviews from Google Play Store for three Ethiopian banks.
Target: 400+ reviews per bank (1200 total minimum)
"""

import os
import sys
import time
from datetime import datetime
import pandas as pd
from google_play_scraper import app, Sort, reviews
from tqdm import tqdm
from langdetect import detect, DetectorFactory

# Ensure consistent language detection
DetectorFactory.seed = 0

# Add parent folder to path to import config
# Add the parent directory of the project root to sys.path so Python can find 'config'
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
from configs.config import APP_IDS, BANK_NAMES, SCRAPING_CONFIG, DATA_PATHS


class PlayStoreScraper:
    """Scraper class for Google Play Store reviews"""

    def __init__(self):
        self.app_ids = APP_IDS
        self.bank_names = BANK_NAMES
        self.reviews_per_bank = SCRAPING_CONFIG['reviews_per_bank']
        self.lang = SCRAPING_CONFIG['lang']
        self.country = SCRAPING_CONFIG['country']
        self.max_retries = SCRAPING_CONFIG['max_retries']

    def get_app_info(self, app_id):
        """Fetch basic information about the app"""
        try:
            result = app(app_id, lang=self.lang, country=self.country)
            return {
                'app_id': app_id,
                'title': result.get('title', 'N/A'),
                'score': result.get('score', 0),
                'ratings': result.get('ratings', 0),
                'reviews': result.get('reviews', 0),
                'installs': result.get('installs', 'N/A')
            }
        except Exception as e:
            print(f"Error getting app info for {app_id}: {str(e)}")
            return None

    def scrape_reviews(self, app_id, count=1000):
        """Scrape reviews for a specific app with retry mechanism"""
        for attempt in range(self.max_retries):
            try:
                result, _ = reviews(
                    app_id,
                    lang=self.lang,
                    country=self.country,
                    sort=Sort.NEWEST,
                    count=count,
                    filter_score_with=None
                )
                print(f"Successfully scraped {len(result)} reviews for {app_id}")
                return result
            except Exception as e:
                print(f"Attempt {attempt + 1} failed: {str(e)}")
                if attempt < self.max_retries - 1:
                    print("Retrying in 5 seconds...")
                    time.sleep(5)
                else:
                    print(f"Failed after {self.max_retries} attempts")
                    return []

    @staticmethod
    def is_english(text):
        """Return True if the text is detected as English"""
        try:
            return detect(text) == 'en'
        except:
            return False

    def process_reviews(self, reviews_data, bank_code):
        """Convert raw reviews into structured format and filter English reviews"""
        processed = []
        for review in reviews_data:
            review_text = review.get('content', '')
            if not self.is_english(review_text):
                continue  # Skip non-English reviews

            processed.append({
                'review_id': review.get('reviewId', ''),
                'review_text': review_text,
                'rating': review.get('score', 0),
                'review_date': review.get('at', datetime.now()),
                'user_name': review.get('userName', 'Anonymous'),
                'thumbs_up': review.get('thumbsUpCount', 0),
                'reply_content': review.get('replyContent', None),
                'bank_code': bank_code,
                'bank_name': self.bank_names[bank_code],
                'app_id': review.get('reviewCreatedVersion', 'N/A'),
                'source': 'Google Play'
            })
        return processed

    def scrape_all_banks(self):
        """Orchestrate scraping and save results"""
        all_reviews = []
        app_info_list = []

        print("=" * 60)
        print("Starting Google Play Store Review Scraper")
        print("=" * 60)

        # --- Phase 1: Fetch App Info ---
        print("\n[1/2] Fetching app information...")
        for bank_code, app_id in self.app_ids.items():
            info = self.get_app_info(app_id)
            if info:
                info['bank_code'] = bank_code
                info['bank_name'] = self.bank_names[bank_code]
                app_info_list.append(info)
                print(f"{self.bank_names[bank_code]} - Rating: {info['score']} / Reviews: {info['reviews']}")

        if app_info_list:
            os.makedirs(DATA_PATHS['raw'], exist_ok=True)
            pd.DataFrame(app_info_list).to_csv(f"{DATA_PATHS['raw']}/app_info.csv", index=False)
            print(f"App info saved to {DATA_PATHS['raw']}/app_info.csv")

        # --- Phase 2: Scrape Reviews ---
        print("\n[2/2] Scraping reviews...")
        for bank_code, app_id in tqdm(self.app_ids.items(), desc="Banks"):
            reviews_data = self.scrape_reviews(app_id, self.reviews_per_bank)
            if reviews_data:
                processed = self.process_reviews(reviews_data, bank_code)
                all_reviews.extend(processed)
            time.sleep(2)  # Polite delay

        if all_reviews:
            df = pd.DataFrame(all_reviews)
            os.makedirs(DATA_PATHS['raw'], exist_ok=True)
            df.to_csv(DATA_PATHS['raw_reviews'], index=False)
            print(f"\nTotal reviews collected: {len(df)}")
            print(f"Saved to: {DATA_PATHS['raw_reviews']}")
            return df
        else:
            print("\nNo reviews collected!")
            return pd.DataFrame()

    def display_sample_reviews(self, df, n=3):
        """Print sample reviews for each bank"""
        for bank_code in self.bank_names.keys():
            bank_df = df[df['bank_code'] == bank_code]
            if not bank_df.empty:
                print(f"\n{self.bank_names[bank_code]} Sample Reviews:")
                for _, row in bank_df.head(n).iterrows():
                    print(f"- Rating: {row['rating']} | Review: {row['review_text'][:100]}...")

def main():
    scraper = PlayStoreScraper()
    df = scraper.scrape_all_banks()
    if not df.empty:
        scraper.display_sample_reviews(df)
    return df

if __name__ == "__main__":
    reviews_df = main()
