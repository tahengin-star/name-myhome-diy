@echo off
chcp 65001 >nul
color 0A
title 🏠 Myhome DIY - เพิ่มสินค้า

echo.
echo ╔════════════════════════════════════════════════╗
echo ║     🏠 Myhome DIY - เพิ่มสินค้าใหม่           ║
echo ╚════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

:menu
echo 📋 เมนู:
echo   1. เพิ่มสินค้าจาก URL
echo   2. ดูรายการสินค้าทั้งหมด
echo   3. ดู Dashboard
echo   4. สร้าง Script สำหรับวิดีโอ
echo   5. Deploy สินค้าขึ้นเว็บ
echo   6. ออกจากโปรแกรม
echo.

set /p choice="เลือก (1-6): "

if "%choice%"=="1" goto add_product
if "%choice%"=="2" goto list_products
if "%choice%"=="3" goto dashboard
if "%choice%"=="4" goto generate_script
if "%choice%"=="5" goto deploy
if "%choice%"=="6" goto end
goto menu

:add_product
echo.
echo 🔗 กรอก URL สินค้า (Shopee/Lazada):
set /p url="URL: "
echo.
echo 📦 เลือกหมวดหมู่:
echo   1. home (🏠 ของใช้ในบ้าน)
echo   2. baby (👶 แม่และเด็ก)
echo   3. garden (🌸 สวนกุหลาบ)
echo   4. cafe (☕ คาเฟ่ ^& อุปกรณ์)
echo   5. musthave (🎁 ของมันส์ต้องมี)
set /p cat="เลือก (1-5): "

if "%cat%"=="1" set category=home
if "%cat%"=="2" set category=baby
if "%cat%"=="3" set category=garden
if "%cat%"=="4" set category=cafe
if "%cat%"=="5" set category=musthave

echo.
echo ⏳ กำลังเพิ่มสินค้า...
python cli.py add-product "%url%" --category %category%
echo.
pause
goto menu

:list_products
echo.
python cli.py list
echo.
pause
goto menu

:dashboard
echo.
python cli.py dashboard
echo.
pause
goto menu

:generate_script
echo.
set /p prod_id="กรอก Product ID: "
echo.
echo ⏳ กำลังสร้าง script...
python cli.py generate-script %prod_id%
echo.
pause
goto menu

:deploy
echo.
echo 🚀 กำลัง Deploy ขึ้นเว็บ...
echo.
python cli.py update-site
echo.
echo ✅ เสร็จสิ้น! ตรวจสอบที่:
echo 🌐 https://tahengin-star.github.io/name-myhome-diy/products.html
echo.
pause
goto menu

:end
echo.
echo 👋 ขอบคุณที่ใช้งาน Myhome DIY!
timeout /t 2 >nul
exit
