# Thẻ 1

# 

# **🧭 KẾ HOẠCH DỰ ÁN TOÀN DIỆN: Luxury Fashion – Hệ thống E-commerce cao cấp tích hợp AI**

# **🩵 GIAI ĐOẠN 1: MÔN JAVA 6 – WEBSITE BÁN QUẦN ÁO LUXURY**

🎯 Mục tiêu Giai đoạn 1

Xây dựng một hệ thống bán quần áo luxury online hoàn chỉnh.

* **Chức năng:** Quản trị, thanh toán (COD/Momo/VNPay), giao hàng, đăng nhập, phân quyền, giỏ hàng (đồng bộ CSDL).  
* **Kiến trúc:** API tách biệt (Frontend – Backend độc lập).  
* **Nền tảng:** Sử dụng CSDL "Production 2025" (mô hình Biến thể, Phân quyền Role, Kho) làm móng kỹ thuật ổn định để mở rộng cho dự án tốt nghiệp.

💻 Thời gian thực hiện: 4 tuần

👥 Nhóm: 4 người

---

#### **1\. Mục tiêu cụ thể**

* Xây dựng website thương mại điện tử bán quần áo cao cấp.  
* Quản lý toàn bộ quy trình: Người dùng đăng ký → Đăng nhập → Quản lý giỏ hàng → Mua hàng → Thanh toán → Giao hàng.  
* Có trang quản trị (Admin) để quản lý sản phẩm, đơn hàng, người dùng, nhân viên, kho hàng (PhieuNhap).  
* Hệ thống API và giao diện tách biệt (Frontend – Backend độc lập).  
* Dựng nền tảng kỹ thuật ổn định để mở rộng thêm tính năng Membership & AI trong giai đoạn tốt nghiệp.

  #### **2\. Phân tích hệ thống**

* **Đối tượng:**  
  * **Khách hàng:** Xem sản phẩm, lọc (theo giới tính, loại...), thêm vào giỏ, đặt hàng, thanh toán.  
  * **Nhân viên:** Quản lý đơn hàng, nhập kho, quản lý sản phẩm.  
  * **Admin:** Quản lý người dùng, sản phẩm, phân quyền, doanh thu, khuyến mãi.  
* **Quy trình nghiệp vụ:**  
  * Khách hàng truy cập website → Đăng ký tài khoản → Đăng nhập.  
  * Duyệt danh mục sản phẩm (áo, quần, phụ kiện...).  
  * Thêm sản phẩm (biến thể) vào giỏ hàng (Lưu vào Pinia nếu chưa đăng nhập, lưu vào CSDL nếu đã đăng nhập).  
  * Tiến hành đặt hàng và thanh toán (**COD / Chuyển khoản / Momo / VNPay**).  
  * Nhân viên/Admin xác nhận đơn → Giao hàng → Cập nhật trạng thái (lưu vào LichSuDonHang).  
  * Admin theo dõi thống kê doanh thu (tính real-time từ bảng DonHang).

  #### **3\. Kiến trúc hệ thống**

* **Mô hình:** Frontend – Backend tách biệt, giao tiếp qua RESTful API.  
  **Cấu trúc thư mục (Ví dụ):**  
  luxury-fashion/  
  ├── backend/ (Spring Boot)  
  │   ├── src/main/java/com/luxuryfashion  
  │   ├── src/main/resources  
  │   └── pom.xml  
  └── frontend/ (Vue 3\)  
      ├── src/  
      ├── public/  
      └── package.json  
* 

  #### **4\. Công nghệ sử dụng**

| Phần | Công nghệ | Mục đích |
| :---- | :---- | :---- |
| **Backend** | Spring Boot 3 \+ Maven | Nền tảng backend chính |
|  | Spring Data JPA | Truy xuất dữ liệu với SQL Server |
|  | SQL Server | Lưu trữ CSDL "Production 2025" |
|  | Spring Security / JWT | Xác thực & phân quyền (theo Role) |
|  | RESTful API | Giao tiếp với frontend |
|  | Lombok \+ Validation | Tối giản code & kiểm tra dữ liệu |
| **Frontend** | Vue 3 (Composition API) | Giao diện SPA hiện đại |
|  | Tailwind CSS | Giao diện responsive, dễ tùy chỉnh |
|  | Pinia | Quản lý state (giỏ hàng, user) |
|  | Axios | Gọi API backend |
|  | Vue Router | Điều hướng giữa các trang |
| **Khác** | GitHub | Quản lý mã nguồn nhóm |
|  | Figma | Thiết kế giao diện |
|  | Postman | Kiểm thử API |

  #### **5\. Chức năng chi tiết (GĐ 1\)**

* **🧍‍♂️ Module Khách hàng (Client)**  
  * Đăng ký, đăng nhập, đăng xuất (JWT, TaiKhoan\_Role).  
  * Cập nhật thông tin cá nhân, quản lý SoDiaChi.  
  * Xem danh sách sản phẩm, tìm kiếm, lọc theo GioiTinh, LoaiSanPham...  
  * Xem chi tiết sản phẩm và các biến thể (SanPhamChiTiet).  
  * **Giỏ hàng (Quan trọng):**  
    * Thêm/sửa/xóa biến thể trong giỏ.  
    * Đồng bộ giỏ hàng (Local Storage ↔ CSDL).  
  * Thanh toán (chọn HinhThucThanhToan), áp dụng KhuyenMai.  
  * Xem lịch sử đơn hàng (DonHang) và lịch sử trạng thái (LichSuDonHang).  
  * Viết đánh giá (DanhGia) cho sản phẩm đã mua (DonHangCT).  
