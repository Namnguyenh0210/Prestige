# 🛍️ LUXURY FASHION - DỰ ÁN E-COMMERCE CAO CẤP

Hệ thống E-commerce bán quần áo cao cấp với kiến trúc **Frontend-Backend tách biệt**.

---

## ⚡ CHẠY DỰ ÁN - CHỈ 1 LỆNH!

### **Cách nhanh nhất:**

**macOS/Linux:**
```bash
./start.sh
```

**Windows:**
```batch
start.bat
```

**Dừng:**
```bash
./stop.sh        # macOS/Linux
stop.bat         # Windows
```

**Đó là tất cả!** 🎉

---

## 📁 CẤU TRÚC PROJECT

```
Prestige/
├── start.sh              # ⭐ Script chạy tất cả (Mac/Linux)
├── stop.sh               # Script dừng services (Mac/Linux)
├── start.bat             # ⭐ Script chạy tất cả (Windows)
├── stop.bat              # Script dừng services (Windows)
├── QUICK_RUN.md          # 📖 Hướng dẫn siêu ngắn (CHỈ 1 LỆNH)
├── HOW_TO_RUN.md         # 📖 Hướng dẫn chi tiết
├── QUICK_START.md        # 📖 Hướng dẫn cho Team Leader
├── README.md             # 📖 Tổng quan project (file này)
├── TEST_REPORT.md        # Báo cáo kiểm tra
├── logs/                 # Log files (tự động tạo)
│   ├── backend.log
│   └── frontend.log
├── backend/              # Spring Boot Backend
│   ├── src/
│   ├── pom.xml
│   └── README.md
├── frontend/             # Vue 3 Frontend
│   ├── src/
│   ├── package.json
│   └── README.md
├── db.sql                # Database schema
└── Dự_Án_Tốt_Nghiệp_FPT.md  # Tài liệu dự án
```

---

## 🎯 THÔNG TIN DỰ ÁN

### Giai đoạn 1: Java 6 - Website bán quần áo Luxury (4 tuần)

**Mục tiêu:**
- ✅ Xây dựng hệ thống bán hàng hoàn chỉnh
- ✅ Đăng ký, đăng nhập, phân quyền (JWT + Spring Security)
- ✅ Quản lý sản phẩm với biến thể (SKU)
- ✅ Giỏ hàng đồng bộ CSDL
- ✅ Đặt hàng và thanh toán (COD, VNPay, Momo)
- ✅ Quản lý kho hàng (Phiếu nhập)
- ✅ Trang quản trị (Admin)

**Nhóm:** 4 người
- 👨‍💼 Team Leader (Backend) - **BẠN**
- 👨‍💻 Backend Developer
- 👨‍🎨 Frontend Dev (Client)
- 👨‍🎨 Frontend Dev (Admin)

---

## 🚀 HƯỚNG DẪN SETUP (CHO TEAM LEADER)

### ✅ Đã hoàn thành:

1. **Cấu trúc thư mục** backend/ và frontend/
2. **Backend (Spring Boot)**:
   - ✅ `pom.xml` - Maven dependencies
   - ✅ `application.properties` - Cấu hình kết nối SQL Server
   - ✅ `LuxuryFashionApplication.java` - Main class
   - ✅ Security Config (JWT, Spring Security)
   - ✅ CORS Config
   - ✅ Cloudinary Config
   - ✅ JWT Service & JWT Filter
   - ✅ Global Exception Handler
   - ✅ Package structure (config, controller, service, repository, entity, dto...)

3. **Frontend (Vue 3)**:
   - ✅ `package.json` - Dependencies
   - ✅ `vite.config.js` - Vite configuration
   - ✅ `tailwind.config.js` - Tailwind CSS
   - ✅ `main.js` - Entry point
   - ✅ `App.vue` - Root component
   - ✅ Router với authentication guard
   - ✅ `authStore.js` - Quản lý đăng nhập
   - ✅ `cartStore.js` - Quản lý giỏ hàng
   - ✅ Axios instance với JWT interceptor
   - ✅ Các trang cơ bản (Home, Login, Register, Products, Cart, Checkout, Orders, Admin)

---

## 🔧 HƯỚNG DẪN CHO NGƯỜI ĐẦU TIÊN (TEAM LEADER)

### Bước 1: Setup Database

```bash
# Mở SQL Server Management Studio
# Chạy file db.sql ở thư mục gốc
# Database "LuxuryFashion_2025" sẽ được tạo tự động
```

### Bước 2: Cấu hình Backend

**File: `backend/src/main/resources/application.properties`**

Thay đổi thông tin kết nối SQL Server:

```properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=LuxuryFashion_2025;encrypt=true;trustServerCertificate=true
spring.datasource.username=sa
spring.datasource.password=YOUR_PASSWORD_HERE  # ⚠️ Thay đổi password của bạn
```

Cấu hình Cloudinary (đăng ký tại cloudinary.com):

```properties
cloudinary.cloud-name=your_cloud_name
cloudinary.api-key=your_api_key
cloudinary.api-secret=your_api_secret
```

### Bước 3: Chạy Backend

```bash
cd backend
mvn clean install
mvn spring-boot:run
```

✅ Backend sẽ chạy tại: **http://localhost:8080/api**

### Bước 4: Setup Frontend

```bash
cd frontend
npm install
npm run dev
```

✅ Frontend sẽ chạy tại: **http://localhost:5173**

