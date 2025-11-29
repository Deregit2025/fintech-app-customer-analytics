import sys
import os
import unittest
import pandas as pd

# -------------------------
# Add src folder to sys.path
# -------------------------
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
src_path = os.path.join(project_root, "src")
if src_path not in sys.path:
    sys.path.append(src_path)

# Now imports will work
from analysis.keyword_extraction.frequency import extract_frequency_keywords_by_bank

# -------------------------
# Sample Unit Test
# -------------------------
class TestKeywordExtraction(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Minimal sample dataframe
        cls.df = pd.DataFrame({
            "bank_name": ["Bank A", "Bank A", "Bank B"],
            "review_text": ["Good app", "Bad login", "Fast transfer"]
        })

    def test_frequency_keywords(self):
        result = extract_frequency_keywords_by_bank(self.df, top_n=2)
        self.assertIn("Bank A", result)
        self.assertIn("Bank B", result)
        # Check that returned keywords are list of tuples
        self.assertIsInstance(result["Bank A"], list)
        self.assertTrue(all(isinstance(t, tuple) for t in result["Bank A"]))

if __name__ == "__main__":
    unittest.main()
