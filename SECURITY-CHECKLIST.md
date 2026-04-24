# 🔒 Security Checklist - ก่อน Deploy

## ⚠️ **สิ่งสำคัญที่สุด - ตรวจสอบก่อน Push Code!**

### ✅ ไฟล์ที่ห้าม Push ไป GitHub

- [ ] **ไฟล์ Python backend** - `hermes_chat_server.py` และไฟล์ `.py` ทั้งหมด
- [ ] **ไฟล์ .env** - API keys, secrets, passwords
- [ ] **config.json** - การตั้งค่าที่มี credentials
- [ ] **ไฟล์ backup** - `*.bak`, `*.backup`, `*~`
- [ ] **โฟลเดอร์ venv/** - Python virtual environment
- [ ] **โฟลเดอร์ node_modules/** - dependencies (ถ้ามี)
- [ ] **ไฟล์ log** - `*.log`, `logs/`
- [ ] **Database files** - `*.db`, `*.sqlite`

### 🔍 ตรวจสอบ Hardcoded Secrets

ค้นหาคำเหล่านี้ในไฟล์ HTML/CSS/JS:

```bash
# ค้นหาใน VS Code หรือ Command Prompt
findstr /s /i "api_key password secret token" *.html *.css *.js
```

ตรวจสอบว่าไม่มี:
- [ ] API Keys (Google, OpenAI, etc.)
- [ ] Passwords หรือ tokens
- [ ] Email addresses ส่วนตัว
- [ ] Phone numbers
- [ ] ที่อยู่บ้านจริง
- [ ] Path ของเครื่อง (`C:\Users\...`)

### 🛡️ Security Headers

- [x] เพิ่มไฟล์ `_headers` พร้อม security headers
- [x] X-Frame-Options: DENY (ป้องกัน clickjacking)
- [x] X-Content-Type-Options: nosniff
- [x] X-XSS-Protection: 1; mode=block
- [x] Content-Security-Policy ตั้งค่าแล้ว

### 📝 Documentation

- [x] สร้างไฟล์ `security.txt` สำหรับรายงานช่องโหว่
- [ ] อัพเดท email ใน `security.txt` เป็นของคุณเอง
- [ ] สร้าง `README.md` พร้อมคำเตือน security

### 🚫 ปิดฟีเจอร์ที่ไม่ปลอดภัย

สำหรับ **GitHub Pages**:
- [x] ปิด directory listing (GitHub Pages ปิดให้อัตโนมัติ)
- [x] ไฟล์ `.nojekyll` สร้างแล้ว
- [ ] ตั้งค่า **Branch protection rules** (ถ้าต้องการ)
- [ ] เปิด **HTTPS only** ใน GitHub Pages settings

### 🔐 Chat Server (ถ้าใช้)

**⚠️ สำคัญ:** `hermes_chat_server.py` **ห้าม deploy** บน GitHub Pages!

ถ้าต้องการใช้ AI Chat:
- [ ] Deploy backend แยกต่างหาก (Heroku, Railway, Fly.io)
- [ ] ใช้ Environment Variables สำหรับ API keys
- [ ] เพิ่ม CORS restrictions
- [ ] เพิ่ม rate limiting
- [ ] เพิ่ม authentication (ถ้าจำเป็น)

### 📊 GitHub Repository Settings

หลังจาก push code แล้ว:

1. ไปที่ **Settings** → **Security**
   - [ ] เปิด **Dependabot alerts**
   - [ ] เปิด **Code scanning**

2. ไปที่ **Settings** → **Pages**
   - [ ] เลือก Branch: `main` หรือ `gh-pages`
   - [ ] เปิด **Enforce HTTPS** ✅

3. ไปที่ **Settings** → **Branches** (ถ้าต้องการ)
   - [ ] เพิ่ม branch protection rules

### 🧪 ทดสอบก่อน Deploy

```bash
# 1. ตรวจสอบว่า .gitignore ทำงาน
git status

# 2. ดูว่าไฟล์อะไรจะถูก push
git add -n .

# 3. ตรวจสอบว่าไม่มีไฟล์ sensitive
git diff --staged --name-only
```

### ✨ Best Practices

- [ ] ใช้ **private repository** ถ้ามีข้อมูลละเอียดอ่อน
- [ ] อัพเดท dependencies เป็นประจำ
- [ ] Review code ก่อน merge
- [ ] ใช้ **signed commits** (ถ้าเป็นโปรเจกต์สำคัญ)
- [ ] เก็บ backup ของ API keys ไว้ที่ปลอดภัย (เช่น password manager)

---

## 🚨 ถ้าเกิดเผลอ Push Secret ไป

1. **ลบ API Key ทันที** - ยกเลิกที่ provider
2. **สร้าง key ใหม่**
3. **ลบออกจาก Git history:**
   ```bash
   git filter-branch --force --index-filter \
   "git rm --cached --ignore-unmatch path/to/file" \
   --prune-empty --tag-name-filter cat -- --all
   ```
4. **Force push:** `git push origin --force --all`

---

## ✅ พร้อม Deploy แล้ว?

หลังจากตรวจสอบทุกข้อแล้ว:

```bash
# Windows
.\deploy.bat

# หรือทำเอง
git add .
git commit -m "Initial deployment with security"
git push origin main
```

🎉 **Deploy ปลอดภัย!**
