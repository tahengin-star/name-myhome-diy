# 🏠 Myhome DIY Website

> แต่งบ้าน ปลูกทุกสวย เลี้ยงลูก ใช้ของดี ชีวิตง่ายขึ้น

เว็บไซต์ครีเอเตอร์สร้างวิดีโอ - รีวิว + คัดแบรนด์ครัวมือ

[![Website Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Pages](https://img.shields.io/badge/deployed-GitHub%20Pages-blue.svg)]()
[![Security](https://img.shields.io/badge/security-hardened-green.svg)]()

---

## 📋 สารบัญ

- [คุณสมบัติ](#คุณสมบัติ)
- [Demo](#demo)
- [เทคโนโลยี](#เทคโนโลยี)
- [วิธีการติดตั้ง](#วิธีการติดตั้ง)
- [การ Deploy](#การ-deploy)
- [Security](#security)
- [โครงสร้างโปรเจกต์](#โครงสร้างโปรเจกต์)
- [License](#license)

---

## ✨ คุณสมบัติ

- 🎨 **UI/UX สวยงาม** - ดีไซน์โมเดิร์น responsive ทุกหน้าจอ
- 📱 **Mobile-First** - ใช้งานลื่นไหลบนมือถือ
- 🎥 **วิดีโอแกลเลอรี่** - แสดงวิดีโอ DIY และรีวิวสินค้า
- 🛍️ **หมวดหมู่สินค้า** - แบ่งหมวดหมู่ชัดเจน 5 กลุ่ม
- 💬 **AI Chat** (Optional) - แชทบอทตอบคำถาม
- 📊 **Dashboard** - สถิติและข้อมูลครีเอเตอร์
- 🔒 **Security Hardened** - ป้องกันตาม OWASP best practices

---

## 🌐 Demo

- **Live Demo:** `https://yourusername.github.io/myhome-diy/`
- **Facebook Page:** [Myhome Diy](https://facebook.com/yourusername)

---

## 🛠️ เทคโนโลยี

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Framework:** ไม่ใช้ framework - pure web technologies
- **Hosting:** GitHub Pages
- **Backend (Optional):** Python Flask + Hermes Agent

---

## 💾 วิธีการติดตั้ง

### ข้อกำหนด

- Git
- Web browser (Chrome, Firefox, Safari, Edge)
- Text editor (VS Code แนะนำ)

### Clone Repository

```bash
git clone https://github.com/yourusername/myhome-diy.git
cd myhome-diy
```

### เปิดในเบราว์เซอร์

**Windows:**
```bash
start index.html
```

**Mac/Linux:**
```bash
open index.html  # Mac
xdg-open index.html  # Linux
```

หรือใช้ Live Server extension ใน VS Code

---

## 🚀 การ Deploy

### วิธีที่ 1: GitHub Pages (แนะนำ - ฟรี)

#### 1. สร้าง Repository บน GitHub

```bash
# 1. สร้าง repo ใหม่บน github.com
# 2. ตั้งชื่อ: myhome-diy

# 3. เชื่อมต่อกับ local
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/myhome-diy.git
git push -u origin main
```

#### 2. เปิดใช้ GitHub Pages

1. ไปที่ **Settings** → **Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main` → `/root` → Save
4. รอ 2-3 นาที
5. เว็บจะพร้อมใช้งานที่ `https://yourusername.github.io/myhome-diy/`

#### 3. เปิด HTTPS (สำคัญ!)

- ✅ เลือก **Enforce HTTPS** ใน GitHub Pages settings

---

### วิธีที่ 2: Netlify (ทางเลือก)

1. ไปที่ [netlify.com](https://netlify.com)
2. Drag & drop โฟลเดอร์ `Myhome-DIY-Website`
3. รอ deploy เสร็จ (30 วินาที)
4. ได้ URL ฟรีทันที: `https://your-site.netlify.app`

---

### วิธีที่ 3: Vercel

```bash
npm install -g vercel
vercel --prod
```

---

## 🔒 Security

### ⚠️ คำเตือนสำคัญ

**ไฟล์เหล่านี้ ห้าม push ไป GitHub:**

- ❌ `hermes_chat_server.py` - มี path และ backend logic
- ❌ ไฟล์ `.env` - API keys
- ❌ `config.json` - credentials
- ❌ โฟลเดอร์ `venv/` - Python environment

### ✅ Security Features

- [x] `.gitignore` - ป้องกัน sensitive files
- [x] `_headers` - Security headers (CSP, X-Frame-Options, etc.)
- [x] `security.txt` - Security disclosure policy
- [x] HTTPS enforced บน GitHub Pages
- [x] No hardcoded secrets

### 📝 Security Checklist

ดูรายละเอียดครบใน: **[SECURITY-CHECKLIST.md](SECURITY-CHECKLIST.md)**

---

## 📁 โครงสร้างโปรเจกต์

```
Myhome-DIY-Website/
├── index.html              # หน้าแรก
├── services.html           # วิดีโอ & รีวิว
├── products.html           # สินค้าแนะนำ
├── contact.html            # ติดต่อเรา
├── dashboard.html          # Dashboard ครีเอเตอร์
├── chat.html               # AI Chat (Optional)
├── assets/
│   └── style.css           # CSS หลัก
├── images/
│   ├── logo-original.png   # โลโก้
│   ├── banner-original.png # แบนเนอร์
│   └── *.svg               # SVG assets
├── .gitignore              # ป้องกัน sensitive files
├── .nojekyll               # สำหรับ GitHub Pages
├── _headers                # Security headers
├── security.txt            # Security policy
├── README.md               # คู่มือนี้
├── DEPLOY.md               # คำแนะนำ deploy
└── SECURITY-CHECKLIST.md   # Security checklist
```

---

## 📦 หมวดหมู่สินค้า

1. 🏠 **ของใช้ในบ้าน** - เฟอร์นิเจอร์, ของตกแต่ง
2. 👶 **แม่และเด็ก** - ของใช้เด็ก, ของเล่น
3. 🌸 **สวน & ทุ่งหลาย** - ต้นไม้, อุปกรณ์ปลูก
4. ☕ **คาเฟ่ & อุปกรณ์** - เครื่องชงกาแฟ, ของตกแต่งคาเฟ่
5. 🎁 **ของมันส์ต้องมี** - Gadgets, ของแปลกใหม่

---

## 🔧 การพัฒนาเพิ่มเติม

### เพิ่มฟีเจอร์ใหม่

```bash
# 1. สร้าง branch ใหม่
git checkout -b feature/new-feature

# 2. แก้ไขโค้ด

# 3. Commit
git add .
git commit -m "Add new feature"

# 4. Push
git push origin feature/new-feature

# 5. สร้าง Pull Request บน GitHub
```

### ทดสอบ Local

```bash
# ใช้ Python Simple HTTP Server
python -m http.server 8000

# เปิดเบราว์เซอร์
http://localhost:8000
```

---

## 📊 สถิติ

- 👥 **ผู้ติดตาม:** 50+
- 📹 **วิดีโอวางแผน:** 30+
- 🏷️ **หมวดหมู่:** 5 กลุ่มหลัก
- 📍 **ตำแหน่ง:** Bangkok, Thailand

---

## 🤝 การมีส่วนร่วม

ยินดีรับ contributions! กรุณา:

1. Fork repository
2. สร้าง feature branch
3. Commit การเปลี่ยนแปลง
4. Push ไปยัง branch
5. สร้าง Pull Request

---

## 📝 License

Copyright © 2026 Myhome DIY. All rights reserved.

---

## 📞 ติดต่อ

- 📧 Email: contact@yourdomain.com
- 📱 Facebook: [Myhome Diy](https://facebook.com/yourusername)
- 🌐 Website: `https://yourusername.github.io/myhome-diy/`
- 📍 Location: Bangkok, Thailand

---

## 🎉 ขอบคุณ

ขอบคุณที่แวะมาเยี่ยมชมโปรเจกต์ของเรา!

**Myhome DIY** - แต่งบ้าน ปลูกทุกสวย เลี้ยงลูก ใช้ของดี ชีวิตง่ายขึ้น 🏠✨
