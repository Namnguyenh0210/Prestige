# 🚀 HƯỚNG DẪN NHANH CHO NGƯỜI ĐẦU TIÊN (TEAM LEADER BACKEND)

## 📋 TÓM TẮT DỰ ÁN

**Luxury Fashion** - Hệ thống E-commerce bán quần áo cao cấp
- **Kiến trúc:** Frontend (Vue 3) và Backend (Spring Boot) **tách biệt hoàn toàn**
- **Database:** SQL Server với mô hình "Production 2025" - Rất chuyên nghiệp
- **Giao tiếp:** REST API + JWT Authentication

---

## ⚡ CÁCH CHẠY NHANH NHẤT (KHUYẾN NGHỊ)

### 🎯 Chỉ cần 1 lệnh duy nhất:

**Trên macOS/Linux:**
```bash
./start.sh
```

**Trên Windows:**
```batch
start.bat
```

Script sẽ tự động:
- ✅ Kiểm tra Java, Maven, Node.js
- ✅ Cài đặt tất cả dependencies
- ✅ Chạy Backend tại http://localhost:8080/api
- ✅ Chạy Frontend tại http://localhost:5173

**Dừng services:**
```bash
./stop.sh        # macOS/Linux
stop.bat         # Windows
```

---

## 🔧 CÁCH CHẠY THỦ CÔNG (NẾU CẦN)

### Bước 1: Chạy Backend

**Terminal 1 - Chạy Backend:**
```bash
# Di chuyển vào thư mục backend
cd backend

# Cài đặt dependencies (chỉ cần làm 1 lần đầu)
mvn clean install -DskipTests

# Chạy Backend
mvn spring-boot:run
```

✅ **Backend chạy tại:** http://localhost:8080/api

Bạn sẽ thấy:
```
╔══════════════════════════════════════════════════════════╗
║   LUXURY FASHION BACKEND API - STARTED SUCCESSFULLY      ║
║   Backend đang chạy tại: http://localhost:8080/api      ║
╚══════════════════════════════════════════════════════════╝
```

**Để dừng Backend:** Nhấn `Ctrl + C`

---

### Bước 2: Chạy Frontend

**Terminal 2 - Chạy Frontend (Terminal mới):**
```bash
# Di chuyển vào thư mục frontend
cd frontend

# Cài đặt dependencies (chỉ cần làm 1 lần đầu)
npm install

# Chạy Frontend
npm run dev
```

✅ **Frontend chạy tại:** http://localhost:5173

