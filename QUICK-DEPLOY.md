# ⚡ Quick Deploy Guide (5 นาที)

สำหรับคนที่ต้องการ deploy เร็วๆ โดยไม่อ่านเอกสารยาวๆ

---

## 🚨 ก่อนเริ่ม - สำคัญ!

### ✅ ตรวจสอบก่อน deploy (2 นาที)

```bash
# Windows - เช็คว่าไม่มีไฟล์ sensitive
git ls-files | findstr /i ".py .env config.json"

# ถ้าเจอ → เพิ่มใน .gitignore แล้วลองใหม่
```

**ถ้าไม่เจออะไร = ปลอดภัย ทำต่อได้!**

---

## 🚀 Deploy ใน 3 ขั้นตอน

### 1️⃣ สร้าง GitHub Repo (1 นาที)

1. ไปที่: https://github.com/new
2. ตั้งชื่อ: `myhome-diy`
3. เลือก **Public**
4. คลิก **Create repository**

### 2️⃣ Push Code (1 นาที)

**Windows:**
```bash
cd c:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website

git init
git add .
git commit -m "Initial deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/myhome-diy.git
git push -u origin main
```

**แทนที่ `YOUR_USERNAME` ด้วย username GitHub ของคุณ!**

### 3️⃣ เปิด GitHub Pages (1 นาที)

1. ไปที่ repo บน GitHub
2. **Settings** → **Pages**
3. **Branch:** `main` → `/root` → **Save**
4. รอ 2 นาที
5. เสร็จ! URL: `https://YOUR_USERNAME.github.io/myhome-diy/`

---

## ✅ เปิด HTTPS (30 วินาที)

Settings → Pages → ✅ **Enforce HTTPS**

---

## 🎉 เสร็จแล้ว!

เปิดเว็บไซต์: `https://YOUR_USERNAME.github.io/myhome-diy/`

---

## 🔄 อัพเดทเว็บหลัง deploy

```bash
git add .
git commit -m "Update content"
git push origin main
```

รอ 1-2 นาที → เว็บจะอัพเดทอัตโนมัติ

---

## 🆘 มีปัญหา?

### CSS/รูปไม่แสดง

ใน HTML เปลี่ยนจาก:
```html
<link href="/assets/style.css">
```

เป็น:
```html
<link href="assets/style.css">
```

### Push ไม่ได้ (Authentication)

```bash
# ใช้ Personal Access Token แทน password
# สร้างที่: https://github.com/settings/tokens
```

### อ่านเพิ่มเติม

- 📖 [DEPLOY.md](DEPLOY.md) - คู่มือละเอียด
- 🔒 [SECURITY-CHECKLIST.md](SECURITY-CHECKLIST.md) - Security checklist
- 📋 [README.md](README.md) - เอกสารหลัก

---

**Happy Deploying! 🚀**
