# 🚀 LUXURY FASHION - BACKEND API

Backend API cho hệ thống E-commerce bán quần áo cao cấp, xây dựng bằng **Spring Boot 3 + JWT + SQL Server**.

---

## 📋 YÊUCẦU

- Java 17+
- Maven 3.6+
- SQL Server 2019+
- Node.js 16+ (cho frontend - nếu test cùng machine)

---

## ⚙️ SETUP HƯỚNG DẪN

### 1. Clone Repository
```bash
git clone <repository-url>
cd Prestige/backend
```

### 2. Tạo Database
```bash
# Mở SQL Server Management Studio
# Chạy file: ../db.sql
# Database "LuxuryFashion_2025" sẽ được tạo tự động
```

### 3. Cấu hình Database Connection
Chỉnh sửa file: `src/main/resources/application.properties`

```properties
# Thay đổi password phù hợp với SQL Server của bạn
spring.datasource.password=YOUR_SQL_SERVER_PASSWORD_HERE

# VD:
spring.datasource.password=Aa@123456
```

### 4. Cài đặt Dependencies
```bash
mvn clean install -DskipTests
```

### 5. Chạy Backend
```bash
mvn spring-boot:run
```

✅ Backend sẽ chạy tại: **http://localhost:8080/api**

Khi khởi động thành công, bạn sẽ thấy:
```
╔══════════════════════════════════════════════════════════╗
║   LUXURY FASHION BACKEND API - STARTED SUCCESSFULLY      ║
║   Backend đang chạy tại: http://localhost:8080/api      ║
╚══════════════════════════════════════════════════════════╝
```

---

## 🔐 API ENDPOINTS (PHASE 1)

### **Authentication**
```
POST   /api/auth/register           - Đăng ký tài khoản
POST   /api/auth/login              - Đăng nhập
POST   /api/auth/logout             - Đăng xuất
```

### **User**
```
GET    /api/users/me                - Lấy thông tin user hiện tại
```

### **Response Format**
Tất cả responses đều tuân theo định dạng:
```json
{
  "success": true,
  "message": "Thành công",
  "data": {
    "id": 1,
    "email": "user@example.com",
    "fullName": "Nguyễn Văn A",
    "roles": ["KHACHHANG"]
  },
  "timestamp": "2025-11-13T10:30:00"
}
```

---

## 🧪 TEST API VỚI POSTMAN

### 1. Import Collection
Sẽ được cung cấp file `Luxury_Fashion_API.postman_collection.json`

### 2. Test Login
```
POST http://localhost:8080/api/auth/login

Body (JSON):
{
  "email": "khachhang@luxury.com",
  "password": "123456"
}

Response:
{
  "success": true,
  "message": "Đăng nhập thành công",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "user": {
      "id": 3,
      "email": "khachhang@luxury.com",
      "fullName": "Lê Văn Khách",
      "roles": ["KHACHHANG"]
    }
  }
}
```

### 3. Sử dụng Token
Thêm header Authorization vào các request protected:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
```

---

## 🏗️ PROJECT STRUCTURE

```
backend/
├── src/main/java/com/luxuryfashion/
│   ├── LuxuryFashionApplication.java     # Main class
│   ├── config/
│   │   ├── SecurityConfig.java           # Spring Security config
│   │   ├── CorsConfig.java               # CORS config
│   │   └── DataSeeder.java               # Seed initial data
│   ├── controller/
│   │   ├── AuthController.java           # Auth endpoints
│   │   └── UserController.java           # User endpoints
│   ├── dto/
│   │   ├── AuthRequest.java
│   │   ├── RegisterRequest.java
│   │   ├── UserDTO.java
│   │   ├── AuthResponse.java
│   │   └── ApiResponse.java              # Generic response wrapper
│   ├── entity/
│   │   ├── TaiKhoan.java                 # User entity
│   │   ├── Role.java                     # Role entity
│   │   └── TaiKhoan_Role.java            # User-Role mapping
│   ├── exception/
│   │   └── GlobalExceptionHandler.java   # Global error handler
│   ├── repository/
│   │   ├── TaiKhoanRepository.java
│   │   ├── RoleRepository.java
│   │   └── TaiKhoanRoleRepository.java
│   ├── security/
│   │   ├── JwtService.java               # JWT token service
│   │   ├── JwtAuthenticationFilter.java  # JWT filter
│   │   └── UserDetailsServiceImpl.java    # User details loader
│   └── service/
│       ├── TaiKhoanService.java
│       └── AuthService.java
├── src/main/resources/
│   └── application.properties             # Configuration
└── pom.xml                                # Maven dependencies
```

---

## 🔑 Default Users (Sample Data)

Sau khi chạy `db.sql`, các user mặc định:

| Email | Password | Role | Tên |
|-------|----------|------|-----|
| admin@luxury.com | 123456 | ADMIN | Admin Luxury |
| nhanvien@luxury.com | 123456 | NHANVIEN | Nguyễn Thị Bán Hàng |
| khachhang@luxury.com | 123456 | KHACHHANG | Lê Văn Khách |

---

## 🐛 TROUBLESHOOTING

### Lỗi: "Cannot connect to SQL Server"
```
Giải pháp:
1. Kiểm tra SQL Server đã bật: Services -> SQL Server (MSSQLSERVER)
2. Kiểm tra port 1433 đang mở
3. Verify username/password trong application.properties
4. Bật TCP/IP trong SQL Server Configuration Manager
```

### Lỗi: "Port 8080 already in use"
```bash
# Tìm process đang dùng port 8080
lsof -ti:8080 | xargs kill -9         # macOS/Linux
netstat -ano | findstr :8080          # Windows

# Hoặc thay đổi port trong application.properties
server.port=8081
```

### Lỗi: "Role KHACHHANG không tồn tại"
```
Giải pháp:
1. Chạy lại file db.sql để seed dữ liệu mẫu
2. Kiểm tra table Role có dữ liệu: 
   SELECT * FROM Role;
```

---

## 📚 TÀI LIỆU

- [Spring Boot Docs](https://spring.io/projects/spring-boot)
- [Spring Security Docs](https://spring.io/projects/spring-security)
- [JWT Introduction](https://jwt.io/)
- [SQL Server Docs](https://learn.microsoft.com/en-us/sql/sql-server/)

---

## 👥 TEAM LEADER TASKS

**COMPLETED ✅:**
- Setup Spring Boot project structure
- Configure pom.xml with all dependencies
- Configure application.properties (SQL Server, JWT, CORS)
- Create Entities: TaiKhoan, Role, TaiKhoan_Role
- Create DTOs: AuthRequest, RegisterRequest, UserDTO, AuthResponse, ApiResponse
- Create Repositories: TaiKhoanRepository, RoleRepository
- Create Services: TaiKhoanService, AuthService
- Create Controllers: AuthController, UserController
- Configure SecurityConfig with JWT
- Create JwtService & JwtAuthenticationFilter
- Create GlobalExceptionHandler
- Add input validation & error handling

**NEXT STEPS (Phase 2):**
- Tạo Entities cho module Sản phẩm (SanPham, SanPhamChiTiet, v.v.)
- Tạo Entities cho module Đơn hàng (DonHang, DonHangCT, v.v.)
- Tạo Services & Controllers tương ứng
- Test các endpoints với Postman
- Review code của team members

---

## 📧 SUPPORT

Liên hệ Team Leader nếu gặp vấn đề!

---

**Happy Coding! 🎉**

