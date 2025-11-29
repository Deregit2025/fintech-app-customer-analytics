# src/analysis/keyword_extraction/topic_modelling.py
import nltk
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.decomposition import LatentDirichletAllocation

# Ensure stopwords downloaded
try:
    nltk.data.find('corpora/stopwords')
except LookupError:
    nltk.download('stopwords')

from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))

def lda_topics_by_bank(df, bank_col='bank_name', text_col='review_text', n_topics=5, n_top_words=10):
    banks = df[bank_col].unique()
    topics_per_bank = {}
    
    for bank in banks:
        bank_df = df[df[bank_col] == bank]
        vectorizer = CountVectorizer(stop_words=stop_words)
        dtm = vectorizer.fit_transform(bank_df[text_col].astype(str))
        lda = LatentDirichletAllocation(n_components=n_topics, random_state=42)
        lda.fit(dtm)
        feature_names = vectorizer.get_feature_names_out()
        bank_topics = {}
        for idx, topic in enumerate(lda.components_):
            top_words = [feature_names[i] for i in topic.argsort()[:-n_top_words - 1:-1]]
            bank_topics[f"Topic_{idx+1}"] = top_words
        topics_per_bank[bank] = bank_topics
    return topics_per_bank
