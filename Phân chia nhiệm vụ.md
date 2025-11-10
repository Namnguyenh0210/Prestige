1️⃣Vỹ  (Backend) - Quản lý & Kiến trúc sư
(Tập trung vào nền tảng, bảo mật và API lõi)
Module / Nhiệm vụ
Nhiệm vụ Code Chi Tiết
Mô tả (Chức năng)
Se
tup & Cấu hình
Khởi tạo Spring Boot
Thiết lập dự án, cấu hình pom.xml, application.properties (kết nối CSDL, JWT secret...).
Database
Thiết kế ERD & Viết Entities
Lên sơ đồ CSDL (Vẽ ERD) và viết code cho tất cả các @Entity (User, Product, Order...).
Bảo mật (Security)
Cấu hình Spring Security & JWT
Thiết lập toàn bộ luồng bảo mật: SecurityConfig, UserDetailsService, JwtTokenProvider (tạo/kiểm tra token),
JwtAuthenticationFilter (lọc request).
API Xác thực (Auth)
POST /api/auth/register
Đăng ký: Nhận thông tin (username, pass), mã hóa mật khẩu, lưu user mới vào CSDL với role "CUSTOMER".

POST /api/auth/login
Đăng nhập: Kiểm tra thông tin (username, pass), nếu đúng thì tạo và trả về một JWT Token.
API Người dùng (User)
GET /api/users/me
Lấy thông tin của tôi: (Yêu cầu JWT) Lấy thông tin chi tiết của user đang đăng nhập.

PUT /api/users/me
Cập nhật thông tin: (Yêu cầu JWT) Cho phép user tự cập nhật thông tin cá nhân (tên, SĐT...).
Quản lý
Review Code & Hỗ trợ
Xem code của Backend Dev (người số 4)develop/main.

Xuất sang Trang tính

4. Nam - Backend Developer (Tính năng)
   (Tập trung vào API nghiệp vụ (Shop) và API Admin)
   Module / Nhiệm vụ
   API Endpoint
   Mô tả (Chức năng)
   API Sản phẩm (Client)
   GET /api/products
   Lấy danh sách sản phẩm (Phân trang): Lấy 10 sản phẩm/trang để hiển thị ở trang "Shop".

GET /api/products/search
Lọc và Tìm kiếm sản phẩm: Lấy sản phẩm dựa trên các tiêu chí (danh mục, giá, size...).

GET /api/products/{id}
Lấy chi tiết sản phẩm: Lấy thông tin của 1 sản phẩm (dựa vào ID).
API Giỏ hàng (Client)
GET /api/cart
Lấy giỏ hàng của tôi: Lấy toàn bộ giỏ hàng (sản phẩm, số lượng) của user đang đăng nhập.

POST /api/cart/items
Thêm vào giỏ hàng: Thêm một sản phẩm mới vào giỏ (Input: {productId, quantity}).

PUT /api/cart/items/{id}
Cập nhật số lượng: Cập nhật lại số lượng của một sản phẩm đã có trong giỏ.

DELETE /api/cart/items/{id}
Xóa khỏi giỏ hàng: Xóa một sản phẩm ra khỏi giỏ hàng.
API Đơn hàng (Client)
POST /api/orders/checkout
Tiến hành Thanh toán (Checkout): Nhận thông tin giao hàng và tạo một đơn hàng mới từ giỏ hàng.

GET /api/orders/my-history
Lấy lịch sử mua hàng: Lấy danh sách các đơn hàng mà user này đã đặt.
API Admin
POST /api/admin/products
Thêm sản phẩm mới: Thêm một sản phẩm mới vào CSDL.

PUT /api/admin/products/{id}
Sửa sản phẩm: Cập nhật thông tin một sản phẩm đã có.

DELETE /api/admin/products/{id}
Xóa sản phẩm: Xóa một sản phẩm khỏi CSDL.

GET /api/admin/orders
Lấy tất cả đơn hàng: Lấy danh sách tất cả đơn hàng (để admin quản lý).

PUT /api/admin/orders/{id}/status
Cập nhật trạng thái đơn hàng: Đổi trạng thái (VD: "Chờ xác nhận" -> "Đang giao").

GET /api/admin/users
Lấy tất cả người dùng: Lấy danh sách tất cả người dùng (để admin phân quyền).

PUT /api/admin/users/{id}/role
Phân quyền (Gán vai trò): Gán quyền cho 1 user (VD: "CUSTOMER" -> "ADMIN").

GET /api/admin/stats/summary
Lấy số liệu thống kê: Lấy doanh thu, đơn hàng mới... để hiển thị trên Dashboard.

Xuất sang Trang tính

2. Uyên - Frontend Dev (Client)
   (Tập trung vào giao diện và trải nghiệm khách hàng)
   Module / Nhiệm vụ
   Tích hợp API (Ví dụ)
   Mô tả (Chức năng)
   Setup & Cấu hình

-

Khởi tạo Vue 3 (Vite), cài Pinia, Router, Axios, Tailwind.
Layout & Store

-

Dựng ClientLayout (Navbar, Footer), tạo tất cả Pinia Store (Auth, Product, Cart).
Luồng Xác thực
POST /api/auth/login
Xây dựng 2 trang Đăng ký, Đăng nhập và tích hợp API. Lưu JWT vào Pinia/LocalStorage.
Luồng Sản phẩm
GET /api/products
Xây dựng trang Danh sách Sản phẩm (gọi API lọc) và trang Chi tiết Sản phẩm.
Luồng Mua hàng (1)
GET /api/cart
Xây dựng trang Giỏ hàng, hiển thị sản phẩm, cho phép Sửa/Xóa (gọi API).
Luồng Mua hàng (2)

-

Xử lý logic Đồng bộ Giỏ hàng (Khi user đăng nhập, đẩy giỏ hàng Local Storage lên CSDL).
Luồng Mua hàng (3)
POST /api/orders/checkout
Xây dựng trang Thanh toán (Form điền thông tin) và gọi API khi nhấn "Đặt hàng".
Luồng User
GET /api/users/me
Xây dựng trang Profile (Cho phép user xem và cập nhật thông tin).

GET /api/orders/my-history
Xây dựng trang Lịch sử Đơn hàng (Hiển thị các đơn hàng đã đặt).

Xuất sang Trang tính

3. Triệu_Frontend Dev (Admin)
   (Tập trung vào giao diện quản lý và thống kê)
   Module / Nhiệm vụ
   Tích hợp API (Ví dụ)
   Mô tả (Chức năng)
   Setup & Layout

-

Khởi tạo dự án Vue Admin, Dựng AdminLayout (Sidebar), Cấu hình Router (bảo vệ route Admin).
Dashboard
GET /api/admin/stats/summary
Xây dựng trang Dashboard, tích hợp Chart.js (biểu đồ) và gọi API thống kê.
Quản lý Sản phẩm
POST /api/admin/products
Xây dựng trang Quản lý Sản phẩm (hiển thị Bảng) và Form/Modal (để Thêm/Sửa/Xóa).
Quản lý Đơn hàng
GET /api/admin/orders
Xây dựng trang Quản lý Đơn hàng (hiển thị Bảng) và các nút bấm (để "Xác nhận", "Giao hàng", "Hủy").

PUT /api/admin/orders/{id}/status
Tích hợp API cập nhật trạng thái khi Admin nhấn nút.
Quản lý User
GET /api/admin/users
Xây dựng trang Quản lý User (hiển thị Bảng) và nút bấm/dropdown (để Phân quyền).

PUT /api/admin/users/{id}/role
Tích hợp API gán vai trò khi Admin chọn.

Xuất sang Trang tính

