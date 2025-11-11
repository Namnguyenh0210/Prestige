# 🚀 HƯỚNG DẪN CHẠY DỰ ÁN - CỰC KỲ ĐƠN GIẢN

## ⚡ CHỈ CẦN NHỚ 1 LỆNH DUY NHẤT!

### **Chạy cả Backend + Frontend cùng lúc:**

**macOS/Linux:**
```bash
./start.sh
```

**Windows:**
```batch
start.bat
```

**Đó là tất cả!** Script sẽ tự động:
- ✅ Kiểm tra Java, Maven, Node.js
- ✅ Kill process cũ nếu port đang bị chiếm
- ✅ Cài đặt dependencies (nếu cần)
- ✅ Chạy Backend tại http://localhost:8080/api
- ✅ Chạy Frontend tại http://localhost:5173

---

### **Dừng cả 2 services:**

**macOS/Linux:**
```bash
./stop.sh
```

**Windows:**
```batch
stop.bat
```

---

## 📝 CHỈ CẦN NHỚ 2 LỆNH

### 1️⃣ **Chạy:**
```bash
./start.sh
```

### 2️⃣ **Dừng:**
```bash
./stop.sh
```

**Hoặc nhấn `Ctrl + C` 2 lần trong terminal đang chạy start.sh**

---

## 🎯 KẾT QUẢ SAU KHI CHẠY

```
╔══════════════════════════════════════════════════════════╗
║   🎉 THANH CONG! CA 2 SERVICE DANG CHAY                  ║
╚══════════════════════════════════════════════════════════╝

📍 Backend API:  http://localhost:8080/api
📍 Frontend Web: http://localhost:5173
```

Mở browser vào: **http://localhost:5173**

---

## 🔧 NẾU CẦN CHẠY THỦ CÔNG (Hiếm khi cần)

### **Terminal 1 - Backend:**
```bash
cd backend
mvn spring-boot:run
```

### **Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```

---

## ⚠️ TROUBLESHOOTING

### Lỗi: Port already in use
**Giải pháp:** Script `start.sh` đã tự động kill process cũ rồi!

Nếu vẫn lỗi, chạy stop.sh trước:
```bash
./stop.sh
./start.sh
```

### Lỗi: Command not found
**Giải pháp:** Cấp quyền thực thi:
```bash
chmod +x start.sh stop.sh
```

---

## 🎉 KẾT LUẬN

**Chỉ cần nhớ 1 lệnh duy nhất:**

```bash
./start.sh
```

**Đơn giản vậy thôi!** 🚀