* **👨‍💼 Module Quản trị (Admin)**  
  * Quản lý sản phẩm (CRUD), biến thể, hình ảnh.  
  * Quản lý danh mục, thương hiệu, size, màu sắc.  
  * Quản lý kho (tạo PhieuNhap và NhapKhoChiTiet).  
  * Quản lý đơn hàng: xác nhận, giao hàng, hủy đơn (cập nhật TrangThaiDH, TrangThaiThanhToan).  
  * Quản lý người dùng & phân quyền (CRUD TaiKhoan, Role).  
  * Quản lý Khuyến mãi (CRUD KhuyenMai).  
  * Xem thống kê doanh thu (Dashboard).

  #### **6\. Phân công công việc (4 người)**

| Vị trí | Vai trò chính | Nhiệm Vụ Code (Tóm tắt) | ⚙️ Chi Tiết Nhiệm Vụ Code (Cụ thể) |
| :---- | :---- | :---- | :---- |
| **Team Leader (Backend)** | Quản lý & Kiến trúc sư | \- Cấu trúc Spring Boot, Security (JWT, Role). \- Xây dựng API cốt lõi: Tài khoản, Phân quyền. \- Quản lý chung, Review code, Merge code. | \- **Setup Project:** pom.xml, application.properties (Kết nối CSDL, Cloudinary...). \- **Entities & DTOs:** Tạo các entities TaiKhoan, Role, TaiKhoan\_Role. Tạo các DTOs (Data Transfer Objects) như AuthRequest, RegisterRequest, UserDTO. \- **Security:** Cấu hình SecurityConfig (Spring Security), JwtAuthenticationFilter, AuthenticationProvider, PasswordEncoder (Bcrypt). \- **Core API:** Xây dựng AuthController (POST /api/auth/register, POST /api/auth/login), UserController (GET /api/users/me). \- **Quản lý:** Cấu hình CORS, Global Exception Handler (@RestControllerAdvice), và thiết lập nhánh (branch) trên GitHub. |
| **Frontend Dev (Client)** | Phát triển UI/UX Khách hàng | \- Cấu trúc Vue 3 (Pinia, Router, Tailwind). \- Xây dựng UI: Trang chủ, Chi tiết SP, Giỏ hàng, Thanh toán. \- Tích hợp API: Đăng ký/nhập, Sản phẩm, Giỏ hàng, Checkout. | \- **Setup Project:** main.js (khởi tạo Vue, Pinia, Router), cấu hình axios (tạo instance với interceptors để đính kèm JWT). \- **Pinia Store:** Tạo authStore.js (quản lý state user, token, logic login/logout) và cartStore.js (quản lý giỏ hàng, logic đồng bộ CSDL khi đăng nhập). \- **Pages:** Tạo các trang (views): HomePage.vue, ProductDetailPage.vue, CartPage.vue, CheckoutPage.vue, LoginPage.vue, RegisterPage.vue, OrderHistory.vue. \- **Logic:** Tích hợp API (gọi các API của Backend Dev). Xử lý logic hiển thị các biến thể (SanPhamChiTiet) phức tạp ở trang chi tiết sản phẩm. |
| **Frontend Dev (Admin)** | Phát triển UI/UX Quản trị | \- Xây dựng toàn bộ giao diện trang Quản trị (Admin Dashboard). \- Tích hợp API: CRUD Sản phẩm, Quản lý Đơn hàng, Kho. \- Xây dựng Dashboard thống kê (Biểu đồ). | \- **Setup Project:** Xây dựng AdminLayout.vue (gồm Sidebar, Header). Cấu hình router (admin guard) để bảo vệ các trang quản trị. \- **Pages (CRUD):**  \- ProductManagement.vue: Bảng danh sách sản phẩm. \- ProductForm.vue: Form (Tạo/Cập nhật) sản phẩm. **(Phức tạp: xử lý logic thêm/sửa/xóa các biến thể SanPhamChiTiet trong 1 form).**  \- OrderManagement.vue: Bảng DonHang, xem chi tiết, các nút cập nhật TrangThaiDH. \- WarehouseManagement.vue: Bảng PhieuNhap, form tạo PhieuNhap và NhapKhoChiTiet. \- PromotionManagement.vue: Form CRUD KhuyenMai. \- **Dashboard:** Dashboard.vue (dùng Chart.js để vẽ biểu đồ, gọi API thống kê). |
| **Backend Developer** | Phát triển tính năng Backend | \- Thiết kế CSDL (đã hoàn thành). \- Xây dựng API: Sản phẩm, Giỏ hàng, Đơn hàng, Kho (PhieuNhap). \- Xây dựng API: Khuyến mãi, Thanh toán (Momo/VNPay). | \- **Entities & DTOs:** Tạo tất cả các entities nghiệp vụ còn lại (SanPham, SanPhamChiTiet, DonHang, DonHangCT, PhieuNhap, NhapKhoChiTiet, KhuyenMai...). \- **API Sản Phẩm:** ProductController (GET /api/products (lọc, phân trang), GET /api/products/{id}, POST /api/admin/products, PUT /api/admin/products/{id}). \- **API Giỏ Hàng:** CartController (GET /api/cart, POST /api/cart (thêm/cập nhật số lượng), DELETE /api/cart/{bienTheId}). \- **API Đơn Hàng:** OrderController (POST /api/orders/checkout (Logic quan trọng: **trừ SoLuongTon**, tạo DonHang, tạo LichSuDonHang, xóa GioHang), GET /api/orders/my-history, PUT /api/admin/orders/{id}/status). \- **API Kho:** WarehouseController (POST /api/admin/warehouse/import (Logic quan trọng: tạo PhieuNhap, **cộng SoLuongTon**), GET /api/admin/warehouse/history). \- **API Thanh Toán:** PaymentController (POST /api/payment/vnpay/create, POST /api/payment/momo/create). |

  #### **7\. Kết quả mong đợi (GĐ 1\)**

