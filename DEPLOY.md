# 🚀 คู่มือ Deploy - Myhome DIY Website

## 📋 เลือกวิธี Deploy

- [GitHub Pages](#-github-pages-แนะนำ---ฟรี-ถาวร) ⭐ แนะนำ
- [Netlify](#-netlify---ง่ายที่สุด)
- [Vercel](#-vercel)
- [Local Testing](#-ทดสอบ-local)

---

## 🌟 GitHub Pages (แนะนำ - ฟรี, ถาวร)

### ข้อดี
- ✅ ฟรี 100%
- ✅ HTTPS อัตโนมัติ
- ✅ Custom domain ได้
- ✅ Unlimited bandwidth
- ✅ อัพเดทง่าย (push code ใหม่)

### ข้อกำหนด
- GitHub account
- Git ติดตั้งบนเครื่อง

---

### 📝 ขั้นตอนที่ 1: ตรวจสอบ Security

**⚠️ สำคัญที่สุด!** อ่านและทำตาม: **[SECURITY-CHECKLIST.md](SECURITY-CHECKLIST.md)**

```bash
# เช็คว่าไฟล์อะไรจะถูก push
git status

# ตรวจสอบว่าไม่มีไฟล์ .py หรือ .env
git ls-files | findstr /i ".py .env config.json"
```

ถ้าเจอไฟล์ sensitive → แก้ไข `.gitignore` ก่อน!

---

### 📝 ขั้นตอนที่ 2: สร้าง GitHub Repository

#### A. สร้าง Repo บน GitHub.com

1. ไปที่ https://github.com/new
2. **Repository name:** `myhome-diy` (หรือชื่ออื่นที่ชอบ)
3. **Description:** "Myhome DIY - แต่งบ้าน ปลูกทุกสวย เลี้ยงลูก ใช้ของดี"
4. **Public** หรือ **Private** (ถ้า Private จะใช้ได้ถ้ามี GitHub Pro)
5. **ไม่ต้อง** เลือก "Add README" (เรามีแล้ว)
6. คลิก **Create repository**

#### B. เชื่อมต่อ Local กับ GitHub

```bash
# 1. ไปที่โฟลเดอร์เว็บไซต์
cd c:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website

# 2. Initialize Git (ถ้ายังไม่ได้ทำ)
git init

# 3. เพิ่มไฟล์ทั้งหมด
git add .

# 4. Commit
git commit -m "Initial commit: Myhome DIY website with security"

# 5. เปลี่ยน branch เป็น main
git branch -M main

# 6. เชื่อมต่อกับ GitHub (แก้ yourusername เป็นของคุณ)
git remote add origin https://github.com/yourusername/myhome-diy.git

# 7. Push code ขึ้น GitHub
git push -u origin main
```

**หมายเหตุ:** ครั้งแรกอาจต้องใส่ username/password หรือ personal access token

---

### 📝 ขั้นตอนที่ 3: เปิดใช้ GitHub Pages

1. ไปที่ repository บน GitHub
2. คลิก **Settings** (ขวาบน)
3. เลื่อนลงหา **Pages** (เมนูซ้าย)
4. ที่ **Source:**
   - เลือก **Deploy from a branch**
5. ที่ **Branch:**
   - เลือก `main`
   - เลือก `/root`
   - คลิก **Save**
6. รอ 2-3 นาที
7. Refresh หน้า → จะเห็น URL: `https://yourusername.github.io/myhome-diy/`

---

### 📝 ขั้นตอนที่ 4: เปิด HTTPS (สำคัญ!)

ใน Settings → Pages:
- ✅ เลือก **Enforce HTTPS**

---

### 📝 ขั้นตอนที่ 5: ทดสอบเว็บไซต์

เปิดเบราว์เซอร์ไปที่: `https://yourusername.github.io/myhome-diy/`

**ตรวจสอบ:**
- [ ] หน้าเว็บแสดงถูกต้อง
- [ ] รูปภาพโหลดได้
- [ ] CSS/styling ถูกต้อง
- [ ] Navigation links ใช้งานได้
- [ ] Mobile responsive

---

### 🔄 อัพเดทเว็บไซต์ (หลังจาก deploy แล้ว)

```bash
# 1. แก้ไขไฟล์
# 2. Commit + Push
git add .
git commit -m "Update: [อธิบายการเปลี่ยนแปลง]"
git push origin main

# 3. รอ 1-2 นาที → เว็บจะอัพเดทอัตโนมัติ
```

---

### 🎨 Custom Domain (Optional)

ถ้าต้องการใช้ domain ของคุณเอง (เช่น `www.myhomediy.com`):

1. ซื้อ domain จาก Namecheap, GoDaddy, etc.
2. ใน DNS settings ของ domain:
   ```
   Type: CNAME
   Name: www
   Value: yourusername.github.io
   ```
3. ใน GitHub Settings → Pages:
   - ใส่ domain ใน **Custom domain**
   - คลิก **Save**
4. รอ DNS propagate (24-48 ชั่วโมง)

---

## ⚡ Netlify (ง่ายที่สุด)

### วิธีที่ 1: Drag & Drop

1. ไปที่ https://app.netlify.com/drop
2. ล็อกอินหรือสร้างบัญชี (ฟรี)
3. **Drag โฟลเดอร์ `Myhome-DIY-Website`** ลงในหน้าเว็บ
4. รอ 30 วินาที
5. ได้ URL: `https://random-name-123.netlify.app`
6. (Optional) เปลี่ยนชื่อ site ใน Settings

### วิธีที่ 2: Deploy จาก GitHub

1. Push code ไป GitHub (ตามขั้นตอน GitHub Pages)
2. ไปที่ https://app.netlify.com
3. คลิก **Add new site** → **Import an existing project**
4. เลือก **GitHub** → เลือก repository
5. **Build settings:** (ปล่อยว่างได้)
6. คลิก **Deploy site**
7. เสร็จใน 1-2 นาที

### ข้อดี Netlify
- ✅ Deploy ง่ายมาก
- ✅ Auto-deploy เมื่อ push code ใหม่
- ✅ HTTPS ฟรี
- ✅ Custom domain ง่าย
- ✅ Form handling built-in

---

## 🔷 Vercel

### ติดตั้ง Vercel CLI

```bash
npm install -g vercel
```

### Deploy

```bash
cd c:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website
vercel

# ตอบคำถาม:
# - Set up and deploy? → Y
# - Link to existing project? → N
# - What's your project's name? → myhome-diy
# - In which directory is your code located? → ./
# - Override settings? → N
```

### Deploy Production

```bash
vercel --prod
```

---

## 🔧 ทดสอบ Local

### วิธีที่ 1: Python Simple HTTP Server

```bash
# Python 3
python -m http.server 8000

# เปิดเบราว์เซอร์:
http://localhost:8000
```

### วิธีที่ 2: VS Code Live Server

1. ติดตั้ง extension: **Live Server**
2. Right-click `index.html`
3. เลือก **Open with Live Server**
4. เว็บจะเปิดอัตโนมัติที่ `http://127.0.0.1:5500`

### วิธีที่ 3: Ngrok (แชร์ให้คนอื่นทดสอบ)

```bash
# 1. รัน local server
python -m http.server 8000

# 2. Terminal ใหม่ - รัน ngrok
ngrok http 8000

# 3. ได้ URL สาธารณะ:
# https://abc123.ngrok.io

# แชร์ URL นี้ให้คนอื่นเข้าชม (ใช้ได้ชั่วคราว)
```

---

## 📊 เปรียบเทียบ

| ฟีเจอร์ | GitHub Pages | Netlify | Vercel |
|---------|--------------|---------|--------|
| ราคา | ฟรี | ฟรี | ฟรี |
| HTTPS | ✅ | ✅ | ✅ |
| Custom Domain | ✅ | ✅ | ✅ |
| Auto Deploy | ✅ | ✅ | ✅ |
| Build Time | ปานกลาง | เร็ว | เร็วที่สุด |
| ความง่าย | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Bandwidth | Unlimited | 100 GB/เดือน | 100 GB/เดือน |

---

## 🚨 Troubleshooting

### ปัญหา: หน้าเว็บแสดงไม่ถูกต้อง (404)

**สาเหตุ:** Path ของ CSS/รูปภาพผิด

**วิธีแก้:**
```html
<!-- ❌ ผิด -->
<link href="/assets/style.css">

<!-- ✅ ถูก -->
<link href="assets/style.css">
<link href="./assets/style.css">
```

### ปัญหา: รูปภาพไม่แสดง

**วิธีแก้:**
1. เช็คว่าไฟล์รูปอยู่ในโฟลเดอร์ `images/`
2. เช็คชื่อไฟล์ match กับ HTML (case-sensitive)
3. เช็คว่าไฟล์ถูก push ไป GitHub (`git ls-files`)

### ปัญหา: Security Headers ไม่ทำงาน

**GitHub Pages:** ไฟล์ `_headers` ไม่ support - ใช้ security headers ใน meta tags แทน

**Netlify/Vercel:** ไฟล์ `_headers` ใช้ได้

### ปัญหา: เผลอ push ไฟล์ sensitive

ดู: **[SECURITY-CHECKLIST.md](SECURITY-CHECKLIST.md)** → ส่วน "ถ้าเกิดเผลอ Push Secret ไป"

---

## ✅ Deploy Checklist

ก่อน deploy ทุกครั้ง:

- [ ] อ่าน **SECURITY-CHECKLIST.md** ครบ
- [ ] ตรวจสอบ `.gitignore` ทำงานถูกต้อง
- [ ] ไม่มี API keys หรือ passwords ใน code
- [ ] ทดสอบ local ก่อน
- [ ] Commit message ชัดเจน
- [ ] Push ไปยัง GitHub
- [ ] ตรวจสอบเว็บ live ว่าใช้งานได้

---

## 🎉 สำเร็จแล้ว!

หลัง deploy สำเร็จ:

1. แชร์ URL ใน Facebook page
2. เพิ่ม URL ใน bio/description
3. ติดตาม analytics (Google Analytics)
4. อัพเดทเนื้อหาเป็นประจำ

---

## 📞 ต้องการความช่วยเหลือ?

- 📖 [GitHub Pages Docs](https://docs.github.com/en/pages)
- 📖 [Netlify Docs](https://docs.netlify.com)
- 📖 [Vercel Docs](https://vercel.com/docs)

---

**Happy Deploying! 🚀**

*อัพเดทล่าสุด: 24 เมษายน 2026*
