# 🚀 คู่มือเริ่มต้นใช้งาน Myhome DIY Management System

ยินดีต้อนรับสู่ระบบจัดการอัตโนมัติสำหรับ **Myhome DIY**! คู่มือนี้จะพาคุณเริ่มต้นใช้งานภายใน 10 นาที

---

## 📦 ติดตั้ง

### 1. ติดตั้ง Dependencies

```bash
cd Myhome-DIY-Website/myhome-manager
pip install -r requirements.txt
```

### 2. ตรวจสอบการติดตั้ง

```bash
python cli.py --help
```

ถ้าเห็นเมนูคำสั่ง แสดงว่าติดตั้งสำเร็จ! ✅

---

## 🎯 เริ่มต้นใช้งาน 3 ขั้นตอน

### ขั้นที่ 1: เพิ่มสินค้าแรก

```bash
python cli.py add-product "https://shopee.co.th/product/..." --category home
```

**หมวดหมู่ที่มี:**
- `home` - ของใช้ในบ้าน
- `baby` - แม่และเด็ก
- `garden` - สวนกุหลาบ
- `cafe` - คาเฟ่ & อุปกรณ์
- `musthave` - ของมันส์ต้องมี

**ผลลัพธ์:**
```
🔍 กำลังดึงข้อมูล...
✅ ดึงข้อมูลสำเร็จ!
   📦 ชุดผ้าปูที่นอน 6 ฟุต Cotton 100%...
   💰 ราคา: 599 THB
✅ บันทึกสินค้าสำเร็จ

📝 ต้องการสร้างสคริปต์วิดีโอเลยไหม? (y/n):
```

---

### ขั้นที่ 2: สร้างสคริปต์วิดีโอ

```bash
python cli.py generate-script
```

**เลือกสินค้า:**
```
📦 สินค้าในระบบ:

  1. [🏠] ชุดผ้าปูที่นอน 6 ฟุต Cotton 100%...
  
เลือกสินค้า (เลขลำดับ): 1
```

**เลือกสไตล์:**
```
📹 สไตล์วิดีโอ:
  1. Short (30-45 วินาที) - TikTok/Reels
  2. Medium (60-90 วินาที) - รีวิวสั้น
  3. Long (2-3 นาที) - รีวิวละเอียด
  
เลือกสไตล์ (1-3): 1
```

**ได้สคริปต์เลย!** พร้อมคู่มือการถ่ายครบชุด 🎬

---

### ขั้นที่ 3: ดู Dashboard

```bash
python cli.py dashboard
```

**แสดงสถิติ:**
```
📊 Myhome DIY Dashboard
======================================================================

📦 สินค้าทั้งหมด: 5 รายการ
📅 อัปเดตล่าสุด: 2026-04-24

📊 สินค้าแต่ละหมวด:
----------------------------------------------------------------------
  🏠 ของใช้ในบ้าน         3 รายการ  ████████████ 60.0%
  👶 แม่และเด็ก           1 รายการ  ████ 20.0%
  🌸 สวนกุหลาบ            1 รายการ  ████ 20.0%

📝 สคริปต์ที่สร้างแล้ว: 3 สคริปต์
```

---

## 🎬 Workflow แบบเต็ม

### 1️⃣ ค้นหาสินค้า (คุณ)
- เปิด Shopee/Lazada
- หาสินค้าที่คิดว่าน่าสนใจ
- คัดลอก URL

### 2️⃣ เพิ่มสินค้า (AI)
```bash
python cli.py add-product "URL" --category home
```
- AI ดึงข้อมูลอัตโนมัติ (ชื่อ, ราคา, รูป, รีวิว)
- บันทึกลง database

### 3️⃣ สร้างสคริปต์ (AI)
```bash
python cli.py generate-script
```
- AI สร้างสคริปต์วิดีโอพร้อมใช้
- มีคู่มือการถ่ายครบชุด

### 4️⃣ ถ่ายวิดีโอ (คุณ)
- อ่านสคริปต์
- ถ่ายตามคู่มือ
- ตัดต่อ + upload TikTok/Reels

### 5️⃣ เพิ่มลงเว็บ (AI)
```bash
python generators/html_generator.py
```
- AI สร้าง HTML สำหรับสินค้า
- คุณ copy-paste ลง products.html

### 6️⃣ Deploy (คุณ)
```bash
git add products.html
git commit -m "เพิ่มสินค้าใหม่"
git push origin main
```

---

## 📝 คำสั่งที่ใช้บ่อย

| คำสั่ง | ทำอะไร |
|--------|--------|
| `python cli.py add-product URL -c CATEGORY` | เพิ่มสินค้าใหม่ |
| `python cli.py list` | ดูรายการสินค้าทั้งหมด |
| `python cli.py list -c home` | ดูสินค้าหมวด home |
| `python cli.py generate-script` | สร้างสคริปต์ |
| `python cli.py generate-script PROD_ID` | สร้างสคริปต์สินค้าที่ระบุ |
| `python cli.py dashboard` | ดูสถิติ dashboard |
| `python generators/html_generator.py` | สร้าง HTML snippet |

---

## 💡 เคล็ดลับ

### ⚡ ทำงานเร็วขึ้น
1. **เพิ่มสินค้าทีละหลายชิ้น** ก่อนสร้างสคริปต์
2. **ใช้ Short style** สำหรับเริ่มต้น (ถ่ายเร็ว)
3. **Batch shooting** - ถ่ายหลายวิดีโอในวันเดียว

### 🎯 เพิ่มคุณภาพ
1. **อ่านสคริปต์ 2-3 รอบก่อนถ่าย**
2. **แสงสว่างเพียงพอ** (ใกล้หน้าต่างดีสุด)
3. **ทดสอบเสียง** ก่อนถ่ายจริง

### 📈 เพิ่ม Engagement
1. **โพสต์สม่ำเสมือ** (อย่างน้อย 2-3 วิดีโอ/สัปดาห์)
2. **ตอบคอมเมนต์** ทุกคน
3. **ใช้ hashtag** ที่เกี่ยวข้อง

---

## 🆘 แก้ปัญหา

### ❌ Error: Module not found
```bash
pip install -r requirements.txt
```

### ❌ ดึงข้อมูลสินค้าไม่ได้
- ตรวจสอบ URL ว่าถูกต้อง
- บางเว็บอาจบล็อก scraper (ใช้ VPN)
- ลองเว็บอื่น (Shopee, Lazada, Amazon)

### ❌ ไม่พบ Product ID
```bash
python cli.py list
```
ดู ID จากรายการสินค้า

---

## 📚 เอกสารเพิ่มเติม

- [📊 Production Pipeline](dashboards/pipeline.md) - กระบวนการทำงานทั้งหมด
- [⚙️ config.yaml](config.yaml) - ตั้งค่าระบบ
- [🔧 README.md](README.md) - คู่มือฉบับเต็ม

---

## 🎉 พร้อมแล้ว!

ลองเพิ่มสินค้าแรกกันเลย:

```bash
python cli.py add-product "YOUR_PRODUCT_URL" --category home
```

**มีคำถาม?** 
- เช็ค [Production Pipeline](dashboards/pipeline.md)
- อ่าน README.md
- ดู config.yaml

**Happy Content Creating! 🚀**
