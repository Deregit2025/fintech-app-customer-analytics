# src/analysis/keyword_extraction/frequency.py
from collections import Counter
import nltk

# Auto-download required NLTK data
for resource in ['punkt', 'stopwords']:
    try:
        nltk.data.find(f'tokenizers/{resource}')
    except LookupError:
        nltk.download(resource)

from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

stop_words = set(stopwords.words('english'))

def preprocess_text(text):
    tokens = word_tokenize(str(text).lower())
    tokens = [t for t in tokens if t.isalpha() and t not in stop_words]
    return tokens

def extract_frequency_keywords(df, text_col='review_text', top_n=20):
    all_tokens = []
    for text in df[text_col]:
        all_tokens.extend(preprocess_text(text))
    counter = Counter(all_tokens)
    return counter.most_common(top_n)

def extract_frequency_keywords_by_bank(df, bank_col='bank_name', text_col='review_text', top_n=20):
    banks = df[bank_col].unique()
    bank_keywords = {}
    for bank in banks:
        bank_df = df[df[bank_col] == bank]
        bank_keywords[bank] = extract_frequency_keywords(bank_df, text_col, top_n)
    return bank_keywords
