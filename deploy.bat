@echo off
REM ============================================
REM Myhome DIY - Deploy Script
REM ============================================
REM สคริปต์สำหรับ deploy ไปยัง GitHub Pages
REM พร้อม security checks
REM ============================================

echo.
echo ============================================
echo   Myhome DIY - Deploy Script
echo ============================================
echo.

REM Check if Git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git not found! Please install Git first.
    echo Download: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/6] Checking Git status...
git status >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Not a Git repository!
    echo Run: git init
    pause
    exit /b 1
)

echo [OK] Git repository found.
echo.

REM ============================================
REM Security Checks
REM ============================================

echo [2/6] Running security checks...
echo.

REM Check for .py files
echo Checking for Python files (.py)...
git ls-files | findstr /i "\.py$" >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [WARNING] Python files detected:
    git ls-files | findstr /i "\.py$"
    echo.
    echo These files contain backend code and should NOT be deployed!
    echo Please add them to .gitignore
    echo.
    set /p CONTINUE="Continue anyway? (yes/no): "
    if /i not "%CONTINUE%"=="yes" (
        echo Deploy cancelled.
        pause
        exit /b 1
    )
)

REM Check for .env files
echo Checking for .env files...
git ls-files | findstr /i "\.env" >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [ERROR] .env files detected! These contain secrets!
    git ls-files | findstr /i "\.env"
    echo.
    echo STOP! Add these to .gitignore immediately!
    pause
    exit /b 1
)

REM Check for common secret patterns
echo Checking for potential secrets...
git diff --cached | findstr /i "api_key password secret token" >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [WARNING] Potential secrets detected in staged changes!
    echo Please review your code for hardcoded secrets.
    echo.
    set /p CONTINUE="Continue anyway? (yes/no): "
    if /i not "%CONTINUE%"=="yes" (
        echo Deploy cancelled.
        pause
        exit /b 1
    )
)

echo [OK] Security checks passed.
echo.

REM ============================================
REM Git Operations
REM ============================================

echo [3/6] Checking for changes...
git status --short
echo.

set /p COMMIT_MSG="Enter commit message (or press Enter for default): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Update website

echo.
echo [4/6] Staging files...
git add .

echo [5/6] Committing changes...
git commit -m "%COMMIT_MSG%"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [INFO] No changes to commit or commit failed.
    echo.
)

echo [6/6] Pushing to GitHub...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ============================================
    echo   Deploy Successful! ^_^
    echo ============================================
    echo.
    echo Your website will be updated in 1-2 minutes.
    echo URL: https://yourusername.github.io/myhome-diy/
    echo.
    echo Check deployment status:
    echo https://github.com/yourusername/myhome-diy/actions
    echo.
) else (
    echo.
    echo ============================================
    echo   Deploy Failed!
    echo ============================================
    echo.
    echo Possible causes:
    echo - Not authenticated with GitHub
    echo - No remote repository configured
    echo - Network issues
    echo.
    echo Fix:
    echo 1. Check remote: git remote -v
    echo 2. Configure remote: git remote add origin https://github.com/yourusername/myhome-diy.git
    echo 3. Authenticate: git push -u origin main
    echo.
)

pause
