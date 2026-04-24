@echo off
echo ============================================================
echo  Myhome DIY - Hermes Agent Chat Server
echo ============================================================
echo.
echo Starting Chat API Server...
echo.

cd /d "%~dp0"

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)

REM Check if Flask is installed
python -c "import flask" >nul 2>&1
if errorlevel 1 (
    echo Flask not found. Installing dependencies...
    pip install flask flask-cors
    echo.
)

REM Start the server
echo Starting server on http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.
echo ============================================================
echo.

python hermes_chat_server.py

pause
