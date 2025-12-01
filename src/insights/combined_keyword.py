import pandas as pd
import os

# Base folder where processed CSVs are
base_path = os.path.join("data", "processed")

# Banks and their noun phrase files
banks = [
    "Bank of Abyssinia",
    "Commercial Bank of Ethiopia",
    "Dashen Bank"
]

combined_df = pd.DataFrame()

for bank in banks:
    filename = f"{bank}_noun_phrases.csv"  # correct file naming
    filepath = os.path.join(base_path, filename)
    
    if os.path.exists(filepath):
        df = pd.read_csv(filepath)
        
        # Standardize column name to 'keyword'
        if "noun_phrase" in df.columns:
            df = df.rename(columns={"noun_phrase": "keyword"})
        elif "keyword" in df.columns:
            pass  # already good
        else:
            print(f"No recognizable column in {filename}")
            continue

        # Add columns for bank name and source method
        df["bank_name"] = bank
        df["source_method"] = "noun_phrases"  # for now, all are noun phrases

        # Keep only relevant columns
        if "count" in df.columns:
            df = df[["bank_name", "keyword", "source_method", "count"]].rename(columns={"count": "score"})
        else:
            # if no count column, just keep keyword, bank_name, source_method
            df = df[["bank_name", "keyword", "source_method"]]
            df["score"] = 1  # default score if none

        # Append to combined DataFrame
        combined_df = pd.concat([combined_df, df], ignore_index=True)
    else:
        print(f"File not found: {filepath}")

# Save combined CSV
combined_path = os.path.join(base_path, "combined_keywords.csv")
combined_df.to_csv(combined_path, index=False)
print(f"✅ Combined keywords saved to {combined_path}")