* Website bán quần áo luxury hoàn chỉnh.  
* Có đầy đủ quy trình mua hàng, thanh toán, quản trị kho.  
* Code sạch, tách biệt frontend-backend, dễ mở rộng.  
* Làm nền tảng vững chắc cho giai đoạn Dự án Tốt nghiệp.  
  ---

---

  ### **🩶 GIAI ĐOẠN 2: DỰ ÁN TỐT NGHIỆP – MỞ RỘNG TÍNH NĂNG**

🎯 Mục tiêu Giai đoạn 2

Mở rộng hệ thống thành nền tảng Bán hàng cao cấp, tích hợp sâu Membership, Chat realtime, và AI hỗ trợ thời trang.

* **Nền tảng:** Dựa hoàn toàn trên code Giai đoạn 1, chỉ mở rộng thêm module.

⏱ Thời gian: 3 tháng

👥 Nhóm: 5 người

---

#### **1\. Mục tiêu cụ thể**

* Thêm hệ thống **Membership** (VIP, Platinum...) với ưu đãi riêng (dựa trên bảng GoiThanhVien và DangKyThanhVien).  
* Thêm **AI Stylist**: Trợ lý thời trang gợi ý outfit dựa trên sở thích (dùng ChatGPT API).  
* Tích hợp **Chatbox realtime** (PhongChat, TinNhan) để nhân viên tư vấn khách hàng.  
* Hoàn thiện hệ thống **Tương tác xã hội** (Like/Reply cho BinhLuan, DanhGia).  
* Xây dựng Dashboard thống kê nâng cao bằng biểu đồ và AI.

  #### **2\. Mô hình kiến trúc mở rộng**

* **🔹 Backend (Spring Boot)**  
  * Giữ nguyên core API bán hàng cũ.  
  * Thêm module:  
    * /api/memberships (API Quản lý gói thành viên)  
    * /api/chat (WebSocket API cho TinNhan)  
    * /api/ai (Kết nối OpenAI API gợi ý thời trang)  
* **🔹 Frontend (Vue 3\)**  
  * Giữ nguyên UI bán hàng.  
  * Thêm trang:  
    * "Gói thành viên"  
    * "Trợ lý AI"  
  * Thêm component: ChatBox realtime (Socket.io hoặc WebSocket).

  #### **3\. Công nghệ sử dụng thêm**

| Phần | Công nghệ | Mục đích |
| :---- | :---- | :---- |
| **Realtime Chat** | WebSocket (STOMP \+ SockJS) | Chat realtime nhân viên ↔ khách hàng |
| **AI Stylist** | OpenAI API (ChatGPT) | Gợi ý phong cách, phối đồ |
| **Membership** | JWT \+ Role \+ Point System | Phân hạng khách hàng, giảm giá ưu tiên |
| **Dashboard** | Chart.js hoặc ECharts | Thống kê doanh thu, thành viên |
| **Notification** | WebSocket / Email / FCM | Gửi thông báo realtime (đơn hàng, khuyến mãi) |

  #### **4\. Phân công công việc (5 người)**

| STT | Vị trí | Vai trò chính | Nhiệm vụ Code (Công việc chính) | Nhiệm vụ khác (QA, Tài liệu...) |
| :---- | :---- | :---- | :---- | :---- |
| **1** | **Team Leader (Backend)** | Quản lý & Kiến trúc sư | \- Cấu trúc Spring Boot, Spring Security (JWT). \- Xây dựng API cốt lõi: Tài khoản, Phân quyền. \- Xây dựng API: Membership, Chat, AI. | \- Thiết kế CSDL (đã xong). \- Quản lý chung, Review code, Merge code. \- Test tổng thể (Test Integration). |
| **2** | **Frontend Dev (Client)** | Phát triển UI/UX Khách hàng | \- Cấu trúc dự án Vue 3 (Pinia, Router, Tailwind). \- Xây dựng toàn bộ giao diện phía Khách hàng. \- Tích hợp API: Đăng ký, Đăng nhập, SP, Giỏ hàng... | \- Tự test chức năng của mình. \- Test chéo (QA) cho các chức năng của trang Admin (của người số 3). |
| **3** | **Frontend Dev (Admin)** | Phát triển UI/UX Quản trị | \- Xây dựng toàn bộ giao diện trang Quản trị. \- Tích hợp API: Quản lý (CRUD) Sản phẩm, Đơn hàng, User. \- Xây dựng Dashboard, biểu đồ. | \- Tự test chức năng của mình. \- Test chéo (QA) cho các chức năng của trang Client (của người số 2). |
| **4** | **Backend Developer** | Phát triển tính năng Backend | \- Xây dựng API module Sản phẩm (CRUD, tìm kiếm...). \- Xây dựng API module Giỏ hàng (CRUD Cart). \- Xây dựng API module Đơn hàng (Checkout, Lịch sử). | \- Viết tài liệu (Document) cho các API mình làm (dùng Postman/Swagger). \- Viết Unit Test / Test API của mình. |
| **5** | **AI & Chat Dev** | Phát triển Module Nâng cao | \- Xây dựng logic gọi API của OpenAI (Prompt) cho AI Stylist. \- Tích hợp WebSocket (STOMP) cho API Chat realtime. \- Tích hợp hệ thống thông báo (Notification). | \- Test chuyên sâu cho các tính năng AI và Chat. \- Hỗ trợ DevOps (Triển khai). |

  #### **5\. Kết quả mong đợi (GĐ 2\)**

