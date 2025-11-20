# 🛍️ LUXURY FASHION - HỆ THỐNG E-COMMERCE CAO CẤP

Dự án thương mại điện tử bán quần áo cao cấp sử dụng kiến trúc tách biệt Frontend (Vue 3 + Vite + Tailwind + Pinia) và Backend (Spring Boot + Spring Security + JWT + SQL Server).

## 🔧 Trạng thái hiện tại
- ✅ Đã hoàn thiện cấu trúc backend & frontend chạy được
- ✅ Database `LuxuryFashion_2025` (file `db.sql`) đồng bộ với entity
- ✅ Đăng nhập dùng mật khẩu plain text (NoOpPasswordEncoder) theo yêu cầu dev nội bộ
- ✅ Sản phẩm, biến thể, thương hiệu, loại hàng, giỏ hàng, đơn hàng mẫu đã seed
- ✅ JWT + Filter hoạt động (token trả về sau login)

> ⚠ Khuyến nghị production: dùng BCrypt + migrate mật khẩu, bật HTTPS, dùng refresh token. (Đang tạm bỏ theo yêu cầu tối ưu đơn giản.)

## 🚀 Chạy nhanh (1 lệnh)
macOS/Linux:
```bash
./start.sh
```
Windows:
```bat
start.bat
```
Dừng:
```bash
./stop.sh   # hoặc stop.bat
```

## 🗄️ Bản đồ cột DB ↔ Thuộc tính Entity
| Bảng (SQL) | Cột | Kiểu | Entity/Field (Java) |
|------------|-----|------|---------------------|
| TaiKhoan | MaTK | INT IDENTITY | id (Long) |
| TaiKhoan | HoTen | NVARCHAR(100) | fullName |
| TaiKhoan | Email | VARCHAR(100) | email |
| TaiKhoan | MatKhau | VARCHAR(255) | password |
| TaiKhoan | SoDienThoai | VARCHAR(20) | phone |
| TaiKhoan | DiaChi | NVARCHAR(255) | address |
| TaiKhoan | Avatar | NVARCHAR(255) | avatar |
| TaiKhoan | TrangThai | BIT | enabled (boolean) |
| TaiKhoan | LastLogin | DATETIME | lastLogin (LocalDateTime) |
| TaiKhoan | NgayTao | DATETIME | createdAt |
| TaiKhoan | NgayCapNhat | DATETIME | updatedAt |
| Role | MaRole | INT IDENTITY | id (Long) |
| Role | TenRole | VARCHAR(50) | name |
| TaiKhoan_Role | MaTK | INT | join table (ManyToMany) |
| TaiKhoan_Role | MaRole | INT | join table (ManyToMany) |
| ThuongHieu | MaTH | INT IDENTITY | maTH |
| ThuongHieu | TenTH | NVARCHAR(100) | tenTH |
| ThuongHieu | MoTa | NVARCHAR(255) | moTa |
| LoaiSanPham | MaLoai | INT IDENTITY | maLoai |
| LoaiSanPham | TenLoai | NVARCHAR(100) | tenLoai |
| LoaiSanPham | MoTa | NVARCHAR(255) | moTa |
| SizeSP | MaSize | INT IDENTITY | maSize |
| SizeSP | TenSize | NVARCHAR(20) | tenSize |
| MauSacSP | MaMau | INT IDENTITY | maMau |
| MauSacSP | TenMau | NVARCHAR(50) | tenMau |
| MauSacSP | MaHex | VARCHAR(7) | maHex |
| SanPham | MaSP | INT IDENTITY | maSP |
| SanPham | TenSP | NVARCHAR(255) | tenSP |
| SanPham | MaLoai | INT | loaiSanPham |
| SanPham | MaTH | INT | thuongHieu |
| SanPham | MoTa | NVARCHAR(MAX) | moTa |
| SanPham | AnhChinh | NVARCHAR(255) | anhChinh |
| SanPham | GioiTinh | INT | gioiTinh |
| SanPham | TrangThaiSP | INT | trangThaiSP |
| SanPham | NgayTao | DATETIME | ngayTao (handled via @PrePersist) |
| SanPham | NgayCapNhat | DATETIME | ngayCapNhat (@PreUpdate) |
| SanPhamChiTiet | MaBienThe | INT IDENTITY | maBienThe |
| SanPhamChiTiet | MaSP | INT | sanPham |
| SanPhamChiTiet | MaSize | INT | sizeSP |
| SanPhamChiTiet | MaMau | INT | mauSacSP |
| SanPhamChiTiet | GiaBan | DECIMAL | giaBan |
| SanPhamChiTiet | GiaNhap | DECIMAL | giaNhap |
| SanPhamChiTiet | SoLuongTon | INT | soLuongTon |
| SanPhamChiTiet | AnhBienThe | NVARCHAR(255) | anhBienThe |

(Những bảng còn lại: DonHang, DonHangCT, LichSuDonHang, GioHang, GioHangChiTiet, HinhThucThanhToan, KhuyenMai, KhuyenMai_ChiTiet... tương tự đã ánh xạ hoặc sẽ bổ sung sau tùy nhu cầu.)

## 🧹 Dọn dẹp đã thực hiện
- Xóa các file rỗng / dư: `AuthService.java`, `TaiKhoanRoleRepository.java`, `PasswordHashGenerator.java`, `TaiKhoan_Role.java`, `TaiKhoanRoleId.java`
- Giữ ManyToMany trực tiếp cho quan hệ tài khoản ↔ role
- Bỏ mã hóa BCrypt (dev mode) – dễ kiểm tra login với mật khẩu `123`
- Thêm lifecycle @PrePersist/@PreUpdate cho `TaiKhoan` để chuẩn hóa thời gian

## 🔐 Đăng nhập mẫu
| Email | Mật khẩu |
|-------|----------|
| admin@luxury.com | 123 |
| nhanvien@luxury.com | 123 |
| khachhang@luxury.com | 123 |

## 🧪 Kiểm thử nhanh
Sau khi chạy `./start.sh`:
1. Mở http://localhost:5173
2. Đăng nhập với một tài khoản ở bảng trên
3. Kiểm tra DevTools Network: request POST `/api/auth/login` trả về token + user.roles

## 🛣️ Lộ trình tối ưu tiếp (gợi ý)
1. Khôi phục BCrypt + migrate mật khẩu (script update)
2. Thêm Refresh Token + logout logic server side
3. Thêm phân trang server cho sản phẩm / đơn hàng
4. Thêm search full-text (Elastic hoặc SQL CONTAINS)
5. Tối ưu cache (Spring Cache / Redis) cho danh mục cố định
6. CI/CD: GitHub Actions build + kiểm thử + deploy staging

## 📂 Tài liệu khác
- `QUICK_START.md`: chỉ dẫn cực nhanh cho người mới
- `HOW_TO_RUN.md`: chi tiết cách start/stop thủ công & troubleshooting
- `SUMMARY.md`: tổng quan tiến độ (nên cập nhật sau mỗi sprint)

## 💡 Ghi chú quan trọng
- Plain text password chỉ dùng nội bộ phát triển — KHÔNG dùng production.
- File `db.sql` có thể chạy lại để reset dữ liệu; khi reset hãy đảm bảo không có kết nối tới DB.
- Mọi endpoint chưa public cần JWT; gửi header `Authorization: Bearer <token>`.

Chúc làm việc hiệu quả! 🚀
