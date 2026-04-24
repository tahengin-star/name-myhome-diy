# 🤖 Myhome DIY - Chat with Hermes Agent

## 🎉 ระบบแชทพร้อมใช้งาน!

คุณสามารถสนทนากับ Hermes Agent ผ่านหน้าเว็บได้แล้ว!

---

## 📁 ไฟล์ที่สร้างขึ้น:

### ✅ หน้าเว็บ:
- **chat.html** - หน้าแชทสวยงาม พร้อม UI ที่ใช้งานง่าย
- **index.html** - หน้าแรกของเว็บไซต์ (อัพเดทแล้ว)

### ✅ Backend:
- **hermes_chat_server.py** - API Server สำหรับเชื่อมต่อกับ Hermes Agent

### ✅ คู่มือ:
- **QUICK-START.md** - เริ่มใช้งานแบบง่ายๆ 3 ขั้นตอน
- **SETUP-GUIDE.md** - คู่มือฉบับเต็ม (Port Forwarding, DDNS, Remote Access)

### ✅ Styles:
- **assets/style.css** - Stylesheet หลักของเว็บไซต์

---

## 🚀 เริ่มใช้งานเลย!

### ขั้นตอนที่ 1: ติดตั้ง (ครั้งแรกเท่านั้น)
```powershell
pip install flask flask-cors
```

### ขั้นตอนที่ 2: รัน Server
```powershell
cd C:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website
python hermes_chat_server.py
```

### ขั้นตอนที่ 3: เปิด Chat
เปิดไฟล์ `chat.html` ในเบราว์เซอร์

---

## 🌟 ฟีเจอร์เด่น:

### 💬 แชทอัจฉริยะ
- สนทนากับ Hermes Agent แบบ Real-time
- UI สวยงาม ใช้งานง่าย
- บันทึกประวัติการสนทนา

### ⚡ Quick Actions
- ✍️ สร้างสคริปต์วิดีโอ
- 💡 หาไอเดียคอนเทนต์
- 📊 วิเคราะห์เทรนด์
- 🛍️ แนะนำสินค้า

### 🟢 Status Indicator
- แสดงสถานะการเชื่อมต่อแบบ Real-time
- แจ้งเตือนเมื่อขาดการเชื่อมต่อ

### 📱 Responsive Design
- ใช้งานได้ทั้ง Desktop และ Mobile
- ออกแบบมาเพื่อประสบการณ์ผู้ใช้ที่ดีที่สุด

---

## 🌐 เข้าถึงจากที่ไหนก็ได้

### Local Access (เครื่องนี้)
```
http://localhost:8000
```

### LAN Access (WiFi บ้านเดียวกัน)
```
http://192.168.x.x:8000
```

### Remote Access (จากที่ไหนก็ได้)
ทำตามคู่มือใน `SETUP-GUIDE.md`:
1. Port Forwarding Setup
2. Dynamic DNS (DDNS) Configuration  
3. Access via: `http://yourname.ddns.net:8000`

---

## 🎯 ตัวอย่างการใช้งาน:

### สร้างสคริปต์วิดีโอ:
```
User: ช่วยสร้างสคริปต์วิดีโอเรื่อง "ซ่อมก๊อกน้ำรั่วเอง" ให้หน่อย

Agent: [สร้างสคริปต์ที่ครบถ้วน พร้อม Hook, Script, CTA]
```

### หาไอเดียคอนเทนต์:
```
User: แนะนำไอเดียคอนเทนต์ DIY สำหรับเดือนหน้า

Agent: [แนะนำไอเดีย 5-10 หัวข้อพร้อมเหตุผล]
```

### วิเคราะห์เทรนด์:
```
User: วิเคราะห์เทรนด์ DIY ล่าสุดให้หน่อย

Agent: [รายงานเทรนด์พร้อมข้อมูลสนับสนุน]
```

---

## 🛠️ Technical Details:

