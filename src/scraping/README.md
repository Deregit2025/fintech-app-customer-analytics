

# 📌 **Sentiment Analysis on Customer Feedback of Ethiopian Banks**

This project performs sentiment analysis on customer reviews collected from Google Play Store for three major Ethiopian banks:

* **Commercial Bank of Ethiopia (CBE)**
* **Bank of Abyssinia (BoA)**
* **Dashen Bank**

The workflow consists of **web scraping**, **data preprocessing**, and **exploratory data analysis (EDA)**.

---

## 🚀 1. Web Scraping

### 📂 File: `scraper.py`

* Used `google_play_scraper` library.
* Scraped reviews directly from official app pages using app package IDs.
* Configured scraping settings in `configs/config.py`, including:

  ```python
  'reviews_per_bank': 5000
  'max_retries': 3
  'lang': 'en'
  'country': 'et'
  ```
* Implemented batching (200 reviews at a time) and retry logic.
* Removed hardcoded limit from function (`target_count`) and used only config-based value.
* Stored raw reviews as CSV:

  ```
  data/raw/reviews_raw.csv
  ```

✔ Successfully scraped ~5000 reviews for each bank (limited by availability).

---

## 🧹 2. Data Preprocessing

### 📂 File: `preprocessing.py`

Key preprocessing actions:

| Operation                   | Description                                             |
| --------------------------- | ------------------------------------------------------- |
| Remove duplicates           | Eliminated 2745 duplicate reviews                       |
| Handle missing data         | Removed rows with missing bank or review text           |
| Remove empty string reviews | Dropped rows where review text was blank after cleaning |
| Emoji handling              | Non-UTF emoji-like artifacts removed or decoded         |
| Language filtering          | Removed non-English reviews                             |
| Invalid ratings removed     | Ensured ratings are between 1 and 5                     |
| Final clean dataset saved   | `data/processed/reviews_processed.csv`                  |

📊 Summary output example:

```
Original records: 3050
Duplicates removed: 2745
Missing critical removed: 0
Empty reviews removed: 0
Non-English removed: 69
Invalid ratings removed: 0
Final records: 236
✓ Preprocessing completed successfully!
```

---

## 📊 3. Exploratory Data Analysis (EDA)

### 📂 Notebook: `notebooks/eda.ipynb`

Performed EDA on `data/processed/reviews_processed.csv` including:

* Dataset overview and structure check
* Review count per bank
* Rating distribution (overall and per bank)
* Review text length analysis
* Most frequent words and n-gram analysis (bigram/trigram)
* Word cloud visualization
* Sentiment distribution (if available post modeling or polarity tagging)
* Deep dive into common negative and positive feedback patterns

📈 Key visualization examples:

* Bar chart: Number of reviews per bank
* Histogram: Rating distribution
* Box plot: Review length per bank
* Word clouds: Positive vs Negative feedback keywords

---

## 📁 Project Structure

```
project-root/
│
├── configs/
│   └── config.py
│
├── data/
│   ├── raw/
│   │   └── reviews_raw.csv
│   └── processed/
│       └── reviews_processed.csv
│
├── notebooks/
│   └── eda.ipynb
│
├── src/
│   ├── scraper.py
│   └── preprocessing.py
│
├── README.md
└── .env / .env.example
```

---

## ⚙️ How to Run

```bash
# Install dependencies
pip install -r requirements.txt

# Scrape reviews
python src/scraper.py

# Run preprocessing
python src/preprocessing.py

# Open EDA notebook
jupyter notebook notebooks/eda.ipynb
```

---

