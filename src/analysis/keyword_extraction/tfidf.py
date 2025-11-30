# src/analysis/keyword_extraction/tfidf.py
import nltk
from sklearn.feature_extraction.text import TfidfVectorizer

# Ensure stopwords downloaded
try:
    nltk.data.find('corpora/stopwords')
except LookupError:
    nltk.download('stopwords')

from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))

def extract_tfidf_keywords_by_bank(df, bank_col='bank_name', text_col='review_text', top_n=20):
    banks = df[bank_col].unique()
    tfidf_keywords = {}
    for bank in banks:
        bank_df = df[df[bank_col] == bank]
        tfidf = TfidfVectorizer(stop_words=stop_words, ngram_range=(1,2))
        tfidf_matrix = tfidf.fit_transform(bank_df[text_col].astype(str))
        scores = dict(zip(tfidf.get_feature_names_out(), tfidf.idf_))
        sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
        tfidf_keywords[bank] = sorted_scores[:top_n]
    return tfidf_keywords
      