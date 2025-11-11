# 🛍️ LUXURY FASHION - BACKEND API

Backend API cho hệ thống E-commerce bán quần áo cao cấp, xây dựng bằng **Spring Boot 3** + **SQL Server**.

---

## 📋 MỤC LỤC

- [Giới thiệu](#giới-thiệu)
- [Công nghệ sử dụng](#công-nghệ-sử-dụng)
- [Yêu cầu hệ thống](#yêu-cầu-hệ-thống)
- [Cài đặt](#cài-đặt)
- [Cấu hình](#cấu-hình)
- [Cấu trúc thư mục](#cấu-trúc-thư-mục)
- [API Documentation](#api-documentation)

---

## 🎯 GIỚI THIỆU

Dự án **Luxury Fashion Backend** là phần Backend của hệ thống E-commerce bán quần áo cao cấp, được xây dựng theo mô hình **Frontend-Backend tách biệt**, giao tiếp qua **RESTful API**.

### Tính năng chính:
- ✅ Đăng ký, đăng nhập với JWT Authentication
- ✅ Phân quyền theo Role (ADMIN, NHANVIEN, KHACHHANG)
- ✅ Quản lý sản phẩm với biến thể (SKU)
- ✅ Giỏ hàng đồng bộ với CSDL
- ✅ Đặt hàng và thanh toán (COD, VNPay, Momo)
- ✅ Quản lý kho hàng (Phiếu nhập)
- ✅ Upload hình ảnh lên Cloudinary
- ✅ Thống kê doanh thu

---

## 🚀 CÔNG NGHỆ SỬ DỤNG

| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|----------|
| **Java** | 17+ | Ngôn ngữ lập trình |
| **Spring Boot** | 3.2.0 | Framework chính |
| **Spring Security** | 6.x | Bảo mật & phân quyền |
| **Spring Data JPA** | 3.2.0 | ORM - Truy xuất dữ liệu |
| **SQL Server** | 2019+ | Cơ sở dữ liệu |
| **JWT** | 0.12.3 | Authentication token |
| **Lombok** | Latest | Giảm boilerplate code |
| **Cloudinary** | 1.38.0 | Upload hình ảnh |
| **Maven** | 3.8+ | Build tool |

---

## 💻 YÊU CẦU HỆ THỐNG

Trước khi cài đặt, đảm bảo máy tính của bạn đã cài đặt:

- ✅ **Java 17+** ([Download](https://www.oracle.com/java/technologies/downloads/))
- ✅ **Maven 3.8+** ([Download](https://maven.apache.org/download.cgi))
- ✅ **SQL Server 2019+** ([Download](https://www.microsoft.com/en-us/sql-server/sql-server-downloads))
- ✅ **IDE**: IntelliJ IDEA / Eclipse / VS Code

---

## 📦 CÀI ĐẶT

### Bước 1: Clone hoặc giải nén project

```bash
cd /path/to/Prestige/backend
```

### Bước 2: Cài đặt dependencies

```bash
mvn clean install
```

### Bước 3: Tạo database

Mở SQL Server Management Studio và chạy file `db.sql` ở thư mục gốc project:

```sql
-- File db.sql sẽ tự động tạo database: LuxuryFashion_2025
```

### Bước 4: Cấu hình kết nối database

Mở file `src/main/resources/application.properties` và thay đổi thông tin kết nối:

```properties
# Thay đổi thông tin sau cho phù hợp với SQL Server của bạn
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=LuxuryFashion_2025
spring.datasource.username=sa
spring.datasource.password=your_password_here
```

### Bước 5: Chạy ứng dụng

```bash
mvn spring-boot:run
```

Hoặc chạy trực tiếp từ IDE (Run `LuxuryFashionApplication.java`)

✅ Backend sẽ chạy tại: **http://localhost:8080/api**

---

## ⚙️ CẤU HÌNH

### 1. Kết nối SQL Server từ ngoài vào

Nếu SQL Server của bạn chạy trên máy khác hoặc cloud, thay đổi URL:

```properties
spring.datasource.url=jdbc:sqlserver://your_server_ip:1433;databaseName=LuxuryFashion_2025;encrypt=true;trustServerCertificate=true
```

### 2. Cấu hình JWT

```properties
# Secret key cho JWT (Nên thay đổi trong production)
jwt.secret=YourSuperSecretKeyForJWTTokenGenerationPleaseChangeThis123456789
jwt.expiration=86400000  # 24 giờ (mili giây)
```

### 3. Cấu hình Cloudinary

Đăng ký tài khoản tại [Cloudinary](https://cloudinary.com/) và lấy thông tin:

```properties
cloudinary.cloud-name=your_cloud_name
cloudinary.api-key=your_api_key
cloudinary.api-secret=your_api_secret
```

### 4. Cấu hình Payment Gateway (VNPay, Momo)

```properties
# VNPay
vnpay.tmn-code=your_vnpay_tmn_code
vnpay.hash-secret=your_vnpay_hash_secret

# Momo
momo.partner-code=your_momo_partner_code
momo.access-key=your_momo_access_key
momo.secret-key=your_momo_secret_key
```

---

## 📁 CẤU TRÚC THƯ MỤC

```
backend/
├── src/
│   ├── main/
│   │   ├── java/com/luxuryfashion/
│   │   │   ├── config/              # Cấu hình (Security, CORS, Cloudinary)
│   │   │   ├── controller/          # REST Controllers
│   │   │   ├── service/             # Business Logic
│   │   │   ├── repository/          # Data Access Layer (JPA)
│   │   │   ├── entity/              # Entities (Ánh xạ bảng CSDL)
│   │   │   ├── dto/                 # Data Transfer Objects
│   │   │   ├── security/            # JWT Service, Filters
│   │   │   ├── exception/           # Exception Handlers
│   │   │   ├── util/                # Utility classes
│   │   │   └── LuxuryFashionApplication.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── application-dev.properties
│   └── test/                        # Unit tests
├── pom.xml                          # Maven dependencies
└── README.md
```

---

## 📚 API DOCUMENTATION

### Base URL
```
http://localhost:8080/api
```

### 🔐 Authentication APIs

#### 1. Đăng ký tài khoản
```http
POST /auth/register
Content-Type: application/json

{
  "hoTen": "Nguyễn Văn A",
  "email": "nguyenvana@gmail.com",
  "matKhau": "Password123",
  "soDienThoai": "0901234567"
}
```

#### 2. Đăng nhập
```http
POST /auth/login
Content-Type: application/json

{
  "email": "nguyenvana@gmail.com",
  "matKhau": "Password123"
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "type": "Bearer",
  "email": "nguyenvana@gmail.com",
  "roles": ["KHACHHANG"]
}
```

### 🛍️ Product APIs

```http
GET /products                    # Lấy danh sách sản phẩm (có phân trang, lọc)
GET /products/{id}               # Chi tiết sản phẩm
POST /admin/products             # Tạo sản phẩm mới (ADMIN)
PUT /admin/products/{id}         # Cập nhật sản phẩm (ADMIN)
DELETE /admin/products/{id}      # Xóa sản phẩm (ADMIN)
```

### 🛒 Cart APIs

```http
GET /cart                        # Lấy giỏ hàng của user
POST /cart                       # Thêm sản phẩm vào giỏ
PUT /cart/{id}                   # Cập nhật số lượng
DELETE /cart/{id}                # Xóa khỏi giỏ
```

### 📦 Order APIs

```http
POST /orders/checkout            # Đặt hàng
GET /orders/history              # Lịch sử đơn hàng
GET /orders/{id}                 # Chi tiết đơn hàng
PUT /admin/orders/{id}/status    # Cập nhật trạng thái (ADMIN)
```

---

## 👥 PHÂN CÔNG NHIỆM VỤ

### 👨‍💼 Team Leader (Backend)
- ✅ Setup project, pom.xml, application.properties
- ✅ Cấu hình Security, JWT, CORS
- ✅ Xây dựng module Authentication (đăng ký, đăng nhập)
- ✅ Quản lý Git, Review code

### 👨‍💻 Backend Developer
- ⏳ Xây dựng Entity classes (TaiKhoan, SanPham, DonHang...)
- ⏳ Xây dựng API: Sản phẩm, Giỏ hàng, Đơn hàng
- ⏳ Xây dựng API: Kho hàng (PhieuNhap)
- ⏳ Tích hợp Payment Gateway (VNPay, Momo)

---

## 🐛 TROUBLESHOOTING

### Lỗi: Cannot connect to SQL Server
```
Giải pháp:
1. Kiểm tra SQL Server đã bật chưa
2. Kiểm tra port 1433 đã mở chưa
3. Kiểm tra username/password trong application.properties
4. Thêm ;trustServerCertificate=true vào URL
```

### Lỗi: JWT token invalid
```
Giải pháp:
1. Kiểm tra jwt.secret trong application.properties
2. Kiểm tra token chưa hết hạn
3. Kiểm tra format: Bearer <token>
```

---

## 📞 LIÊN HỆ & HỖ TRỢ

- **Team Leader:** [Tên của bạn]
- **Email:** luxuryfashion@example.com
- **GitHub:** [Link repository]

---

## 📄 LICENSE

Copyright © 2025 Luxury Fashion Team. All rights reserved.

