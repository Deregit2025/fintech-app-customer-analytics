"""
Full Google Play Store Review Scraper (complete)

- Uses SCRAPING_CONFIG from configs.config
- Pagination with continuation_token
- English-only filtering using langdetect
- Deduplication using reviewId
- Saves app info and combined raw reviews CSV to DATA_PATHS
"""

import os
import sys
import time
from datetime import datetime
import pandas as pd
from google_play_scraper import app, Sort, reviews
from tqdm import tqdm
from langdetect import detect, DetectorFactory, LangDetectException

# Keep language detection deterministic
DetectorFactory.seed = 0

# Allow importing configs when running from project root or src folder
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
from configs.config import APP_IDS, BANK_NAMES, SCRAPING_CONFIG, DATA_PATHS


class PlayStoreScraper:
    def __init__(self):
        # Load config values
        self.app_ids = APP_IDS
        self.bank_names = BANK_NAMES
        self.target_per_bank = SCRAPING_CONFIG.get('reviews_per_bank', 500)
        self.max_retries = SCRAPING_CONFIG.get('max_retries', 3)
        self.lang = SCRAPING_CONFIG.get('lang', 'en')
        self.country = SCRAPING_CONFIG.get('country', 'et')

        # runtime state
        self.batch_size = 200  # number of reviews requested per API call
        self.req_delay = 1.0   # seconds between page requests (politeness)

    def get_app_info(self, app_id):
        """Fetch app metadata from Google Play."""
        try:
            info = app(app_id, lang=self.lang, country=self.country)
            return {
                'app_id': app_id,
                'title': info.get('title', 'N/A'),
                'score': info.get('score', 0),
                'ratings': info.get('ratings', 0),
                'reviews': info.get('reviews', 0),
                'installs': info.get('installs', 'N/A')
            }
        except Exception as e:
            print(f"Error fetching app info for {app_id}: {e}")
            return None

    def is_english(self, text):
        """Return True if text is detected as English. Handles short text safely."""
        if not text or not isinstance(text, str):
            return False
        # short texts can produce wrong results — require minimum length for reliable detection
        try:
            return detect(text) == 'en'
        except LangDetectException:
            return False
        except Exception:
            return False

    def scrape_reviews(self, app_id):
        """
        Paginated scraping using continuation_token. Returns list of unique review dicts (raw).
        Respects self.target_per_bank (from config).
        """
        target = int(self.target_per_bank)
        all_reviews = []
        seen_ids = set()
        continuation_token = None
        attempts = 0

        print(f"\n🔍 Scraping '{app_id}' (target={target})")

        # Outer retry loop in case of intermittent errors
        while len(all_reviews) < target and attempts < self.max_retries:
            try:
                # request loop (pages) — continues until target reached or no more pages
                while len(all_reviews) < target:
                    # compute fetch_count per request (don't request more than needed)
                    remaining = target - len(all_reviews)
                    fetch_count = min(self.batch_size, remaining)

                    result, continuation_token = reviews(
                        app_id,
                        lang=self.lang,
                        country=self.country,
                        sort=Sort.NEWEST,
                        count=fetch_count,
                        continuation_token=continuation_token
                    )

                    if not result:
                        # nothing returned -> no more reviews
                        print("📌 No more reviews returned by Google Play for this app.")
                        break

                    # iterate returned reviews and add only new (by reviewId) and english
                    newly_added = 0
                    for r in result:
                        rid = r.get('reviewId')
                        if not rid:
                            continue
                        if rid in seen_ids:
                            continue
                        # keep raw entry, we'll filter to English/processing later OR filter now:
                        # perform quick language filter now to reduce volume (optional)
                        content = r.get('content', '')
                        if not self.is_english(content):
                            continue
                        seen_ids.add(rid)
                        all_reviews.append(r)
                        newly_added += 1

                    print(f"📥 Page fetched: {len(result)} rows, new unique English reviews: {newly_added}, total collected: {len(all_reviews)}")

                    # no new unique reviews added this page -> likely exhausted or repeating
                    if newly_added == 0:
                        print("⚠️ No new unique English reviews found on this page — stopping pagination for this app.")
                        break

                    # stop if continuation_token is None (no next page)
                    if not continuation_token:
                        print("📌 continuation_token is None — reached end of available pages.")
                        break

                    # polite pause between pages
                    time.sleep(self.req_delay)

                # if we exit inner loop, break out of outer retry loop
                break

            except Exception as e:
                attempts += 1
                print(f"❌ Error during scraping page: {e} (attempt {attempts}/{self.max_retries})")
                if attempts >= self.max_retries:
                    print("⛔ Max retries reached. Stopping scraping for this app.")
                    break
                else:
                    print("🔁 Waiting 5s before retrying...")
                    time.sleep(5)

        print(f"🎯 Finished scraping {app_id}: collected {len(all_reviews)} unique English reviews (target was {target})")
        return all_reviews[:target]

    def process_reviews(self, raw_reviews, bank_code):
        """
        Convert raw review dicts to structured rows for dataframe.
        Keeps only desired fields and normalizes missing values.
        """
        processed = []
        for r in raw_reviews:
            # ensure content exists
            content = r.get('content', '') or ''
            processed.append({
                'review_id': r.get('reviewId', ''),
                'review_text': content,
                'rating': r.get('score', None),
                'review_date': r.get('at', None),
                'user_name': r.get('userName', 'Anonymous'),
                'thumbs_up': r.get('thumbsUpCount', 0),
                'reply_content': r.get('replyContent', None),
                'bank_code': bank_code,
                'bank_name': self.bank_names.get(bank_code, bank_code),
                'app_id': r.get('reviewCreatedVersion', 'N/A'),
                'source': 'Google Play'
            })
        return processed

    def scrape_all_banks(self):
        """
        Orchestrate scraping across configured banks, save app info and combined raw reviews csv.
        """
        combined = []
        app_info_list = []

        print("=" * 60)
        print("Starting scraping for all configured banks")
        print("=" * 60)

        # Phase 1: app metadata
        print("\n[1/2] Fetching app metadata...")
        for bank_code, app_id in self.app_ids.items():
            info = self.get_app_info(app_id)
            if info:
                info['bank_code'] = bank_code
                info['bank_name'] = self.bank_names.get(bank_code, 'Unknown')
                app_info_list.append(info)
                print(f"• {bank_code}: {info['title']} | rating={info['score']} | reviews={info['reviews']}")

        # save app info
        if app_info_list:
            os.makedirs(DATA_PATHS['raw'], exist_ok=True)
            app_info_path = os.path.join(DATA_PATHS['raw'], 'app_info.csv')
            pd.DataFrame(app_info_list).to_csv(app_info_path, index=False)
            print(f"Saved app info -> {app_info_path}")

        # Phase 2: scrape reviews per bank
        print("\n[2/2] Scraping reviews per bank...")
        for bank_code, app_id in tqdm(self.app_ids.items(), desc="Banks"):
            raw = self.scrape_reviews(app_id)
            if raw:
                processed = self.process_reviews(raw, bank_code)
                combined.extend(processed)
            # short pause between apps
            time.sleep(1.0)

        # final dedupe & save
        if combined:
            df = pd.DataFrame(combined)
            # normalize review_date to ISO strings where possible
            if 'review_date' in df.columns:
                try:
                    df['review_date'] = pd.to_datetime(df['review_date'])
                except Exception:
                    pass

            # drop duplicates by review_id (safety)
            if 'review_id' in df.columns:
                before = len(df)
                df = df.drop_duplicates(subset=['review_id'])
                removed = before - len(df)
                if removed > 0:
                    print(f"Removed {removed} duplicate rows by review_id during final dedupe.")

            os.makedirs(os.path.dirname(DATA_PATHS['raw_reviews']), exist_ok=True)
            df.to_csv(DATA_PATHS['raw_reviews'], index=False)
            print(f"\nSaved combined raw reviews -> {DATA_PATHS['raw_reviews']} (total {len(df)})")
            return df

        print("\nNo reviews collected across banks.")
        return pd.DataFrame()

    def display_sample_reviews(self, df, n=3):
        """Print a few sample reviews per bank to sanity-check collected data."""
        if df is None or df.empty:
            print("No data to display.")
            return

        for bank_code in self.bank_names.keys():
            bank_df = df[df['bank_code'] == bank_code]
            if bank_df.empty:
                print(f"\n{bank_code}: No reviews collected.")
                continue

            print(f"\nSample reviews for {self.bank_names.get(bank_code, bank_code)} ({len(bank_df)} reviews):")
            for _, row in bank_df.head(n).iterrows():
                rd = row.get('review_date')
                rd_str = rd.isoformat() if hasattr(rd, 'isoformat') else str(rd)
                print(f"- [{row.get('rating')}] {rd_str} — {row.get('review_text')[:120]}...")



def main():
    scraper = PlayStoreScraper()
    df = scraper.scrape_all_banks()
    if not df.empty:
        scraper.display_sample_reviews(df)
    return df


if __name__ == "__main__":
    reviews_df = main()
