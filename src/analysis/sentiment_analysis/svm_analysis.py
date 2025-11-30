import os
import sys
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import classification_report
import joblib
import nltk

# ------------------------------
# Dynamic path setup for src
# ------------------------------
project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
src_path = os.path.join(project_root, "src")
if src_path not in sys.path:
    sys.path.append(src_path)

# ------------------------------
# SVM Sentiment Analysis Module
# ------------------------------

def train_svm_sentiment(df: pd.DataFrame, text_column='review_text', label_column='rating', save_model_path=None):
    """
    Train an SVM model for sentiment classification based on review text.
    
    Parameters:
    - df: DataFrame containing reviews and labels
    - text_column: name of the column with review text
    - label_column: column to use as labels (we can bin ratings into sentiment)
    - save_model_path: path to save the trained model (optional)
    
    Returns:
    - model: trained LinearSVC model
    - vectorizer: fitted TF-IDF vectorizer
    - label_encoder: fitted label encoder
    """
    
    # 1️ Map ratings to sentiment labels
    def rating_to_sentiment(r):
        if r <= 2:
            return 'negative'
        elif r == 3:
            return 'neutral'
        else:
            return 'positive'
    
    df['sentiment_label'] = df[label_column].apply(rating_to_sentiment)
    
    # 2️ Encode labels
    le = LabelEncoder()
    y = le.fit_transform(df['sentiment_label'])
    
    # 3️ TF-IDF Vectorization
    vectorizer = TfidfVectorizer(max_features=5000, ngram_range=(1,2))
    X = vectorizer.fit_transform(df[text_column].astype(str))
    
    # 4️ Train/Test split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)
    
    # 5️ Train SVM
    model = LinearSVC()
    model.fit(X_train, y_train)
    
    # 6️ Evaluate
    y_pred = model.predict(X_test)
    print("Classification Report:\n")
    print(classification_report(y_test, y_pred, target_names=le.classes_))
    
    # 7️ Save model/vectorizer if path provided
    if save_model_path:
        os.makedirs(save_model_path, exist_ok=True)
        joblib.dump(model, os.path.join(save_model_path, 'svm_model.joblib'))
        joblib.dump(vectorizer, os.path.join(save_model_path, 'tfidf_vectorizer.joblib'))
        joblib.dump(le, os.path.join(save_model_path, 'label_encoder.joblib'))
    
    return model, vectorizer, le

def predict_svm_sentiment(df: pd.DataFrame, model, vectorizer, label_encoder, text_column='review_text'):
    """
    Predict sentiment for new reviews using a trained SVM model.
    
    Returns DataFrame with sentiment scores and labels.
    """
    X = vectorizer.transform(df[text_column].astype(str))
    y_pred = model.predict(X)
    df['sentiment_label_svm'] = label_encoder.inverse_transform(y_pred)
    return df

def aggregate_svm_sentiment(df: pd.DataFrame, group_by_cols=['bank_name', 'rating']):
    """
    Aggregate predicted SVM sentiment counts by bank/rating.
    """
    agg_df = df.groupby(group_by_cols + ['sentiment_label_svm']).size().unstack(fill_value=0).reset_index()
    return agg_df

# ------------------------------
# Example usage if run as script
# ------------------------------
if __name__ == "__main__":
    csv_path = os.path.join(project_root, 'data', 'processed', 'reviews_processed.csv')
    df = pd.read_csv(csv_path)
    
    model, vectorizer, le = train_svm_sentiment(df)
    df = predict_svm_sentiment(df, model, vectorizer, le)
    agg_df = aggregate_svm_sentiment(df)
    
    print(df[['bank_name', 'review_text', 'sentiment_label_svm']].head())
    print(agg_df)
