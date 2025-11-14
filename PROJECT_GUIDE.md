# 📚 LUXURY FASHION - PROJECT COMPLETE GUIDE

**Ngày cập nhật:** 13 Tháng 11, 2025  
**Trạng thái:** ✅ **90%+ HOÀN THÀNH - SẴN SÀNG TEST NGAY**

---

## 📖 MỤC LỤC NHANH

1. [🚀 CÁCH CHẠY DỰ ÁN NGAY](#-cách-chạy-dự-án-ngay---4-bước-đơn-giản)
2. [✅ CÔNG VIỆC ĐÃ HOÀN THÀNH](#-công-việc-đã-hoàn-thành)
3. [🧪 CÁCH TEST](#-cách-test)
4. [📋 DEPLOYMENT CHECKLIST](#-deployment-checklist)
5. [🔐 TEST AUTHENTICATION](#-test-authentication)
6. [📝 NEXT STEPS CHO TEAM](#-next-steps-cho-team)
7. [🆘 TROUBLESHOOTING](#-troubleshooting)

---

## 🚀 CÁCH CHẠY DỰ ÁN NGAY - 4 BƯỚC ĐƠN GIẢN

### **Bước 1: Setup Database (5 phút)**
```bash
# Mở SQL Server Management Studio
# New Query → Paste nội dung file: db.sql (ở thư mục gốc)
# Execute → Database "LuxuryFashion_2025" tự động tạo
```

### **Bước 2: Cấu hình Backend (2 phút)**
```
File: backend/src/main/resources/application.properties

Tìm dòng:
spring.datasource.password=Aa@123456

Thay đổi password phù hợp với SQL Server của bạn
```

### **Bước 3: Chạy Backend (Terminal 1)**
```bash
cd backend
mvn clean install -DskipTests
mvn spring-boot:run
```
✅ Backend chạy tại: **http://localhost:8080/api**

### **Bước 4: Chạy Frontend (Terminal 2)**
```bash
cd frontend
npm install  # Chỉ lần đầu
npm run dev
```
✅ Frontend chạy tại: **http://localhost:5173**

---

## ✅ CÔNG VIỆC ĐÃ HOÀN THÀNH

### **Backend (Spring Boot) - 100% ✅**

| Thành phần | Chi tiết | Status |
|-----------|---------|--------|
| **pom.xml** | Thêm SQL Server JDBC Driver (mssql-jdbc 12.2.0) | ✅ |
| **DTOs** | AuthResponse.java, ApiResponse.java, validation annotations | ✅ |
| **Services** | TaiKhoanService (duplicate check, BCrypt, auto-role), AuthService, UserDetailsServiceImpl | ✅ |
| **Controllers** | AuthController (register/login/logout), UserController (get me) | ✅ |
| **Exception Handler** | GlobalExceptionHandler (tất cả errors) | ✅ |
| **Repositories** | TaiKhoanRepository, RoleRepository, existsByEmail() | ✅ |
| **Entities** | TaiKhoan_Role, TaiKhoanRoleId (composite key) | ✅ |
| **Security** | JWT, BCrypt, CORS, SessionStateless | ✅ |
| **Validation** | Input validation trên DTOs, @Valid annotation | ✅ |

### **Frontend (Vue 3) - 90% ✅**

| Thành phần | Chi tiết | Status |
|-----------|---------|--------|
| **API Service** | axiosInstance.js + api.js (centralized) | ✅ |
| **AuthStore** | Pinia store (login, register, logout, loading state) | ✅ |
| **LoginPage** | Form validation, error messages, loading state | ✅ |
| **RegisterPage** | Full validation, password confirmation, success redirect | ✅ |
| **Router** | Auth guard, protected routes | ✅ |
| **Other Pages** | HomePage, ProductList, Cart, etc. (skeleton - cần integrate API) | 🔄 |

### **Documentation - 100% ✅**

| File | Mục đích |
|------|---------|
| **PROJECT_GUIDE.md** | File này - tổng hợp tất cả (you are here) |
| **backend/README_SETUP.md** | Chi tiết setup backend |
| **TESTING_GUIDE.md** | Hướng dẫn test API từng endpoint |
| **DEPLOYMENT_CHECKLIST.md** | Checklist trước chạy |
| **Luxury_Fashion_API.postman_collection.json** | Postman collection ready |

### **Database - 100% ✅**

- ✅ 24 bảng (TaiKhoan, Role, SanPham, DonHang, GioHang, v.v.)
- ✅ Sample data (users, products, orders)
- ✅ Foreign keys & constraints
- ✅ SQL Server compatible

---

## 🧪 CÁCH TEST

### **Cách 1: Test qua Browser (Đơn giản - 2 phút)**

1. Mở http://localhost:5173
2. Click "Đăng ký" → Register tài khoản mới
3. Click "Đăng nhập" → Login với tài khoản vừa tạo
4. Xem thông tin user
5. Click "Đăng xuất" → Logout

**Expected:**
- ✅ Đăng ký thành công, redirect login
- ✅ Đăng nhập thành công, redirect home
- ✅ Token lưu localStorage
- ✅ Đăng xuất xóa token

### **Cách 2: Test qua Postman (Chuyên nghiệp - 5 phút)**

1. Mở Postman
2. File → Import → Chọn `Luxury_Fashion_API.postman_collection.json`
3. Set environment variable: `baseUrl = http://localhost:8080/api`
4. Test các endpoints:

```bash
# 1. Register
POST /auth/register
Body: {
  "email": "test@example.com",
  "password": "Password123",
  "fullName": "Test User"
}
Response: 201 + user data ✅

# 2. Login
POST /auth/login
Body: {
  "email": "khachhang@luxury.com",
  "password": "123456"
}
Response: 200 + token + user ✅

# 3. Get Current User
GET /users/me
Header: Authorization: Bearer {token}
Response: 200 + user info ✅

# 4. Logout
POST /auth/logout
Header: Authorization: Bearer {token}
Response: 200 ✅
```

### **Default Users để test (password = 123456)**

| Email | Password | Role |
|-------|----------|------|
| admin@luxury.com | 123456 | ADMIN |
| nhanvien@luxury.com | 123456 | NHANVIEN |
| khachhang@luxury.com | 123456 | KHACHHANG |

---

## 📋 DEPLOYMENT CHECKLIST

### **Pre-Deployment (Before running)**

- [ ] Java 17+ cài đặt: `java -version`
- [ ] Maven 3.6+ cài đặt: `mvn -version`
- [ ] Node.js 16+ cài đặt: `node -v`
- [ ] SQL Server 2019+ bật (Services)
- [ ] Port 8080 không bị dùng
- [ ] Port 5173 không bị dùng
- [ ] Database "LuxuryFashion_2025" đã tạo
- [ ] application.properties cấu hình password SQL Server

### **Startup Verification**

- [ ] Backend starts: `mvn spring-boot:run`
- [ ] Frontend starts: `npm run dev`
- [ ] No console errors
- [ ] Backend API reachable: http://localhost:8080/api
- [ ] Frontend reachable: http://localhost:5173

### **Functional Testing**

- [ ] Register new user → 201 Created
- [ ] Login with credentials → 200 + token
- [ ] GET /users/me with token → 200 + user data
- [ ] Logout → 200 OK
- [ ] Token removed from localStorage after logout
- [ ] Invalid credentials → 401 Unauthorized
- [ ] Register with duplicate email → 400 Bad Request
- [ ] Form validation works (email, password format)

### **Security Checks**

- [ ] Password encrypted (BCrypt)
- [ ] JWT token valid
- [ ] CORS configured (localhost:5173)
- [ ] CSRF disabled (stateless JWT)
- [ ] No sensitive data in logs
- [ ] Role-based access control working

---

## 🔐 TEST AUTHENTICATION

### **1. Register Test**

**Request:**
```
POST http://localhost:8080/api/auth/register

Body:
{
  "email": "newuser@test.com",
  "password": "Password123",
  "fullName": "Test User"
}
```

**Expected Response:**
```json
{
  "success": true,
  "message": "Đăng ký thành công",
  "data": {
    "id": 4,
    "email": "newuser@test.com",
    "fullName": "Test User",
    "roles": ["KHACHHANG"]
  },
  "timestamp": "2025-11-13T10:30:00"
}
```

### **2. Login Test**

**Request:**
```
POST http://localhost:8080/api/auth/login

Body:
{
  "email": "khachhang@luxury.com",
  "password": "123456"
}
```

**Expected Response:**
```json
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
  },
  "timestamp": "2025-11-13T10:30:00"
}
```

**→ Copy token, lưu vào environment variable trong Postman**

### **3. Get Current User Test**

**Request:**
```
GET http://localhost:8080/api/users/me

Header:
Authorization: Bearer {token}
```

**Expected Response:**
```json
{
  "success": true,
  "message": "Lấy thông tin user thành công",
  "data": {
    "id": 3,
    "email": "khachhang@luxury.com",
    "fullName": "Lê Văn Khách",
    "roles": ["KHACHHANG"]
  },
  "timestamp": "2025-11-13T10:30:00"
}
```

### **4. Logout Test**

**Request:**
```
POST http://localhost:8080/api/auth/logout

Header:
Authorization: Bearer {token}
```

**Expected Response:**
```json
{
  "success": true,
  "message": "Đăng xuất thành công",
  "data": null,
  "timestamp": "2025-11-13T10:30:00"
}
```

### **5. Error Cases**

**Invalid Email Format:**
```
POST /auth/register
Body: {
  "email": "invalid-email",
  "password": "Password123",
  "fullName": "Test"
}

Response: 400
{
  "success": false,
  "message": "Validation failed",
  "data": {
    "email": "Email không hợp lệ"
  }
}
```

**Duplicate Email:**
```
POST /auth/register
Body: {
  "email": "khachhang@luxury.com",
  "password": "Password123",
  "fullName": "Test"
}

Response: 400
{
  "success": false,
  "message": "Email đã tồn tại",
  "data": null
}
```

**Wrong Password:**
```
POST /auth/login
Body: {
  "email": "khachhang@luxury.com",
  "password": "wrongpassword"
}

Response: 401
{
  "success": false,
  "message": "Email hoặc password không đúng",
  "data": null
}
```

---

## 📝 NEXT STEPS CHO TEAM

### **🔧 Backend Developer**

**Phase 2 - Tạo các modules tiếp theo:**

1. **Product Module**
   ```
   GET    /api/products              - Danh sách sản phẩm (phân trang, lọc)
   GET    /api/products/{id}         - Chi tiết sản phẩm
   POST   /api/admin/products        - Tạo sản phẩm mới
   PUT    /api/admin/products/{id}   - Cập nhật sản phẩm
   DELETE /api/admin/products/{id}   - Xóa sản phẩm
   ```

2. **Cart Module**
   ```
   GET    /api/cart                  - Lấy giỏ hàng của user
   POST   /api/cart                  - Thêm item vào giỏ
   PUT    /api/cart/{id}             - Cập nhật số lượng
   DELETE /api/cart/{id}             - Xóa khỏi giỏ
   ```

3. **Order Module**
   ```
   POST   /api/orders/checkout       - Checkout (tạo đơn hàng)
   GET    /api/orders/history        - Lịch sử đơn hàng của user
   GET    /api/orders/{id}           - Chi tiết đơn hàng
   PUT    /api/admin/orders/{id}/status - Cập nhật trạng thái
   ```

4. **Warehouse Module**
   ```
   POST   /api/admin/warehouse/import - Nhập kho (PhieuNhap)
   GET    /api/admin/warehouse/history - Lịch sử nhập kho
   ```

**Reference:** Xem db.sql để hiểu database schema

### **👨‍🎨 Frontend Dev (Client)**

**Phase 2 - Integrate API cho các pages:**

1. **HomePage.vue** - Hiển thị danh sách sản phẩm
   - Call: `GET /api/products`
   - Display: Product list with images, prices
   
2. **ProductDetailPage.vue** - Chi tiết sản phẩm
   - Call: `GET /api/products/{id}`
   - Display: Product details, variants
   
3. **CartPage.vue** - Giỏ hàng
   - Call: `GET /api/cart`
   - Actions: Add, remove, update quantity
   
4. **CheckoutPage.vue** - Checkout
   - Call: `POST /api/orders/checkout`
   - Handle: Shipping address, payment method
   
5. **OrderHistoryPage.vue** - Lịch sử đơn hàng
   - Call: `GET /api/orders/history`
   - Display: Order list with status

### **👨‍🎨 Frontend Dev (Admin)**

**Phase 2 - Tạo Admin Dashboard:**

1. **ProductManagement.vue** - Quản lý sản phẩm
   - CRUD: POST, PUT, DELETE /admin/products
   
2. **OrderManagement.vue** - Quản lý đơn hàng
   - GET: /orders
   - PUT: /admin/orders/{id}/status
   
3. **WarehouseManagement.vue** - Quản lý kho
   - POST: /admin/warehouse/import
   
4. **Dashboard.vue** - Thống kê
   - GET: /admin/statistics
   - Charts: Revenue, Orders, Customers

---

## 🆘 TROUBLESHOOTING

### **Backend Issues**

#### "Cannot connect to database"
```bash
✅ Kiểm tra:
- SQL Server đã bật: Services → SQL Server (MSSQLSERVER)
- Password đúng trong application.properties
- Database "LuxuryFashion_2025" đã tạo: SELECT * FROM sys.databases
- TCP/IP enabled: SQL Server Configuration Manager
```

#### "Port 8080 already in use"
```bash
# Kill process đang dùng port
lsof -ti:8080 | xargs kill -9        # macOS/Linux
netstat -ano | findstr :8080         # Windows

# Hoặc thay đổi port
server.port=8081  # trong application.properties
```

#### "Maven download failed"
```bash
# Xóa cache Maven
rm -rf ~/.m2/repository

# Chạy lại
mvn clean install -DskipTests
```

### **Frontend Issues**

#### "npm ERR! code ERESOLVE"
```bash
npm install --legacy-peer-deps
```

#### "Port 5173 already in use"
```bash
# Kill process
lsof -ti:5173 | xargs kill -9        # macOS/Linux
netstat -ano | findstr :5173         # Windows

# Hoặc run on different port
npm run dev -- --port 3000
```

#### "Module not found"
```bash
# Clear cache và reinstall
rm -rf node_modules package-lock.json
npm install
```

### **API Connection Issues**

#### "Cannot fetch from http://localhost:8080/api"
```bash
✅ Kiểm tra:
- Backend chạy: http://localhost:8080/api/auth/login (test với curl)
- CORS configuration đúng
- Frontend URL đúng: http://localhost:5173
- Network tab trong DevTools: xem request headers
```

#### "401 Unauthorized"
```bash
✅ Kiểm tra:
- Token được lưu: Check localStorage
- Token format: "Authorization: Bearer {token}"
- Token hết hạn?: Login lại
- Token signature valid: Check JwtService
```

### **Database Issues**

#### "Role KHACHHANG không tồn tại"
```sql
-- Check roles
SELECT * FROM Role;

-- Nếu trống, chạy lại db.sql
```

#### "Duplicate key error"
```sql
-- Xóa duplicate
DELETE FROM TaiKhoan WHERE email = 'duplicate@test.com';

-- Hoặc truncate & re-seed
TRUNCATE TABLE TaiKhoan;
-- Chạy lại db.sql
```

---

## 📊 PROJECT STATUS

```
═════════════════════════════════════════════════════════════
  LUXURY FASHION E-COMMERCE
  
  🎯 Phase: 1 (Basic Auth & Setup)
  📊 Completion: 90%+ ✅
  
  Backend:       100% (Ready)
  Frontend:       90% (Auth done, other pages = skeleton)
  Database:      100% (Ready)
  Security:      100% (Ready)
  Documentation: 100% (Ready)
  
  🚀 READY FOR TESTING & INTEGRATION!
═════════════════════════════════════════════════════════════
```

---

## 📁 FILE STRUCTURE

```
Prestige/
├── PROJECT_GUIDE.md                      # 👈 YOU ARE HERE
├── backend/README_SETUP.md               # Detailed backend setup
├── TESTING_GUIDE.md                      # API testing guide
├── DEPLOYMENT_CHECKLIST.md               # Pre-deployment checklist
├── Luxury_Fashion_API.postman_collection.json
│
├── backend/
│   ├── pom.xml                           # Maven dependencies
│   ├── src/main/resources/
│   │   └── application.properties        # Database config
│   ├── src/main/java/com/luxuryfashion/
│   │   ├── config/                       # SecurityConfig, CorsConfig
│   │   ├── controller/                   # AuthController, UserController
│   │   ├── dto/                          # Request/Response DTOs
│   │   ├── entity/                       # JPA Entities
│   │   ├── exception/                    # GlobalExceptionHandler
│   │   ├── repository/                   # JPA Repositories
│   │   ├── security/                     # JWT, Filter, UserDetailsService
│   │   └── service/                      # Business Logic
│   └── target/                           # Compiled classes
│
├── frontend/
│   ├── package.json                      # NPM dependencies
│   ├── vite.config.js                    # Vite configuration
│   ├── tailwind.config.js                # Tailwind CSS
│   ├── src/
│   │   ├── main.js                       # Entry point
│   │   ├── App.vue                       # Root component
│   │   ├── api/                          # API service (axiosInstance, api)
│   │   ├── stores/                       # Pinia stores (authStore, cartStore)
│   │   ├── router/                       # Vue Router
│   │   ├── views/                        # Pages (Login, Register, Home, etc.)
│   │   └── assets/                       # Images, styles
│   └── node_modules/                     # Dependencies
│
├── db.sql                                # Database schema & seed data
└── (other files...)
```

---

## 🎉 QUICK START

**Just 4 steps to run:**

```bash
# 1. Setup database (SQL Server Management Studio)
# File → Open → db.sql → Execute

# 2. Configure backend
# Edit: backend/src/main/resources/application.properties
# Change: spring.datasource.password=YOUR_PASSWORD

# 3. Run backend
cd backend
mvn spring-boot:run

# 4. Run frontend (in new terminal)
cd frontend
npm run dev

# ✅ Then open http://localhost:5173 and test!
```

---

## 📞 NEED HELP?

1. **For Setup Issues:** Check `backend/README_SETUP.md`
2. **For Testing:** Check `TESTING_GUIDE.md`
3. **For Deployment:** Check `DEPLOYMENT_CHECKLIST.md`
4. **For API Testing:** Import `Luxury_Fashion_API.postman_collection.json`
5. **For Database:** Check `db.sql`

---

**Made with ❤️ for Luxury Fashion**  
**Ready to ship! 🚀**

