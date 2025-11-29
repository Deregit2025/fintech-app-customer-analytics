import os
import sys
import pandas as pd
from nltk.sentiment import SentimentIntensityAnalyzer
import nltk

# ------------------------------
# Dynamic path setup for src
# ------------------------------
# Add project root to sys.path dynamically so imports work from anywhere
project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
src_path = os.path.join(project_root, "src")
if src_path not in sys.path:
    sys.path.append(src_path)

# ------------------------------
# Ensure VADER lexicon is downloaded
# ------------------------------
nltk.download('vader_lexicon')

# ------------------------------
# VADER Sentiment Analysis
# ------------------------------
def analyze_vader_sentiment(df: pd.DataFrame, review_column: str = 'review') -> pd.DataFrame:
    """
    Add VADER sentiment score and label to a DataFrame.
    
    Parameters:
    - df: pd.DataFrame containing reviews
    - review_column: column name with review text
    
    Returns:
    - DataFrame with two new columns: 'sentiment_score_vader', 'sentiment_label_vader'
    """
    sia = SentimentIntensityAnalyzer()
    
    # Compute sentiment score (compound)
    df['sentiment_score_vader'] = df[review_column].apply(lambda x: sia.polarity_scores(str(x))['compound'])
    
    # Assign sentiment label based on compound score
    def label_sentiment(score):
        if score >= 0.05:
            return 'positive'
        elif score <= -0.05:
            return 'negative'
        else:
            return 'neutral'
    
    df['sentiment_label_vader'] = df['sentiment_score_vader'].apply(label_sentiment)
    
    return df

# ------------------------------
# Aggregate sentiment by bank/rating
# ------------------------------
def aggregate_sentiment(df: pd.DataFrame, group_by_cols: list = ['bank', 'rating']) -> pd.DataFrame:
    """
    Aggregate sentiment scores by specified columns.
    
    Parameters:
    - df: DataFrame with 'sentiment_score_vader'
    - group_by_cols: list of columns to group by
    
    Returns:
    - Aggregated DataFrame with mean sentiment scores and counts
    """
    agg_df = df.groupby(group_by_cols).agg(
        mean_sentiment=('sentiment_score_vader', 'mean'),
        count=('sentiment_score_vader', 'count')
    ).reset_index()
    
    return agg_df

# ------------------------------
# Example usage if run as script
# ------------------------------
if __name__ == "__main__":
    csv_path = os.path.join(project_root, 'data', 'processed', 'reviews_processed.csv')
    df = pd.read_csv(csv_path)
    
    # Run VADER analysis
    df = analyze_vader_sentiment(df)
    
    # Aggregate by bank and rating
    agg_df = aggregate_sentiment(df)
    
    # Print sample results
    print(df[['bank', 'review', 'sentiment_score_vader', 'sentiment_label_vader']].head())
    print(agg_df)
