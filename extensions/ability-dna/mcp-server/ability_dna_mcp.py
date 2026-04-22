import json
import os
import csv
import sys
from fastmcp import FastMCP

# Initialize FastMCP server
mcp = FastMCP("ability-dna")

# Base path for your ability CSVs
BASE_DIR = os.path.expanduser("~")

@mcp.tool()
def search_abilities(query: str, category: str = None):
    """
    Search your Python script library by 'Ability' (functions, classes, imports).
    Query can be a function name, import, or keyword.
    """
    results = []
    
    # Files to search
    files = [f for f in os.listdir(BASE_DIR) if f.startswith("Ability_Preview_") and f.endswith(".csv")]
    
    if category:
        files = [f for f in files if category.lower() in f.lower()]

    for file in files:
        cat_name = file.replace("Ability_Preview_", "").replace(".csv", "")
        file_path = os.path.join(BASE_DIR, file)
        
        with open(file_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                # Search across Tool_Name, Functions, Classes, and Imports
                match_text = f"{row['Tool_Name']} {row['Functions']} {row['Classes']} {row['Imports']}".lower()
                if query.lower() in match_text:
                    row['Category'] = cat_name
                    results.append(row)
                    
    # Return top 15 results
    return results[:15]

if __name__ == "__main__":
    mcp.run()
