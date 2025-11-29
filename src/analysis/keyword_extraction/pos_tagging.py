# src/analysis/keyword_extraction/pos_tagging.py
import nltk

# Auto-download NLTK stopwords and punkt
for resource in ['punkt', 'stopwords']:
    try:
        nltk.data.find(f'tokenizers/{resource}')
    except LookupError:
        nltk.download(resource)

from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))

import spacy

# Auto-download spaCy English model if missing
try:
    nlp = spacy.load("en_core_web_sm")
except OSError:
    from spacy.cli import download
    download("en_core_web_sm")
    nlp = spacy.load("en_core_web_sm")

def extract_noun_phrases(df, text_col='review_text', top_n=20):
    all_phrases = []
    for text in df[text_col].astype(str):
        doc = nlp(text.lower())
        for np in doc.noun_chunks:
            phrase = np.text.strip()
            if phrase not in stop_words and len(phrase.split()) > 0:
                all_phrases.append(phrase)
    from collections import Counter
    counter = Counter(all_phrases)
    return counter.most_common(top_n)

def extract_noun_phrases_by_bank(df, bank_col='bank_name', text_col='review_text', top_n=20):
    banks = df[bank_col].unique()
    phrases_per_bank = {}
    for bank in banks:
        bank_df = df[df[bank_col] == bank]
        phrases_per_bank[bank] = extract_noun_phrases(bank_df, text_col, top_n)
    return phrases_per_bank
