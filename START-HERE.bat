@echo off
echo ============================================================
echo  Myhome DIY - Quick Start
echo ============================================================
echo.
echo  Option 1: Start Chat Server
echo  Option 2: Open Website
echo  Option 3: Both (Recommended)
echo  Option 4: Exit
echo.
echo ============================================================
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto start_server
if "%choice%"=="2" goto open_website
if "%choice%"=="3" goto start_both
if "%choice%"=="4" goto end

echo Invalid choice. Please try again.
pause
goto end

:start_server
echo.
echo Starting Chat Server...
start "Hermes Chat Server" cmd /k "cd /d "%~dp0" && start-chat-server.bat"
echo Server started in new window!
pause
goto end

:open_website
echo.
echo Opening Website...
start index.html
echo Website opened in browser!
pause
goto end

:start_both
echo.
echo Starting Chat Server...
start "Hermes Chat Server" cmd /k "cd /d "%~dp0" && start-chat-server.bat"
timeout /t 3 /nobreak >nul
echo.
echo Opening Website...
start chat.html
echo.
echo ============================================================
echo  All set! You can now chat with Hermes Agent
echo ============================================================
pause
goto end

:end
exit