* Website thương mại điện tử cao cấp tích hợp **Bán hàng & Gói thành viên**.  
* Có **AI Stylist** tư vấn và **Chat realtime** như web thời trang thực tế.  
* Giao diện sang trọng, mượt, có animation.  
* Backend tối ưu, API rõ ràng, dễ bảo trì.  
  ---

  ### **🚀 TỔNG KẾT LỘ TRÌNH PHÁT TRIỂN**

| Giai đoạn | Tên | Thời gian | Mục tiêu | Sản phẩm cuối |
| :---- | :---- | :---- | :---- | :---- |
| **GĐ 1 (Java 6\)** | Luxury Fashion Store | 1 tháng | Website bán quần áo hoàn chỉnh | Hệ thống bán hàng có quản lý & thanh toán |
| **GĐ 2 (Tốt nghiệp)** | Luxury Fashion Plus | 3 tháng | Mở rộng **membership, AI, chat** | Hệ thống bán \+ **membership** \+ AI \+ realtime |

  ### **🌟 Lợi thế của mô hình**

* **Tách biệt:** Frontend – Backend tách biệt → giữ nguyên giao diện, chỉ mở rộng API.  
* **Hiện đại:** Vue 3 \+ Tailwind → giao diện hiện đại, sang trọng, dễ bảo trì.  
* **Mạnh mẽ:** Spring Boot \+ SQL Server (CSDL **Production 2025**) → mạnh, chuẩn enterprise.  
* **Mở rộng:** Dễ dàng phát triển cho giai đoạn tốt nghiệp, không phải code lại từ đầu.


# Thẻ 2

Dưới đây là **phân tích đầy đủ** và **lộ trình phát triển chi tiết** (chia làm 2 giai đoạn) với các đoạn code mẫu (Java/Spring Boot) tại các điểm nghiệp vụ mấu chốt để bạn và team dễ dàng hình dung và bắt tay vào làm.

---

### **PHÂN TÍCH TỔNG QUAN CSDL (PRODUCTION 2025\)**

CSDL của bạn là một hệ thống E-commerce hoàn chỉnh, được xây dựng theo các tiêu chuẩn cao nhất. Các điểm "ăn tiền" nhất bao gồm:

1. **MÔ HÌNH PHÂN QUYỀN (CHUẨN SPRING SECURITY):**  
   * Bạn dùng 3 bảng `TaiKhoan`, `Role`, `TaiKhoan_Role`.  
   * Đây là thiết kế Many-to-Many chuẩn, cho phép một tài khoản có nhiều vai trò (ví dụ: một nhân viên cũng có thể là khách hàng). Đây là thiết kế **bắt buộc** để tích hợp Spring Security một cách chuyên nghiệp.  
2. **MÔ HÌNH BIẾN THỂ SẢN PHẨM (SKU):**  
   * Đây là **trái tim** của CSDL. Bạn đã tách `SanPham` (thông tin chung) và `SanPhamChiTiet` (biến thể).  
   * Mọi nghiệp vụ cốt lõi (Tồn kho, Giá bán, Giá nhập, Đặt hàng, Nhập kho) đều xoay quanh `MaBienThe`. Đây là cách làm **chính xác tuyệt đối** của các doanh nghiệp lớn.  
3. **MÔ HÌNH QUẢN LÝ KHO (CHUẨN ERP):**  
   * Bạn tách `PhieuNhap` (Phiếu nhập tổng) và `NhapKhoChiTiet` (các dòng hàng trong phiếu).  
   * Điều này cho phép nhân viên tạo 1 phiếu nhập duy nhất cho 20 mặt hàng khác nhau từ 1 nhà cung cấp, thay vì tạo 20 phiếu lẻ. Rất chuyên nghiệp.  
4. **MÔ HÌNH NGHIỆP VỤ ĐƠN HÀNG (PRODUCTION-READY):**  
   * Bạn đã thêm `PhiShip`, `TrangThaiThanhToan`, `NgayThanhToan`.  
   * Bạn có bảng `LichSuDonHang` để lưu vết (audit log) mọi thay đổi trạng thái.  
   * Bạn liên kết `DanhGia` (Review) với `DonHangCT` (Chi tiết đơn hàng), đảm bảo **chỉ người đã mua** mới được đánh giá.  
   * Đây là thiết kế hoàn hảo để quản lý đơn hàng và chống review ảo.  
5. **MÔ HÌNH TƯƠNG TÁC (SOCIAL \+ CHAT):**  
   * Bạn đã thêm các tính năng "social" (`SoLuongLike`, `SoLuongPhanHoi`) vào `DanhGia` và `BinhLuan`.  
   * Hệ thống `Chat` 1-1 (Khách vs Nhân viên) cũng rất rõ ràng.

---

### **LỘ TRÌNH PHÁT TRIỂN DỰ ÁN (CHI TIẾT)**

Dưới đây là lộ trình 2 giai đoạn, bám sát kế hoạch của bạn (GĐ1: Bán hàng, GĐ2: Member \+ AI/Chat).

