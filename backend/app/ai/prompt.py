PROMPT_VERSION = "receipt-v1"

EXTRACTION_PROMPT = """
You are an expert AI assistant that extracts structured data from receipts.
Given the following raw OCR text, extract the store name, date, subtotal, tax, and total amount.
Output only valid JSON.
"""
