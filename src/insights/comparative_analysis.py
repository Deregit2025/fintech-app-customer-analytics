# src/insights/comparative_analysis.py

# ======================================
# Comparative Analysis: Bank Apps
# ======================================

import os
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from wordcloud import WordCloud

sns.set_style("whitegrid")
plt.rcParams['figure.figsize'] = (10, 6)

# -----------------------------
# 1️⃣ Load Processed Data
# -----------------------------
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
preprocessed_path = os.path.join(project_root, "data/processed/reviews_processed.csv")
sentiment_path = os.path.join(project_root, "data/processed/reviews_with_vader.csv")
keywords_path = os.path.join(project_root, "data/processed/combined_keywords.csv")

# Load CSVs
df_reviews = pd.read_csv(preprocessed_path, parse_dates=['review_date'])
df_sentiment = pd.read_csv(sentiment_path, parse_dates=['review_date'])
df_keywords = pd.read_csv(keywords_path)

# -----------------------------
# 2️⃣ Average Ratings per Bank
# -----------------------------
avg_rating = df_reviews.groupby("bank_name")['rating'].mean()
print("Average Ratings per Bank:")
print(avg_rating)

plt.figure()
sns.barplot(x=avg_rating.index, y=avg_rating.values, palette="viridis")
plt.title("Average Ratings per Bank")
plt.ylabel("Average Rating")
plt.xlabel("Bank")
plt.ylim(0,5)
plt.show()

# -----------------------------
# 3️⃣ Sentiment Distribution per Bank
# -----------------------------
sentiment_counts = df_sentiment.groupby("bank_name")['sentiment_label_vader'].value_counts().unstack().fillna(0)
print("Sentiment Counts per Bank:")
print(sentiment_counts)

sentiment_counts.plot(kind='bar', stacked=True, colormap='viridis')
plt.title("Sentiment Distribution per Bank")
plt.ylabel("Number of Reviews")
plt.xlabel("Bank")
plt.xticks(rotation=45)
plt.show()

# -----------------------------
# 4️⃣ Reviews Over Time (Monthly)
# -----------------------------
df_sentiment['year_month'] = df_sentiment['review_date'].dt.to_period('M')
monthly_counts = df_sentiment.groupby(['bank_name','year_month']).size().unstack(fill_value=0)

monthly_counts.T.plot(marker='o')
plt.title("Monthly Review Counts per Bank")
plt.ylabel("Number of Reviews")
plt.xlabel("Month-Year")
plt.xticks(rotation=45)
plt.show()

# -----------------------------
# 5️⃣ WordClouds of Keywords (Drivers/Pain Points)
# -----------------------------
for bank in df_keywords['bank_name'].unique():
    df_bank = df_keywords[df_keywords['bank_name'] == bank]
    # Using 'keyword' column for phrases
    text = " ".join(df_bank['keyword'].astype(str))
    wordcloud = WordCloud(width=800, height=400, background_color='white').generate(text)
    
    plt.figure(figsize=(10,5))
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis("off")
    plt.title(f"WordCloud of Key Drivers/Pain Points for {bank}")
    plt.show()

# -----------------------------
# 6️⃣ Top Keywords per Bank (Optional Table)
# -----------------------------
for bank in df_keywords['bank_name'].unique():
    df_bank = df_keywords[df_keywords['bank_name'] == bank]
    top_keywords = df_bank.sort_values('score', ascending=False).head(10)
    print(f"\nTop 10 Keywords for {bank}:")
    print(top_keywords[['keyword', 'score']])
