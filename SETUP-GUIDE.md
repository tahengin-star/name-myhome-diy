# 🚀 คู่มือการติดตั้งและใช้งาน Myhome DIY Website

## 📋 สารบัญ
1. [การติดตั้ง Dependencies](#installation)
2. [การรัน Hermes Agent Chat](#run-chat)
3. [การ Setup Web Server](#web-server)
4. [Port Forwarding สำหรับเข้าถึงจากภายนอก](#port-forwarding)
5. [Dynamic DNS (DDNS) Setup](#ddns-setup)
6. [การเข้าใช้งานจากที่ไหนก็ได้](#remote-access)

---

## 🔧 1. การติดตั้ง Dependencies {#installation}

### ติดตั้ง Python Packages
```powershell
cd C:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website

# ติดตั้ง Flask และ Flask-CORS
pip install flask flask-cors

# หรือใช้ pip3
pip3 install flask flask-cors
```

### ตรวจสอบการติดตั้ง
```powershell
python -c "import flask; print('Flask installed successfully')"
python -c "import flask_cors; print('Flask-CORS installed successfully')"
```

---

## 💬 2. การรัน Hermes Agent Chat {#run-chat}

### ขั้นตอนที่ 1: เริ่ม Chat API Server
```powershell
cd C:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website

# รัน server
python hermes_chat_server.py
```

**ผลลัพธ์ที่ควรเห็น:**
```
============================================================
🤖 Hermes Agent Chat API Server
============================================================
📁 Hermes Path: C:\Users\tah_e\Hermes-Agent
🌐 Server URL: http://localhost:8000
💬 Chat Interface: http://localhost:8000/chat
============================================================
✅ Server is ready! Open chat.html in your browser.
============================================================
 * Running on http://0.0.0.0:8000
```

### ขั้นตอนที่ 2: เปิดหน้าเว็บ
1. เปิดไฟล์ `chat.html` ในเบราว์เซอร์
2. หรือไปที่ `http://localhost:8000` (ถ้ามี web server)

### ทดสอบการเชื่อมต่อ
ลองพิมพ์ข้อความเหล่านี้:
- "สวัสดี"
- "ช่วยสร้างสคริปต์วิดีโอให้หน่อย"
- "แนะนำไอเดียคอนเทนต์"

---

## 🌐 3. การ Setup Web Server {#web-server}

### วิธีที่ 1: ใช้ Python HTTP Server (ง่ายที่สุด)
```powershell
cd C:\Users\tah_e\Hermes-Agent\Myhome-DIY-Website

# รัน web server ที่ port 80
python -m http.server 80

# หรือ port 8080 (ถ้า port 80 ถูกใช้งาน)
python -m http.server 8080
```

**เข้าถึงได้ที่:**
- Local: `http://localhost` หรือ `http://localhost:8080`
- LAN: `http://192.168.x.x` หรือ `http://192.168.x.x:8080`

### วิธีที่ 2: ใช้ XAMPP/WAMP (แนะนำสำหรับ production)

#### ติดตั้ง XAMPP:
1. ดาวน์โหลด: https://www.apachefriends.org/
2. ติดตั้งที่ `C:\xampp`
3. คัดลอกโฟลเดอร์เว็บไซต์ไปที่ `C:\xampp\htdocs\myhome-diy`

#### เริ่ม Apache:
```powershell
cd C:\xampp
.\xampp-control.exe
```
- คลิก "Start" ที่ Apache
- เข้าถึงได้ที่: `http://localhost/myhome-diy`

---

## 🔓 4. Port Forwarding สำหรับเข้าถึงจากภายนอก {#port-forwarding}

### ขั้นตอนการตั้งค่า Port Forwarding

#### 4.1 หา IP Address ของเครื่อง
```powershell
ipconfig
```
จดบันทึก **IPv4 Address** เช่น `192.168.1.100`

#### 4.2 เข้าสู่หน้าจัดการ Router
เปิดเบราว์เซอร์ไปที่:
- `http://192.168.1.1` (ทั่วไป)
- หรือ `http://192.168.0.1`
- หรือ `http://192.168.10.1` (สำหรับ True, AIS)

**Username/Password ทั่วไป:**
- admin / admin
- admin / password
- admin / 1234

#### 4.3 ตั้งค่า Port Forwarding

ไปที่เมนู: **Advanced** → **NAT/Port Forwarding** → **Add New Rule**

**สร้าง 2 Rules:**

**Rule 1: Web Server (HTTP)**
```
Service Name: Myhome-Web
External Port: 80
Internal IP: 192.168.1.100 (IP เครื่องคุณ)
Internal Port: 80
Protocol: TCP
Status: Enable
```

**Rule 2: API Server**
```
Service Name: Hermes-API
External Port: 8000
Internal IP: 192.168.1.100
Internal Port: 8000
Protocol: TCP
Status: Enable
```

#### 4.4 บันทึกและ Restart Router

---

## 🌍 5. Dynamic DNS (DDNS) Setup {#ddns-setup}

### เหตุผลที่ต้องใช้ DDNS:
IP ภายนอกของบ้าน (WAN IP) เปลี่ยนบ่อย DDNS จะสร้าง Domain Name ที่คงที่ให้คุณ

### แนะนำ DDNS Services ฟรี:

#### 1. **No-IP** (แนะนำ)
- Website: https://www.noip.com
- Free domain: `yourname.ddns.net`

#### 2. **DuckDNS**
- Website: https://www.duckdns.org
- Free domain: `yourname.duckdns.org`

#### 3. **Dynu**
- Website: https://www.dynu.com
- Free domain: `yourname.dynu.net`

---

### การตั้งค่า No-IP (ตัวอย่าง)

#### ขั้นตอนที่ 1: สมัครสมาชิก
1. ไปที่ https://www.noip.com/sign-up
2. สมัครบัญชีฟรี
3. ยืนยัน Email

#### ขั้นตอนที่ 2: สร้าง Hostname
1. Login เข้า No-IP
2. ไปที่ **Dynamic DNS** → **No-IP Hostnames**
3. คลิก **Create Hostname**
4. เลือกชื่อ: `myhomediy` → เต็มจะเป็น `myhomediy.ddns.net`
5. คลิก **Create Hostname**

#### ขั้นตอนที่ 3: ติดตั้ง DUC (Dynamic Update Client)
1. ดาวน์โหลด: https://www.noip.com/download?page=win
2. ติดตั้งบน Windows
3. Login ด้วย No-IP account
4. เลือก hostname ที่สร้างไว้
5. คลิก **Save**

**DUC จะอัพเดท IP ให้อัตโนมัติ!**

#### ขั้นตอนที่ 4: ตั้งค่าใน Router (สำหรับ Router ที่รองรับ)
บาง Router รองรับ DDNS ใน
 Settings:

1. ไปที่ **Advanced** → **DDNS**
2. เลือก Service: **No-IP**
3. ใส่:
   - Username: (No-IP email)
   - Password: (No-IP password)
   - Hostname: `myhomediy.ddns.net`
4. Enable DDNS
5. Save

---

## 🌐 6. การเข้าใช้งานจากที่ไหนก็ได้ {#remote-access}

### หลังจาก Setup เรียบร้อย:

#### เข้าถึงเว็บไซต์:
```
http://myhomediy.ddns.net
```

#### เข้าถึง Chat API:
```
http://myhomediy.ddns.net:8000
```

### แก้ไขไฟล์ chat.html:
เปิดไฟล์ `chat.html` และแก้ไข:

```javascript
// เดิม
const HERMES_API_URL = 'http://localhost:8000';

// แก้เป็น
const HERMES_API_URL = 'http://myhomediy.ddns.net:8000';
```

---

## 🔒 7. ความปลอดภัย (Security)

### แนะนำ:
1. **เปลี่ยน Router Password** จาก default
2. **ปิด UPnP** ใน Router settings
3. **ใช้ Strong Password** สำหรับ Web Admin
4. **ติดตั้ง Firewall** บน Windows

### Windows Firewall Rules:
```powershell
# Allow port 80
netsh advfirewall firewall add rule name="Myhome Web" dir=in action=allow protocol=TCP localport=80

# Allow port 8000
netsh advfirewall firewall add rule name="Hermes API" dir=in action=allow protocol=TCP localport=8000
```

---

## 🐛 8. Troubleshooting

### ปัญหา: ไม่สามารถเข้าถึงจากภายนอกได้

**ตรวจสอบ:**
1. Port Forwarding ตั้งค่าถูกต้อง
2. Firewall ไม่บล็อก port
3. Web server กำลังรันอยู่
4. ใช้ External IP ที่ถูกต้อง

**หา External IP:**
```powershell
# PowerShell
(Invoke-WebRequest -Uri "https://api.ipify.org").Content

# หรือเปิดเว็บ
# https://whatismyipaddress.com
```

### ปัญหา: Chat ไม่ทำงาน

**ตรวจสอบ:**
1. `hermes_chat_server.py` กำลังรันอยู่
2. Flask และ Flask-CORS ติดตั้งแล้ว
3. Port 8000 ไม่ถูกใช้งานโดยโปรแกรมอื่น
4. Browser Console ไม่มี CORS errors

### ปัญหา: DDNS ไม่อัพเดท

**แก้ไข:**
1. Restart DUC application
2. ตรวจสอบ Username/Password
3. ลอง Manual Update ใน No-IP dashboard

---

## 📱 9. ทดสอบการเข้าถึง

### จาก Mobile (4G/5G):
1. ปิด WiFi บนมือถือ
2. เปิดเบราว์เซอร์
3. ไปที่ `http://myhomediy.ddns.net`
4. ทดสอบแชท

### จากเครื่องอื่น:
1. ใช้ WiFi/เน็ตอื่น (ไม่ใช่ WiFi บ้าน)
2. ไปที่ DDNS hostname
3. ควรเห็นเว็บไซต์และใช้งานได้

---

## ✅ Checklist สำหรับ Go Live

- [ ] Python HTTP Server รันอยู่ (port 80 หรือ 8080)
- [ ] Hermes Chat API Server รันอยู่ (port 8000)
- [ ] Port Forwarding ตั้งค่าแล้วใน Router
- [ ] DDNS Service สมัครและตั้งค่าแล้ว
- [ ] DUC Client ติดตั้งและรันอยู่
- [ ] Firewall อนุญาต ports ที่จำเป็น
- [ ] ทดสอบเข้าถึงจาก Mobile/4G สำเร็จ
- [ ] Chat ทำงานได้จากภายนอก

---

## 📞 ติดต่อ & Support

หากมีปัญหา ตรวจสอบ:
1. Logs จาก `hermes_chat_server.py`
2. Browser Console (F12)
3. Router logs
4. Windows Event Viewer

---

**สร้างโดย:** Myhome DIY Tech Team  
**อัพเดทล่าสุด:** 24 เมษายน 2026  
**Version:** 1.0
