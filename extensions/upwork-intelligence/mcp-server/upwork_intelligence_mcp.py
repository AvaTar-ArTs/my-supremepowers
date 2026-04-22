import os
from fastmcp import FastMCP

mcp = FastMCP("upwork-intelligence")

# File paths for brand guidelines and personal bio
BRAND_GUIDELINES = os.path.expanduser("~/AVATARARTS/brand_guidelines.md")
BIO = os.path.expanduser("~/Documents/CsV/Documentation/YouTube-Content/Production/steven-bio.md")

@mcp.tool()
def draft_proposal(job_description: str, relevant_script_name: str = None):
    """
    Drafts an Upwork proposal using relevant context from brand guidelines, bio, and a referenced script.
    """
    context = ""
    if os.path.exists(BRAND_GUIDELINES):
        with open(BRAND_GUIDELINES, 'r') as f:
            context += f"Brand Context: {f.read()[:500]}\n"
    if os.path.exists(BIO):
        with open(BIO, 'r') as f:
            context += f"Bio: {f.read()[:500]}\n"
    
    relevant_tool = relevant_script_name if relevant_script_name else "Custom AI Automation Framework"
    prompt = (
        f"Draft a winning Upwork proposal for the following job:\n"
        f"{job_description[:1000]}\n\n"
        f"My Expertise Context:\n"
        f"{context if context else '[No additional context found]'}\n"
        f"Relevant Tool Mention: {relevant_tool}\n"
        f"Focus on: 2025 Creative Automation Strategy, fast delivery, and high technical maturity."
    )
    return prompt

if __name__ == "__main__":
    mcp.run()