### **GIAI ĐOẠN 1: JAVA 6 – XÂY DỰNG NỀN TẢNG E-COMMERCE**

Mục tiêu: Hoàn thiện 100% nghiệp vụ **Bán Hàng**.

#### **MODULE 1: CẤU TRÚC DỰ ÁN & BẢO MẬT (AUTH)**

* **Mục tiêu:** Dựng dự án Spring Boot, kết nối CSDL, và triển khai **Đăng nhập/Đăng ký**.  
* **Bảng liên quan:** `TaiKhoan`, `Role`, `TaiKhoan_Role`.  
* **Hướng làm (Backend \- Team Leader):**  
  1. Tạo dự án Spring Boot (Maven, Spring Web, Spring Data JPA, Spring Security, Lombok, Validation).  
  2. Tạo các package: `com.luxuryfashion.config`, `controller`, `service`, `repository`, `entity`, `dto`.  
  3. Tạo các Entities: `TaiKhoan.java`, `Role.java`, `TaiKhoanRole.java` (với `@EmbeddedId`).  
  4. Cấu hình Spring Security (`SecurityConfig.java`) để dùng JWT.  
  5. Tạo `UserDetailsService` để Spring Security có thể đọc thông tin user từ 2 bảng `TaiKhoan` và `TaiKhoan_Role`.  
  6. Tạo `AuthController` cho phép người dùng đăng ký (`/api/auth/register`) và đăng nhập (`/api/auth/login`).

**Code Mẫu (Backend \- `AuthService.java`):**  
Java  
// Trong AuthService.java (hoặc UserService)  
// Cần inject: TaiKhoanRepository, RoleRepository, TaiKhoanRoleRepository, PasswordEncoder

@Transactional  
public TaiKhoan register(RegisterRequest request) {  
    // 1\. Kiểm tra email tồn tại  
    if (taiKhoanRepository.existsByEmail(request.getEmail())) {  
        throw new RuntimeException("Email đã tồn tại");  
    }

    // 2\. Mã hóa mật khẩu  
    String encodedPassword \= passwordEncoder.encode(request.getMatKhau());

    // 3\. Tạo TaiKhoan mới  
    TaiKhoan newUser \= new TaiKhoan();  
    newUser.setHoTen(request.getHoTen());  
    newUser.setEmail(request.getEmail());  
    newUser.setMatKhau(encodedPassword);  
    newUser.setTrangThai(true);  
    TaiKhoan savedUser \= taiKhoanRepository.save(newUser);

    // 4\. Gán quyền KHACHHANG  
    Role userRole \= roleRepository.findByTenRole("KHACHHANG")  
        .orElseThrow(() \-\> new RuntimeException("Role KHACHHANG không tồn tại"));

    TaiKhoan\_Role taiKhoanRole \= new TaiKhoan\_Role();  
    taiKhoanRole.setTaiKhoan(savedUser);  
    taiKhoanRole.setRole(userRole);  
    taiKhoanRoleRepository.save(taiKhoanRole);

    return savedUser;  
}

* 

#### **MODULE 2: HIỂN THỊ SẢN PHẨM (PRODUCT)**

* **Mục tiêu:** Khách hàng có thể xem, lọc, phân trang, và xem chi tiết sản phẩm.  
* **Bảng liên quan:** `SanPham`, `SanPhamChiTiet`, `LoaiSanPham`, `ThuongHieu`, `SizeSP`, `MauSacSP`, `HinhAnhSP`.  
* **Hướng làm (Backend):**  
  * Tạo API `GET /api/products` hỗ trợ **phân trang** (Paging) và **lọc** (Filtering) theo `MaLoai`, `MaTH`, `GioiTinh`, `GiaBan` (khoảng giá).  
  * Tạo API chi tiết sản phẩm `GET /api/products/{id}`. Đây là API quan trọng, nó phải trả về thông tin của `SanPham` VÀ danh sách các `SanPhamChiTiet` (biến thể) của nó.  
* **Code Mẫu (Backend \- `ProductDTO.java`):**  
  * Bạn cần tạo DTO (Data Transfer Object) để gom nhóm thông tin cho Frontend.

Java  
// DTO cho chi tiết sản phẩm (ProductDetailPage)  
@Data  
public class ProductDetailDTO {  
    // Thông tin chung từ SanPham  
    private Integer maSP;  
    private String tenSP;  
    private String moTa;  
    private String anhChinh;  
    private ThuongHieu thuongHieu; // Entity ThuongHieu  
    private LoaiSanPham loaiSanPham; // Entity LoaiSanPham

    // Danh sách ảnh phụ từ HinhAnhSP  
    private List\<String\> danhSachAnhPhu;

    // Danh sách các biến thể từ SanPhamChiTiet  
    private List\<VariantDTO\> bienThes;

    // (Optional) Gợi ý các size và màu có sẵn để Frontend làm UI  
    private Set\<SizeSP\> availableSizes;  
    private Set\<MauSacSP\> availableColors;  
}

@Data  
public class VariantDTO {  
    // Thông tin từ SanPhamChiTiet  
    private Integer maBienThe;  
    private BigDecimal giaBan;  
    private Integer soLuongTon;  
    private String anhBienThe;

    // Thông tin từ SizeSP và MauSacSP  
    private String tenSize;  
    private String tenMau;  
    private String maHex;  
}

*   
* **Hướng làm (Frontend):** Dùng DTO trên để vẽ giao diện. Khi người dùng bấm chọn Màu X, bạn lọc `bienThes` để xem có Size S, M, L nào còn hàng (`soLuongTon > 0`) hay không.