Bạn sẽ thấy:
```
  VITE v5.0.8  ready in 500 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

**Để dừng Frontend:** Nhấn `Ctrl + C`

---

## 📝 TÓM TẮT CÚ PHÁP

### Backend (Spring Boot):
```bash
cd backend
mvn clean install -DskipTests    # Cài dependencies (1 lần)
mvn spring-boot:run              # Chạy Backend
```

### Frontend (Vue 3):
```bash
cd frontend
npm install                      # Cài dependencies (1 lần)
npm run dev                      # Chạy Frontend
```

---

## ✅ ĐÃ SETUP SẴN CHO BẠN

### Backend (Spring Boot):
- ✅ `pom.xml` - Đầy đủ dependencies (Spring Boot, Security, JPA, JWT...)
- ✅ `application.properties` - Cấu hình kết nối SQL Server, JWT, Momo Payment
- ✅ **Security Config** - Spring Security + JWT hoàn chỉnh
- ✅ **JWT Service** - Tạo và validate JWT token
- ✅ **JWT Filter** - Kiểm tra token trong mỗi request
- ✅ **CORS Config** - Cho phép Frontend gọi API
- ✅ **Exception Handler** - Xử lý lỗi thống nhất
- ✅ **UserDetailsService** - Temporary InMemory (Team Leader sẽ thay thế)
- ✅ Cấu trúc package đầy đủ

### Frontend (Vue 3):
- ✅ `package.json` - Đầy đủ dependencies (Vue 3, Vite, Pinia, Axios, Tailwind...)
- ✅ **Router** - Với authentication guard
- ✅ **authStore** - Quản lý đăng nhập/đăng ký
- ✅ **cartStore** - Quản lý giỏ hàng (đồng bộ local + server)
- ✅ **Axios instance** - Tự động thêm JWT token
- ✅ Các trang cơ bản (Home, Login, Register, Products, Cart, Admin...)
- ✅ Tailwind CSS đã config

---

## 🎯 NHIỆM VỤ CỦA BẠN (TEAM LEADER BACKEND)

**Backend hiện tại đã chạy được!** 🎉

Nhưng đang dùng **InMemory User** (tạm thời). Bạn cần:

### 1️⃣ Tạo Database (5 phút)
```bash
# Mở SQL Server Management Studio
# Chạy file: db.sql (ở thư mục gốc Prestige)
# Database "LuxuryFashion_2025" sẽ tự động được tạo
```

### 2️⃣ Cấu hình kết nối Database (2 phút)
Mở file: `backend/src/main/resources/application.properties`

Thay đổi dòng này:
```properties
spring.datasource.password=your_password_here
```
Thành password SQL Server của bạn, ví dụ:
```properties
spring.datasource.password=123456
```

### 3️⃣ Tạo Entity Classes (30 phút)

Tạo file: `backend/src/main/java/com/luxuryfashion/entity/TaiKhoan.java`
```java
@Entity
@Table(name = "TaiKhoan")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaiKhoan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTaiKhoan")
    private Integer maTaiKhoan;
    
    @Column(name = "HoTen", nullable = false)
    private String hoTen;
    
    @Column(name = "Email", nullable = false, unique = true)
    private String email;
    
    @Column(name = "MatKhau", nullable = false)
    private String matKhau;
    
    @Column(name = "SoDienThoai")
    private String soDienThoai;
    
    @Column(name = "TrangThai")
    private Boolean trangThai = true;
    
    // Relationships
    @OneToMany(mappedBy = "taiKhoan")
    private List<TaiKhoan_Role> roles;
}
```

Tương tự cho: `Role.java`, `TaiKhoan_Role.java`

### 4️⃣ Tạo Repository (5 phút)

```java
public interface TaiKhoanRepository extends JpaRepository<TaiKhoan, Integer> {
    Optional<TaiKhoan> findByEmail(String email);
    boolean existsByEmail(String email);
}
```

### 5️⃣ Thay thế UserDetailsService (20 phút)

Tạo file: `backend/src/main/java/com/luxuryfashion/security/UserDetailsServiceImpl.java`
```java
@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {
    
    private final TaiKhoanRepository taiKhoanRepository;
    
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // Load user từ database và trả về UserDetails
        // Code chi tiết sẽ được hướng dẫn sau
    }
}
```

Sau đó **XÓA FILE** `UserDetailsServiceConfig.java` (file temporary)

### 6️⃣ Tạo AuthService & AuthController (30 phút)

API: 
- `POST /auth/register` - Đăng ký
- `POST /auth/login` - Đăng nhập

### 7️⃣ Test với Postman (10 phút)

---

## 🤝 CHIA TASK CHO TEAM

Sau khi bạn hoàn thành module Authentication, chia task:

### 👨‍💻 Backend Developer:
- Tạo entities: SanPham, SanPhamChiTiet, DonHang, GioHang...
- API Sản phẩm, Giỏ hàng, Đơn hàng

### 👨‍🎨 Frontend Dev (Client):
- UI Trang chủ, Danh sách sản phẩm, Chi tiết SP, Giỏ hàng
- Tích hợp API

### 👨‍🎨 Frontend Dev (Admin):
- UI Admin Dashboard, Quản lý sản phẩm, đơn hàng, kho

---

## 📚 TÀI LIỆU CHI TIẾT

- `README.md` (thư mục gốc) - Tổng quan toàn bộ project
- `backend/README.md` - Chi tiết Backend
- `frontend/README.md` - Chi tiết Frontend
- `Dự_Án_Tốt_Nghiệp_FPT.md` - Kế hoạch dự án đầy đủ

---

## 🆘 TROUBLESHOOTING

### Lỗi: Cannot connect to SQL Server
**Giải pháp:**
1. Kiểm tra SQL Server đã bật chưa
2. Kiểm tra port 1433 đã mở
3. Kiểm tra username/password trong application.properties
4. Bật TCP/IP trong SQL Server Configuration Manager

### Lỗi: Port 8080 already in use
**Giải pháp:**
```bash
# Tìm và kill process đang dùng port 8080
lsof -ti:8080 | xargs kill -9     # macOS/Linux
netstat -ano | findstr :8080      # Windows - tìm PID
taskkill /PID <PID> /F            # Windows - kill process
```

Hoặc thay đổi port trong `application.properties`:
```properties
server.port=8081
```

### Lỗi: npm install failed (Frontend)
**Giải pháp:**
```bash
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
```

### Lỗi: Backend không khởi động được
**Kiểm tra log:**
```bash
# Nếu dùng start.sh
cat logs/backend.log

# Nếu chạy thủ công, xem output trên terminal
```

---

## 📞 LƯU Ý QUAN TRỌNG

### Kết nối SQL Server từ ngoài vào:

Nếu SQL Server chạy trên máy khác:
```properties
spring.datasource.url=jdbc:sqlserver://192.168.1.100:1433;databaseName=LuxuryFashion_2025;encrypt=true;trustServerCertificate=true
```

Đảm bảo:
- ✅ Bật TCP/IP trong SQL Server Configuration Manager
- ✅ Mở port 1433 trong Firewall
- ✅ SQL Server Authentication: Mixed Mode
- ✅ User có quyền truy cập database

---

## 🎉 CHÚC MỪNG!

Bạn đã có **nền tảng hoàn chỉnh** để bắt đầu phát triển. Backend và Frontend đã chạy được!

**Các bước tiếp theo:**
1. ✅ Backend & Frontend đã chạy (test tại http://localhost:5173)
2. ⏳ Tạo database và entities
3. ⏳ Thay thế UserDetailsService bằng database thật
4. ⏳ Tạo API Authentication
5. ⏳ Chia task cho team

---

**Thời gian ước tính:**
- Chạy được project: ✅ **XONG!** (1 lệnh duy nhất)
- Hoàn thành module Authentication: **2 giờ**
- Chia task cho team: **30 phút**

**🚀 Bắt đầu code ngay bây giờ!**
