#!/bin/bash
# Git AI Quick Agent
# Simplified agent for common Git AI tasks

case "$1" in
  "status")
    if command -v git-ai &> /dev/null; then
      echo "Git AI is installed"
      git-ai status 2>/dev/null || echo "Run in a git repo for status"
    else
      echo "Git AI is not installed"
    fi
    ;;
  "setup")
    echo "Setting up Git AI in current repository..."
    if [ -d ".git" ]; then
      git-ai install-hooks
    else
      echo "Not in a git repository"
    fi
    ;;
  "troubleshoot")
    echo "Running Git AI diagnostics..."
    if command -v git-ai &> /dev/null; then
      echo "Git AI is installed at: $(which git-ai)"
      git-ai status 2>/dev/null || echo "No status available in this repo"
    else
      echo "Git AI not installed - installing..."
      curl -fsSL https://usegitai.com/install.sh | bash
    fi
    ;;
  *)
    echo "Git AI Quick Agent"
    echo "Usage: $0 {status|setup|troubleshoot}"
    echo "  status - Check Git AI status"
    echo "  setup - Install Git AI hooks in current repo"  
    echo "  troubleshoot - Run diagnostics"
    ;;
esac