#### **MODULE 3: GIỎ HÀNG (CART) & ĐẶT HÀNG (CHECKOUT)**

* **Mục tiêu:** Khách hàng thêm sản phẩm vào giỏ, đi đến thanh toán và tạo đơn hàng.  
* **Bảng liên quan:** `GioHang`, `GioHangChiTiet`, `DonHang`, `DonHangCT`, `SanPhamChiTiet`, `SoDiaChi`, `KhuyenMai`, `HinhThucThanhToan`.  
* **Hướng làm (Backend):**  
  * Tạo `CartController` (`GET /api/cart`, `POST /api/cart`, `DELETE /api/cart/{maBienThe}`).  
  * Logic đồng bộ: Khi user đăng nhập, Frontend gọi API `POST /api/cart/sync` để đẩy giỏ hàng từ Local Storage lên CSDL.  
  * Tạo `OrderController` với 1 API duy nhất và quan trọng nhất: `POST /api/orders/checkout`.  
* **Code Mẫu (Backend \- `OrderService.java`):**  
  * Đây là logic **quan trọng nhất** dự án, **bắt buộc** phải dùng `@Transactional` để đảm bảo toàn vẹn dữ liệu (hoặc tất cả thành công, hoặc rollback hết).

Java  
// Trong OrderService.java  
// Cần inject: DonHangRepository, DonHangCTRepository, SanPhamChiTietRepository,  
// GioHangChiTietRepository, LichSuDonHangRepository

@Transactional(rollbackFor \= Exception.class, isolation \= Isolation.SERIALIZABLE)   
// Dùng isolation cao nhất để chống "race condition" (2 người cùng mua 1 sản phẩm cuối)  
public DonHang createOrder(CheckoutRequest request, TaiKhoan currentUser) {

    // 1\. Lấy chi tiết giỏ hàng từ CSDL (Không tin tưởng Frontend)  
    List\<GioHangChiTiet\> cartItems \= gioHangChiTietRepository.findByMaGioHang(currentUser.getGioHang().getMaGioHang());  
    if (cartItems.isEmpty()) {  
        throw new RuntimeException("Giỏ hàng trống");  
    }

    BigDecimal tongTien \= BigDecimal.ZERO;

    // 2\. KIỂM TRA TỒN KHO VÀ TÍNH TOÁN  
    for (GioHangChiTiet item : cartItems) {  
        SanPhamChiTiet bienThe \= item.getBienThe();

        // Kiểm tra tồn kho  
        if (bienThe.getSoLuongTon() \< item.getSoLuong()) {  
            throw new RuntimeException("Sản phẩm " \+ bienThe.getSanPham().getTenSP() \+ " không đủ hàng");  
        }

        // Lấy giá từ CSDL (không tin Frontend)  
        tongTien \= tongTien.add(bienThe.getGiaBan().multiply(BigDecimal.valueOf(item.getSoLuong())));  
    }

    // (Logic kiểm tra KhuyenMai, HinhThucThanhToan, SoDiaChi...)

    // 3\. TẠO ĐƠN HÀNG (Bảng DonHang)  
    DonHang donHang \= new DonHang();  
    donHang.setMaTK(currentUser.getMaTK());  
    donHang.setTongTien(tongTien); // (Chưa tính ship, KM)  
    donHang.setPhiShip(request.getPhiShip());  
    donHang.setMaKM(request.getMaKM());  
    donHang.setMaDiaChiGiao(request.getMaDiaChiGiao());  
    donHang.setMaHinhThucTT(request.getMaHinhThucTT());  
    donHang.setTrangThaiDH(0); // 0 \= Chờ xác nhận  
    donHang.setTrangThaiThanhToan(0); // 0 \= Chờ thanh toán  
    DonHang savedDonHang \= donHangRepository.save(donHang);

    // 4\. TẠO CHI TIẾT ĐƠN HÀNG VÀ TRỪ KHO  
    for (GioHangChiTiet item : cartItems) {  
        // 4a. Tạo DonHangCT  
        DonHangCT chiTiet \= new DonHangCT();  
        chiTiet.setMaDH(savedDonHang.getMaDH());  
        chiTiet.setMaBienThe(item.getMaBienThe());  
        chiTiet.setSoLuong(item.getSoLuong());  
        chiTiet.setDonGia(item.getBienThe().getGiaBan()); // Lưu lại giá lúc mua  
        donHangCTRepository.save(chiTiet);

        // 4b. TRỪ KHO (Logic thay thế Trigger)  
        SanPhamChiTiet bienThe \= item.getBienThe(); // Lấy lại bienThe (đã bị lock bởi @Transactional)  
        bienThe.setSoLuongTon(bienThe.getSoLuongTon() \- item.getSoLuong());  
        sanPhamChiTietRepository.save(bienThe);  
    }

    // 5\. TẠO LỊCH SỬ ĐƠN HÀNG  
    LichSuDonHang lichSu \= new LichSuDonHang();  
    lichSu.setMaDH(savedDonHang.getMaDH());  
    lichSu.setTrangThaiCu(0);  
    lichSu.setTrangThaiMoi(0);  
    lichSu.setGhiChu(N'Khách hàng tạo đơn');  
    lichSu.setNguoiCapNhat(N'Hệ thống');  
    lichSuDonHangRepository.save(lichSu);

    // 6\. XÓA GIỎ HÀNG  
    gioHangChiTietRepository.deleteAll(cartItems);

    return savedDonHang;  
}

* 

#### **MODULE 4: QUẢN TRỊ (ADMIN)**

