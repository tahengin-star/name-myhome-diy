#!/bin/bash
# ============================================
# Myhome DIY - Deploy Script (Mac/Linux)
# ============================================
# สคริปต์สำหรับ deploy ไปยัง GitHub Pages
# พร้อม security checks
# ============================================

set -e  # Exit on error

echo ""
echo "============================================"
echo "  Myhome DIY - Deploy Script"
echo "============================================"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "[ERROR] Git not found! Please install Git first."
    exit 1
fi

echo "[1/6] Checking Git status..."
if ! git status &> /dev/null; then
    echo "[ERROR] Not a Git repository!"
    echo "Run: git init"
    exit 1
fi

echo "[OK] Git repository found."
echo ""

# ============================================
# Security Checks
# ============================================

echo "[2/6] Running security checks..."
echo ""

# Check for .py files
echo "Checking for Python files (.py)..."
if git ls-files | grep -i "\.py$" > /dev/null; then
    echo ""
    echo "[WARNING] Python files detected:"
    git ls-files | grep -i "\.py$"
    echo ""
    echo "These files contain backend code and should NOT be deployed!"
    echo "Please add them to .gitignore"
    echo ""
    read -p "Continue anyway? (yes/no): " CONTINUE
    if [ "$CONTINUE" != "yes" ]; then
        echo "Deploy cancelled."
        exit 1
    fi
fi

# Check for .env files
echo "Checking for .env files..."
if git ls-files | grep -i "\.env" > /dev/null; then
    echo ""
    echo "[ERROR] .env files detected! These contain secrets!"
    git ls-files | grep -i "\.env"
    echo ""
    echo "STOP! Add these to .gitignore immediately!"
    exit 1
fi

# Check for common secret patterns
echo "Checking for potential secrets..."
if git diff --cached | grep -i "api_key\|password\|secret\|token" > /dev/null; then
    echo ""
    echo "[WARNING] Potential secrets detected in staged changes!"
    echo "Please review your code for hardcoded secrets."
    echo ""
    read -p "Continue anyway? (yes/no): " CONTINUE
    if [ "$CONTINUE" != "yes" ]; then
        echo "Deploy cancelled."
        exit 1
    fi
fi

echo "[OK] Security checks passed."
echo ""

# ============================================
# Git Operations
# ============================================

echo "[3/6] Checking for changes..."
git status --short
echo ""

read -p "Enter commit message (or press Enter for default): " COMMIT_MSG
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Update website"
fi

echo ""
echo "[4/6] Staging files..."
git add .

echo "[5/6] Committing changes..."
if ! git commit -m "$COMMIT_MSG"; then
    echo ""
    echo "[INFO] No changes to commit or commit failed."
    echo ""
fi

echo "[6/6] Pushing to GitHub..."
if git push origin main; then
    echo ""
    echo "============================================"
    echo "  Deploy Successful! ^_^"
    echo "============================================"
    echo ""
    echo "Your website will be updated in 1-2 minutes."
    echo "URL: https://yourusername.github.io/myhome-diy/"
    echo ""
    echo "Check deployment status:"
    echo "https://github.com/yourusername/myhome-diy/actions"
    echo ""
else
    echo ""
    echo "============================================"
    echo "  Deploy Failed!"
    echo "============================================"
    echo ""
    echo "Possible causes:"
    echo "- Not authenticated with GitHub"
    echo "- No remote repository configured"
    echo "- Network issues"
    echo ""
    echo "Fix:"
    echo "1. Check remote: git remote -v"
    echo "2. Configure remote: git remote add origin https://github.com/yourusername/myhome-diy.git"
    echo "3. Authenticate: git push -u origin main"
    echo ""
    exit 1
fi