---

## 👥 PHÂN CÔNG CÔNG VIỆC

### 👨‍💼 Team Leader (Backend) - **BẠN**

**Đã làm xong:**
- ✅ Setup project structure
- ✅ Cấu hình pom.xml, application.properties
- ✅ Cấu hình Spring Security, JWT, CORS
- ✅ Tạo JWT Service, Filter
- ✅ Global Exception Handler

**Cần làm tiếp:**
- ⏳ Tạo Entities: `TaiKhoan`, `Role`, `TaiKhoan_Role`
- ⏳ Tạo DTOs: `AuthRequest`, `RegisterRequest`, `UserDTO`
- ⏳ Tạo Repository: `TaiKhoanRepository`, `RoleRepository`
- ⏳ Tạo Service: `AuthService`, `UserDetailsServiceImpl`
- ⏳ Tạo Controller: `AuthController` (POST /auth/register, /auth/login)
- ⏳ Test API với Postman
- ⏳ Review code của team

### 👨‍💻 Backend Developer

**Nhiệm vụ:**
- ⏳ Tạo tất cả Entities còn lại (SanPham, SanPhamChiTiet, DonHang, GioHang, PhieuNhap...)
- ⏳ Xây dựng API: Sản phẩm (GET /products, GET /products/{id}, POST /admin/products...)
- ⏳ Xây dựng API: Giỏ hàng (GET /cart, POST /cart, PUT /cart/{id}, DELETE /cart/{id})
- ⏳ Xây dựng API: Đơn hàng (POST /orders/checkout, GET /orders/history...)
- ⏳ Xây dựng API: Kho hàng (POST /admin/warehouse/import...)
- ⏳ Tích hợp VNPay, Momo

### 👨‍🎨 Frontend Dev (Client)

**Đã làm xong:**
- ✅ Setup Vue 3, Vite, Tailwind CSS
- ✅ authStore, cartStore
- ✅ Router với guard
- ✅ Axios với JWT interceptor
- ✅ Các trang cơ bản (skeleton)

**Cần làm tiếp:**
- ⏳ Hoàn thiện UI: Trang chủ, Danh sách sản phẩm
- ⏳ Hoàn thiện UI: Chi tiết sản phẩm (xử lý biến thể phức tạp)
- ⏳ Hoàn thiện UI: Giỏ hàng, Checkout
- ⏳ Tích hợp API với Backend
- ⏳ Test chức năng

### 👨‍🎨 Frontend Dev (Admin)

**Cần làm:**
- ⏳ Xây dựng AdminLayout (Sidebar, Header)
- ⏳ Trang Dashboard (Biểu đồ thống kê)
- ⏳ Quản lý Sản phẩm (CRUD)
- ⏳ Quản lý Đơn hàng
- ⏳ Quản lý Kho (Phiếu nhập)
- ⏳ Quản lý User & Phân quyền

---

## 📝 LƯU Ý QUAN TRỌNG

### Kết nối SQL Server từ ngoài vào

Nếu SQL Server chạy trên máy khác hoặc server:

```properties
# Thay localhost bằng IP của máy chạy SQL Server
spring.datasource.url=jdbc:sqlserver://192.168.1.100:1433;databaseName=LuxuryFashion_2025;encrypt=true;trustServerCertificate=true
```

Đảm bảo:
1. ✅ SQL Server đã bật **TCP/IP** trong SQL Server Configuration Manager
2. ✅ Port **1433** đã mở trong Firewall
3. ✅ SQL Server Authentication mode: **Mixed Mode**
4. ✅ User `sa` có quyền truy cập

### Git Workflow

```bash
# Tạo repository
git init
git add .
git commit -m "Initial setup: Backend + Frontend structure"
git remote add origin <your-repo-url>
git push -u origin main

# Tạo nhánh cho mỗi thành viên
git checkout -b feature/auth          # Team Leader
git checkout -b feature/products      # Backend Dev
git checkout -b feature/client-ui     # Frontend Dev Client
git checkout -b feature/admin-ui      # Frontend Dev Admin
```

---

## 📚 TÀI LIỆU THAM KHẢO

- **Spring Boot:** https://spring.io/projects/spring-boot
- **Vue 3:** https://vuejs.org/
- **Tailwind CSS:** https://tailwindcss.com/
- **Pinia:** https://pinia.vuejs.org/
- **JWT:** https://jwt.io/

---

## 🎓 KẾT LUẬN

Project đã được setup **hoàn chỉnh cấu trúc cơ bản** cho cả Backend và Frontend. Team Leader có thể:

1. ✅ Đọc file README trong `backend/` và `frontend/` để hiểu chi tiết
2. ✅ Cấu hình database connection
3. ✅ Chạy thử Backend và Frontend
4. ✅ Chia task cho các thành viên trong team
5. ✅ Bắt đầu code các module còn lại

**Chúc team làm việc hiệu quả! 🚀**

---

## 📞 LIÊN HỆ

Nếu có vấn đề trong quá trình setup, hãy kiểm tra:
- File `backend/README.md` - Hướng dẫn Backend chi tiết
- File `frontend/README.md` - Hướng dẫn Frontend chi tiết
- File `Dự_Án_Tốt_Nghiệp_FPT.md` - Tài liệu dự án đầy đủ

---

**Copyright © 2025 Luxury Fashion Team. All rights reserved.**