* **Mục tiêu:** Xây dựng các API cho trang Admin (CRUD sản phẩm, Quản lý kho, Quản lý đơn hàng).  
* **Bảng liên quan:** `PhieuNhap`, `NhapKhoChiTiet`, `SanPhamChiTiet`, `DonHang`, `LichSuDonHang`.  
* **Hướng làm (Backend):**  
  * Tạo các API với `@PreAuthorize("hasAuthority('ADMIN')")` hoặc `@PreAuthorize("hasAuthority('NHANVIEN')")` để bảo vệ.  
  * `AdminOrderController`: API `PUT /api/admin/orders/{id}/status` để nhân viên cập nhật trạng thái (`TrangThaiDH`) và ghi `LichSuDonHang`.  
  * `AdminProductController`: API CRUD cho `SanPham` và `SanPhamChiTiet`.  
  * `AdminWarehouseController`: API `POST /api/admin/warehouse/import` (Nhập kho).  
* **Code Mẫu (Backend \- `WarehouseService.java`):**  
  * Logic nhập kho, **thay thế cho Trigger** bạn đã bỏ.

Java  
// Trong WarehouseService.java

@Transactional(rollbackFor \= Exception.class)  
public PhieuNhap createPhieuNhap(PhieuNhapRequest request, TaiKhoan currentUser) {

    // 1\. Tạo Phiếu Nhập tổng  
    PhieuNhap phieuNhap \= new PhieuNhap();  
    phieuNhap.setMaNV(currentUser.getMaTK());  
    phieuNhap.setMaNCC(request.getMaNCC());  
    phieuNhap.setGhiChu(request.getGhiChu());

    BigDecimal tongTien \= BigDecimal.ZERO;  
    PhieuNhap savedPhieuNhap \= phieuNhapRepository.save(phieuNhap);

    List\<NhapKhoChiTiet\> chiTietList \= new ArrayList\<\>();

    // 2\. Duyệt qua chi tiết và CỘNG KHO  
    for (NhapKhoChiTietRequest item : request.getChiTiet()) {  
        // 2a. CỘNG KHO (Logic thay thế Trigger)  
        SanPhamChiTiet bienThe \= sanPhamChiTietRepository.findById(item.getMaBienThe())  
            .orElseThrow(() \-\> new RuntimeException("Biến thể không tồn tại"));

        bienThe.setSoLuongTon(bienThe.getSoLuongTon() \+ item.getSoLuong());  
        bienThe.setGiaNhap(item.getDonGiaNhap()); // Cập nhật giá nhập mới nhất  
        sanPhamChiTietRepository.save(bienThe);

        // 2b. Tạo chi tiết phiếu nhập  
        NhapKhoChiTiet chiTiet \= new NhapKhoChiTiet();  
        chiTiet.setMaPN(savedPhieuNhap.getMaPN());  
        chiTiet.setMaBienThe(item.getMaBienThe());  
        chiTiet.setSoLuong(item.getSoLuong());  
        chiTiet.setDonGiaNhap(item.getDonGiaNhap());  
        chiTiet.setThanhTien(item.getDonGiaNhap().multiply(BigDecimal.valueOf(item.getSoLuong())));  
        chiTietList.add(chiTiet);

        tongTien \= tongTien.add(chiTiet.getThanhTien());  
    }

    // 3\. Lưu chi tiết  
    nhapKhoChiTietRepository.saveAll(chiTietList);

    // 4\. Cập nhật tổng tiền cho phiếu nhập  
    savedPhieuNhap.setTongTien(tongTien);  
    return phieuNhapRepository.save(savedPhieuNhap);  
}

* 

#### **MODULE 5: HOÀN THIỆN (ĐÁNH GIÁ, BÀI VIẾT)**

* **Mục tiêu:** Cho phép khách hàng đánh giá, bình luận. Admin đăng bài viết.  
* **Bảng liên quan:** `DanhGia`, `BinhLuan`, `BaiViet`, `LoaiBaiViet`.  
* **Hướng làm (Backend):**  
  1. `ReviewController`: Tạo API `POST /api/reviews`. Logic quan trọng: Kiểm tra xem `MaCT` (Chi tiết đơn hàng) này có thuộc `currentUser` không và `TrangThaiDH` có phải là 3 (Đã giao) không.  
  2. `BlogController`: API CRUD cho `BaiViet` (cho Admin) và API `GET` (cho Khách).

---

### **GIAI ĐOẠN 2: DỰ ÁN TỐT NGHIỆP – MỞ RỘNG NÂNG CAO**

Mục tiêu: Tích hợp các tính năng GĐ2 (Membership, Chat, AI).

#### **MODULE 6: HỆ THỐNG THÀNH VIÊN (MEMBERSHIP)**

* **Bảng liên quan:** `GoiThanhVien`, `DangKyThanhVien`, `KhuyenMai`.  
* **Hướng làm (Backend):**  
  1. Tạo `MembershipController`: API `POST /api/membership/register/{maGoi}` (để khách mua gói), `GET /api/membership/my-package`.  
  2. Khi mua gói, tạo 1 record trong `DangKyThanhVien` với `NgayKetThuc` \= `GETDATE() + ThoiHan` (số ngày).  
  3. Tạo một **Tác vụ định kỳ (Scheduled Task)**: Dùng `@Scheduled(cron = "0 0 1 * * ?")` (1 giờ sáng mỗi ngày) để chạy hàm quét bảng `DangKyThanhVien`, tìm các gói đã hết hạn (`NgayKetThuc < GETDATE()`) và cập nhật `TrangThai = 0`.  
  4. Cập nhật logic `Checkout`: Khi tính toán giảm giá, kiểm tra xem `currentUser` có gói thành viên nào `TrangThai = 1` không, nếu có, áp dụng thêm các `KhuyenMai` có `MaGoi` tương ứng.

