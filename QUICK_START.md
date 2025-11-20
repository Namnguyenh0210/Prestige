# 🚀 QUICK START

Chạy toàn bộ hệ thống (Backend + Frontend) trong 1 lệnh.

## ▶️ Start nhanh
macOS/Linux:
```bash
./start.sh
```
Windows:
```bat
start.bat
```

Sau 15–30s:
- Backend: http://localhost:8080
- Frontend: http://localhost:5173

## ⏹ Dừng
macOS/Linux:
```bash
./stop.sh
```
Windows:
```bat
stop.bat
```

## 🔑 Tài khoản test
| Email | Mật khẩu |
|-------|----------|
| admin@luxury.com | 123 |
| nhanvien@luxury.com | 123 |
| khachhang@luxury.com | 123 |

## 🧪 Kiểm tra login nhanh với curl (tùy chọn)
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"khachhang@luxury.com","password":"123"}'
```
Kết quả trả về JSON có `token` và `user.roles`.

## 🔄 Reset database
1. Mở SQL Server Management Studio
2. Chạy lại file `db.sql`
3. Đăng nhập lại bằng tài khoản mặc định trên

## ⚠ Ghi chú
- Mật khẩu đang để plain text cho môi trường dev.
- Khi cần bảo mật: bật BCrypt trong `SecurityConfig` và cập nhật lại `db.sql`.

## 📚 Tài liệu thêm
- `README.md` – Tổng quan chi tiết
- `HOW_TO_RUN.md` – Cách chạy thủ công & xử lý sự cố

Chỉ vậy thôi. Chúc bạn code vui! 🎉
