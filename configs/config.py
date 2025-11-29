"""
Configuration file for Bank Reviews Analysis Project
"""

import os

# Google Play Store App IDs (actual bank apps)
APP_IDS = {
    'CBE': os.getenv('CBE_APP_ID', 'com.combanketh.mobilebanking'),
    'BOA': os.getenv('BOA_APP_ID', 'com.boa.boaMobileBanking'),
    'Dashen': os.getenv('DASHEN_APP_ID', 'com.dashen.dashensuperapp')
}

# Bank Names Mapping
BANK_NAMES = {
    'CBE': 'Commercial Bank of Ethiopia',
    'BOA': 'Bank of Abyssinia',
    'Dashen': 'Dashen Bank'
}

# Scraping Configuration
SCRAPING_CONFIG = {
    'reviews_per_bank': int(os.getenv('REVIEWS_PER_BANK', 1000)),  # Number of reviews per bank
    'max_retries': int(os.getenv('MAX_RETRIES', 3)),              # Retry attempts if scraping fails
    'lang': 'en',                                                 # Language of reviews
    'country': 'et'                                               # Country code (Ethiopia)
}

# File Paths
DATA_PATHS = {
    'raw': 'data/raw',                                            # Folder for raw data
    'processed': 'data/processed',                                # Folder for processed data
    'raw_reviews': 'data/raw/reviews_raw.csv',                    # Raw reviews CSV
    'processed_reviews': 'data/processed/reviews_processed.csv',  # Preprocessed reviews CSV
    'sentiment_results': 'data/processed/reviews_with_sentiment.csv',  # After sentiment analysis
    'final_results': 'data/processed/reviews_final.csv'           # Final dataset with all features
}