#### **MODULE 7: CHAT REAL-TIME (WEBSOCKET)**

* **Mục tiêu:** Tích hợp chat 1-1 (Khách vs Nhân viên).  
* **Bảng liên quan:** `PhongChat`, `TinNhan`, `TaiKhoan`.  
* **Hướng làm (Backend):**  
  1. Cài đặt **Spring WebSocket \+ STOMP**.  
  2. Tạo `ChatController` (dùng `@RestController` cho API thường) và `WebSocketController` (dùng `@Controller` cho WebSocket).  
  3. **API Thường:** `GET /api/chat/history` (lấy lịch sử tin nhắn trong `TinNhan` của `MaPhong`).  
  4. **WebSocket:** Cấu hình 2 kênh:  
     * `/topic/chat/{maPhong}` (Kênh chung cho phòng chat).  
     * `/user/queue/reply` (Kênh riêng tư).

**Code Mẫu (Backend \- `WebSocketController.java`):**  
Java  
@Controller  
public class WebSocketController {

    @Autowired  
    private TinNhanRepository tinNhanRepository;

    @Autowired  
    private SimpMessagingTemplate messagingTemplate; // Dùng để gửi tin nhắn

    // Khi 1 user (Khách hoặc NV) gửi tin nhắn  
    @MessageMapping("/chat.sendMessage")   
    public void sendMessage(@Payload ChatMessage chatMessage) {  
        // 1\. Lưu tin nhắn vào CSDL (Bảng TinNhan)  
        TinNhan tinNhan \= new TinNhan();  
        tinNhan.setMaPhong(chatMessage.getMaPhong());  
        tinNhan.setMaNguoiGui(chatMessage.getMaNguoiGui());  
        tinNhan.setNoiDung(chatMessage.getNoiDung());  
        // ... (set LoaiNguoiGui, LoaiTinNhan...)  
        TinNhan savedMessage \= tinNhanRepository.save(tinNhan);

        // 2\. Gửi tin nhắn real-time đến tất cả người trong phòng  
        // (Trong logic 1-1, chỉ là 2 người: Khách và NV)  
        messagingTemplate.convertAndSend("/topic/chat/" \+ savedMessage.getMaPhong(), savedMessage);  
    }  
}

* 

#### **MODULE 8: TRỢ LÝ AI (AI STYLIST)**

* **Mục tiêu:** Tạo API cho phép khách hàng nhận gợi ý thời trang.  
* **Bảng liên quan:** (Không nhiều, chủ yếu gọi API ngoài).  
* **Hướng làm (Backend):**  
  1. Tạo `AIController` với API `POST /api/ai/suggest-outfit`.  
  2. Trong `AIService`, sử dụng `RestTemplate` hoặc `WebClient` của Spring để gọi API của OpenAI/Gemini.

**Code Mẫu (Backend \- `AIService.java`):**  
Java  
@Service  
public class AIService {

    @Autowired  
    private RestTemplate restTemplate;

    public String getSuggestion(String promptFromUser, TaiKhoan currentUser) {  
        String apiUrl \= "https://api.openai.com/v1/chat/completions"; // Hoặc Gemini  
        String apiKey \= "YOUR\_API\_KEY";

        // 1\. Kỹ thuật Prompt Engineering  
        String finalPrompt \= String.format(  
            "Bạn là một stylist thời trang cao cấp. Khách hàng của tôi (Tên: %s) có mô tả: '%s'. " \+  
            "Dựa trên mô tả này và các sản phẩm chúng ta đang bán (ví dụ: Áo Polo Gucci, Túi Chanel), " \+  
            "hãy gợi ý một set đồ (outfit) cho họ.",  
            currentUser.getHoTen(),  
            promptFromUser  
        );

        // 2\. Chuẩn bị Request  
        HttpHeaders headers \= new HttpHeaders();  
        headers.setBearerAuth(apiKey);  
        headers.setContentType(MediaType.APPLICATION\_JSON);

        // Tạo body request (schema của OpenAI/Gemini)  
        Map\<String, Object\> body \= new HashMap\<\>();  
        body.put("model", "gpt-4"); // or gpt-3.5-turbo  
        body.put("messages", List.of(Map.of("role", "user", "content", finalPrompt)));

        HttpEntity\<Map\<String, Object\>\> entity \= new HttpEntity\<\>(body, headers);

        // 3\. Gọi API  
        ResponseEntity\<String\> response \= restTemplate.postForEntity(apiUrl, entity, String.class);

        // 4\. Xử lý JSON response để lấy câu trả lời  
        // (Cần dùng Jackson/Gson để parse)  
        return parseResponse(response.getBody());   
    }  
}

* 

### **KẾT LUẬN**

CSDL của bạn đã ở mức "production-ready". Lộ trình trên chia nhỏ các nghiệp vụ phức tạp nhất (Bảo mật, Đặt hàng, Nhập kho, Chat) thành các module rõ ràng. Bằng cách tập trung xử lý Business Logic trong **Service Layer** (dùng `@Transactional`) thay vì `Trigger`, bạn sẽ có một dự án Spring Boot "sạch", dễ bảo trì, và đúng chuẩn doanh nghiệp. Chúc bạn và team thành công\!