### Architecture:
```
Frontend (chat.html)
    ↓ HTTP POST
Backend (hermes_chat_server.py)
    ↓ CLI Call
Hermes Agent (cli.py)
    ↓ Response
Backend → Frontend
```

### API Endpoints:
- `GET /health` - ตรวจสอบสถานะ Server
- `POST /chat` - ส่งข้อความแชท
- `GET /status` - ข้อมูล Agent

### Technologies:
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Backend**: Python, Flask, Flask-CORS
- **Agent**: Hermes Agent v0.10.0

---

## 📊 โครงสร้างไฟล์:

```
Myhome-DIY-Website/
├── chat.html                    # หน้าแชทหลัก
├── index.html                   # หน้าแรก
├── hermes_chat_server.py       # API Server
├── assets/
│   └── style.css               # Styles
├── images/
│   ├── logo-original.png
│   └── banner-original.png
├── QUICK-START.md              # เริ่มใช้งานง่ายๆ
├── SETUP-GUIDE.md              # คู่มือฉบับเต็ม
└── README-CHAT.md              # ไฟล์นี้
```

---

## 🔧 Troubleshooting:

### ปัญหา: Chat ไม่ทำงาน
**แก้ไข:**
1. ตรวจสอบว่า `hermes_chat_server.py` กำลังรันอยู่
2. เช็ค Console (F12) ว่ามี error หรือไม่
3. ลองรีสตาร์ท server

### ปัญหา: Status แสดง "Disconnected"
**แก้ไข:**
1. รัน `python hermes_chat_server.py` ใหม่
2. รีเฟรชหน้าเว็บ (F5)
3. เช็คว่า port 8000 ไม่ถูกใช้งานโดยโปรแกรมอื่น

### ปัญหา: ติดตั้ง Flask ไม่ได้
**แก้ไข:**
```powershell
# ลองใช้ pip3
pip3 install flask flask-cors

# หรือ
python -m pip install flask flask-cors
```

---

## 📚 เอกสารเพิ่มเติม:

- [QUICK-START.md](QUICK-START.md) - เริ่มใช้งานแบบง่าย
- [SETUP-GUIDE.md](SETUP-GUIDE.md) - คู่มือฉบับเต็ม
- [Hermes Agent Docs](../README.md) - เอกสาร Hermes Agent

---

## 🎨 Customization:

### เปลี่ยนสี Theme:
แก้ไขใน `chat.html`:
```css
--primary: #27ae60;        /* เปลี่ยนสีหลัก */
--primary-dark: #1e8449;   /* สีเข้ม */
```

### เปลี่ยน API Port:
แก้ไขใน `hermes_chat_server.py`:
```python
app.run(host='0.0.0.0', port=8000)  # เปลี่ยน port ตรงนี้
```

และใน `chat.html`:
```javascript
const HERMES_API_URL = 'http://localhost:8000';  # เปลี่ยน port ตรงนี้
```

---

## 🚀 Next Steps:

1. ✅ ลองใช้งานแชทพื้นฐาน (Local)
2. 📖 อ่าน SETUP-GUIDE.md สำหรับ Remote Access
3. 🌐 ตั้งค่า Port Forwarding
4. 🔗 Setup Dynamic DNS
5. 🌍 เข้าใช้งานจากที่ไหนก็ได้!

---

## 💬 Support:

หากมีปัญหาหรือข้อสงสัย:
1. เช็ค Troubleshooting ด้านบน
2. อ่าน SETUP-GUIDE.md
3. ตรวจสอบ Logs จาก server
4. เปิด Browser Console (F12) ดู errors

---

**สร้างโดย:** Myhome DIY Team  
**วันที่:** 24 เมษายน 2026  
**Version:** 1.0.0  
**Status:** ✅ Production Ready

---

## 🎉 Enjoy chatting with Hermes Agent!

พร้อมแล้วสำหรับการสร้างคอนเทนต์ที่ยอดเยี่ยม! 🚀
