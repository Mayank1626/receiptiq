import re
from typing import Optional

# Simple keyword mappings
CATEGORY_KEYWORDS = {
    "Groceries": ["milk", "egg", "bread", "cheese", "yogurt", "butter", "vegetable", "fruit", "meat", "chicken", "beef"],
    "Dining": ["restaurant", "cafe", "coffee", "bistro", "diner", "pizza", "burger", "sushi"],
    "Electronics": ["cable", "usb", "laptop", "phone", "mouse", "keyboard", "battery"],
    "Clothing": ["shirt", "pant", "shoe", "socks", "jacket", "dress"],
    "Household": ["paper towel", "toilet paper", "cleaner", "soap", "detergent"],
    "Health": ["pharmacy", "medicine", "vitamin", "pill", "band-aid"],
}

def categorize_item(item_name: str, existing_category: Optional[str] = None) -> str:
    """
    Returns an appropriate category for a given item name based on simple keywords.
    If an existing category is provided (and not 'OTHER' or empty), it is preserved.
    """
    if existing_category and existing_category.strip().upper() != "OTHER":
        return existing_category.strip().title()
        
    if not item_name:
        return "Uncategorized"
        
    lower_name = item_name.lower()
    
    for category, keywords in CATEGORY_KEYWORDS.items():
        for keyword in keywords:
            if re.search(r'\b' + re.escape(keyword) + r'\b', lower_name):
                return category
                
    return "Uncategorized"
