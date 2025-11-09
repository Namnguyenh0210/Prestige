
================================================================================
PHẦN 1: TẠO CẤU TRÚC BẢNG (CREATE TABLES)
Tạo theo thứ tự chuẩn, các bảng không phụ thuộc sẽ được tạo trước.
================================================================================
*/
CREATE DATABASE LuxuryFashionDB;
GO

USE LuxuryFashionDB;
-- Bảng: TaiKhoan
CREATE TABLE TaiKhoan (
MaTK INT PRIMARY KEY IDENTITY(1,1),
HoTen NVARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
MatKhau VARCHAR(255) NOT NULL,
SoDienThoai VARCHAR(20),
DiaChi NVARCHAR(255),
VaiTro NVARCHAR(50) NOT NULL CHECK (VaiTro IN ('ADMIN', 'NHANVIEN', 'KHACHHANG')),
Avatar NVARCHAR(255),
LastLogin DATETIME,
TrangThai BIT DEFAULT 1,
NgayTao DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: ThuongHieu
CREATE TABLE ThuongHieu (
MaTH INT PRIMARY KEY IDENTITY(1,1),
TenTH NVARCHAR(100) NOT NULL,
MoTa NVARCHAR(255)
);
GO

-- Bảng: LoaiSanPham
CREATE TABLE LoaiSanPham (
MaLoai INT PRIMARY KEY IDENTITY(1,1),
TenLoai NVARCHAR(100) NOT NULL,
MoTa NVARCHAR(255)
);
GO

-- Bảng: SizeSP
CREATE TABLE SizeSP (
MaSize INT PRIMARY KEY IDENTITY(1,1),
TenSize NVARCHAR(20) UNIQUE NOT NULL
);
GO

-- Bảng: MauSacSP
CREATE TABLE MauSacSP (
MaMau INT PRIMARY KEY IDENTITY(1,1),
TenMau NVARCHAR(50) UNIQUE NOT NULL,
MaHex VARCHAR(7)
);
GO

-- Bảng: LoaiBaiViet
CREATE TABLE LoaiBaiViet (
MaLoaiBV INT PRIMARY KEY IDENTITY(1,1),
TenLoaiBV NVARCHAR(100) NOT NULL
);
GO

-- Bảng: GoiThanhVien
CREATE TABLE GoiThanhVien (
MaGoi INT PRIMARY KEY IDENTITY(1,1),
TenGoi NVARCHAR(100) NOT NULL,
Gia DECIMAL(18,2) NOT NULL,
ThoiHan INT NOT NULL, -- Số ngày
UuDai NVARCHAR(255)
);
GO

-- Bảng: NhaCungCap
CREATE TABLE NhaCungCap (
MaNCC INT PRIMARY KEY IDENTITY(1,1),
TenNCC NVARCHAR(100) NOT NULL,
SoDienThoai VARCHAR(20),
DiaChi NVARCHAR(255)
);
GO

-- Bảng: SanPham (phụ thuộc ThuongHieu, LoaiSanPham)
CREATE TABLE SanPham (
MaSP INT PRIMARY KEY IDENTITY(1,1),
TenSP NVARCHAR(255) NOT NULL,
MaLoai INT FOREIGN KEY REFERENCES LoaiSanPham(MaLoai) ON DELETE SET NULL,
MaTH INT FOREIGN KEY REFERENCES ThuongHieu(MaTH) ON DELETE SET NULL,
MoTa NVARCHAR(MAX),
AnhChinh NVARCHAR(255),
TrangThaiSP INT DEFAULT 1, -- 1: Đang bán, 0: Ngừng bán
NgayTao DATETIME DEFAULT GETDATE(),
NgayCapNhat DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: SanPhamChiTiet (Biến thể, phụ thuộc SanPham, SizeSP, MauSacSP)
CREATE TABLE SanPhamChiTiet (
MaBienThe INT PRIMARY KEY IDENTITY(1,1),
MaSP INT FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
MaSize INT FOREIGN KEY REFERENCES SizeSP(MaSize),
MaMau INT FOREIGN KEY REFERENCES MauSacSP(MaMau),
GiaBan DECIMAL(18,2) NOT NULL,
GiaThue DECIMAL(18,2),
SoLuongTon INT DEFAULT 0,
AnhBienThe NVARCHAR(255),
CONSTRAINT UK_SanPham_Variant UNIQUE (MaSP, MaSize, MaMau)
);
GO

-- Bảng: HinhAnhSP (phụ thuộc SanPham)
CREATE TABLE HinhAnhSP (
MaAnh INT PRIMARY KEY IDENTITY(1,1),
MaSP INT FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
DuongDan NVARCHAR(255) NOT NULL
);
GO

-- Bảng: SoDiaChi (phụ thuộc TaiKhoan)
CREATE TABLE SoDiaChi (
MaDiaChi INT PRIMARY KEY IDENTITY(1,1),
MaTK INT FOREIGN KEY REFERENCES TaiKhoan(MaTK) ON DELETE CASCADE,
HoTenNguoiNhan NVARCHAR(100) NOT NULL,
SoDienThoai VARCHAR(20) NOT NULL,
DiaChiChiTiet NVARCHAR(500) NOT NULL,
LaMacDinh BIT DEFAULT 0
);
GO

-- Bảng: GioHang (phụ thuộc TaiKhoan)
CREATE TABLE GioHang (
MaGioHang INT PRIMARY KEY IDENTITY(1,1),
MaTK INT UNIQUE NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK) ON DELETE CASCADE
);
GO

-- Bảng: GioHangChiTiet (phụ thuộc GioHang, SanPhamChiTiet)
CREATE TABLE GioHangChiTiet (
MaGH_CT INT PRIMARY KEY IDENTITY(1,1),
MaGioHang INT NOT NULL FOREIGN KEY REFERENCES GioHang(MaGioHang) ON DELETE CASCADE,
MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
SoLuong INT DEFAULT 1,
NgayThem DATETIME DEFAULT GETDATE(),
CONSTRAINT UK_GioHang_BienThe UNIQUE (MaGioHang, MaBienThe)
);
GO

-- Bảng: DonHang (phụ thuộc TaiKhoan, SoDiaChi)
CREATE TABLE DonHang (
MaDH INT PRIMARY KEY IDENTITY(1,1),
MaTK INT FOREIGN KEY REFERENCES TaiKhoan(MaTK) ON DELETE SET NULL,
NgayDat DATETIME DEFAULT GETDATE(),
TongTien DECIMAL(18,2) DEFAULT 0,
MaDiaChiGiao INT FOREIGN KEY REFERENCES SoDiaChi(MaDiaChi) ON DELETE SET NULL,
GhiChu NVARCHAR(500),
PhuongThucThanhToan NVARCHAR(50),
TrangThaiDH INT DEFAULT 0, -- 0: Chờ xác nhận, 1: Đã xác nhận, 2: Đang giao...
NgayCapNhat DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: DonHangCT (phụ thuộc DonHang, SanPhamChiTiet)
CREATE TABLE DonHangCT (
MaCT INT PRIMARY KEY IDENTITY(1,1),
MaDH INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDH) ON DELETE CASCADE,
MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
SoLuong INT NOT NULL,
DonGia DECIMAL(18,2) NOT NULL -- Giá tại thời điểm mua
);
GO

-- Bảng: NhapKho (phụ thuộc SanPhamChiTiet, TaiKhoan, NhaCungCap)
CREATE TABLE NhapKho (
MaNK INT PRIMARY KEY IDENTITY(1,1),
MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
MaNV INT FOREIGN KEY REFERENCES TaiKhoan(MaTK), -- Mã nhân viên
MaNCC INT FOREIGN KEY REFERENCES NhaCungCap(MaNCC),
SoLuong INT NOT NULL,
DonGiaNhap DECIMAL(18,2) NOT NULL,
NgayNhap DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: ThueDo (phụ thuộc TaiKhoan, SanPhamChiTiet)
CREATE TABLE ThueDo (
MaThue INT PRIMARY KEY IDENTITY(1,1),
MaTK INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
NgayThue DATETIME DEFAULT GETDATE(),
NgayTra DATETIME,
GiaThue DECIMAL(18,2) NOT NULL,
TrangThai INT DEFAULT 0, -- 0: Đang thuê, 1: Đã trả...
DoMoi INT,
GhiChu NVARCHAR(255)
);
GO

-- Bảng: DanhGia (phụ thuộc SanPham, TaiKhoan)
CREATE TABLE DanhGia (
MaDG INT PRIMARY KEY IDENTITY(1,1),
MaSP INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSP),
MaTK INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
NoiDung NVARCHAR(500),
Diem INT NOT NULL CHECK (Diem >= 1 AND Diem <= 5),
HinhAnh NVARCHAR(255),
AnDanh BIT DEFAULT 0,
NgayDanhGia DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: BaiViet (phụ thuộc LoaiBaiViet, TaiKhoan)
CREATE TABLE BaiViet (
MaBV INT PRIMARY KEY IDENTITY(1,1),
MaLoaiBV INT FOREIGN KEY REFERENCES LoaiBaiViet(MaLoaiBV),
MaTK INT FOREIGN KEY REFERENCES TaiKhoan(MaTK), -- Tác giả
TieuDe NVARCHAR(255) NOT NULL,
NoiDung NVARCHAR(MAX) NOT NULL,
HinhAnh NVARCHAR(255),
LuotXem INT DEFAULT 0,
LuotThich INT DEFAULT 0,
NgayDang DATETIME DEFAULT GETDATE()
);
GO

-- Bảng: DangKyThanhVien (phụ thuộc TaiKhoan, GoiThanhVien)
CREATE TABLE DangKyThanhVien (
MaDK INT PRIMARY KEY IDENTITY(1,1),
MaTK INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
MaGoi INT NOT NULL FOREIGN KEY REFERENCES GoiThanhVien(MaGoi),
NgayBatDau DATETIME DEFAULT GETDATE(),
NgayKetThuc DATETIME,
TrangThai INT DEFAULT 1 -- 1: Hoạt động, 0: Hết hạn
);
GO

PRINT N'TẠO CẤU TRÚC BẢNG THÀNH CÔNG!';
GO

/*
================================================================================
PHẦN 2: CHÈN DỮ LIỆU MẪU (INSERT DATA)
Chèn theo thứ tự để đảm bảo khóa ngoại hợp lệ.
================================================================================
*/

-- Bật IDENTITY_INSERT để chèn MaTK, MaSP... thủ công cho dễ quản lý
SET IDENTITY_INSERT dbo.TaiKhoan ON;
INSERT INTO TaiKhoan (MaTK, HoTen, Email, MatKhau, SoDienThoai, DiaChi, VaiTro, TrangThai)
VALUES
(1, N'Trần Văn Admin', 'admin@luxury.com', '123', '0900000001', N'123 Đường Admin, Q1, TP.HCM', 'ADMIN', 1),
(2, N'Nguyễn Thị Nhân Viên', 'nhanvien@luxury.com', '123', '0900000002', N'456 Đường Nhân Viên, Q3, TP.HCM', 'NHANVIEN', 1),
(3, N'Lê Văn Khách Hàng', 'khachhang@luxury.com', '123', '0900000003', N'789 Đường Khách Hàng, Q.Tân Bình, TP.HCM', 'KHACHHANG', 1);
SET IDENTITY_INSERT dbo.TaiKhoan OFF;
GO

SET IDENTITY_INSERT dbo.ThuongHieu ON;
INSERT INTO ThuongHieu (MaTH, TenTH, MoTa)
VALUES
(1, N'Gucci', N'Thương hiệu thời trang cao cấp của Ý'),
(2, N'Chanel', N'Thương hiệu thời trang cao cấp của Pháp'),
(3, N'Louis Vuitton', N'Thương hiệu xa xỉ của Pháp');
SET IDENTITY_INSERT dbo.ThuongHieu OFF;
GO

SET IDENTITY_INSERT dbo.LoaiSanPham ON;
INSERT INTO LoaiSanPham (MaLoai, TenLoai, MoTa)
VALUES
(1, N'Áo', N'Các loại áo sơ mi, áo polo, áo phông...'),
(2, N'Quần', N'Các loại quần jeans, quần tây...'),
(3, N'Túi xách', N'Túi xách và phụ kiện');
SET IDENTITY_INSERT dbo.LoaiSanPham OFF;
GO

SET IDENTITY_INSERT dbo.SizeSP ON;
INSERT INTO SizeSP (MaSize, TenSize) VALUES (1, N'S'), (2, N'M'), (3, N'L');
SET IDENTITY_INSERT dbo.SizeSP OFF;
GO

SET IDENTITY_INSERT dbo.MauSacSP ON;
INSERT INTO MauSacSP (MaMau, TenMau, MaHex)
VALUES
(1, N'Đen', '#000000'),
(2, N'Trắng', '#FFFFFF'),
(3, N'Beige', '#F5F5DC');
SET IDENTITY_INSERT dbo.MauSacSP OFF;
GO

SET IDENTITY_INSERT dbo.NhaCungCap ON;
INSERT INTO NhaCungCap (MaNCC, TenNCC, SoDienThoai, DiaChi)
VALUES
(1, N'Nhà phân phối Gucci VN', '02811112222', N'10 Nguyễn Trãi, Q1, TP.HCM'),
(2, N'Nhà phân phối Chanel VN', '02833334444', N'50 Đồng Khởi, Q1, TP.HCM');
SET IDENTITY_INSERT dbo.NhaCungCap OFF;
GO

SET IDENTITY_INSERT dbo.GoiThanhVien ON;
INSERT INTO GoiThanhVien (MaGoi, TenGoi, Gia, ThoiHan, UuDai)
VALUES
(1, N'VIP Gold', 5000000, 365, N'Giảm 10% mọi đơn hàng, miễn phí giặt ủi đồ thuê'),
(2, N'Platinum', 10000000, 365, N'Giảm 15%, ưu tiên thuê mẫu mới');
SET IDENTITY_INSERT dbo.GoiThanhVien OFF;
GO

SET IDENTITY_INSERT dbo.LoaiBaiViet ON;
INSERT INTO LoaiBaiViet (MaLoaiBV, TenLoaiBV)
VALUES
(1, N'Tin tức'),
(2, N'Xu hướng thời trang');
SET IDENTITY_INSERT dbo.LoaiBaiViet OFF;
GO

-- Chèn Sản phẩm
SET IDENTITY_INSERT dbo.SanPham ON;
INSERT INTO SanPham (MaSP, TenSP, MaLoai, MaTH, MoTa, AnhChinh, TrangThaiSP)
VALUES
(1, N'Áo Polo Gucci Cotton', 1, 1, N'Áo polo nam chất liệu cotton cao cấp', '/images/polo-gucci.jpg', 1),
(2, N'Túi Chanel 19 Flap Bag', 3, 2, N'Túi xách Chanel 19 da cừu', '/images/chanel-19.jpg', 1);
SET IDENTITY_INSERT dbo.SanPham OFF;
GO

-- Chèn Biến thể sản phẩm (SKU)
SET IDENTITY_INSERT dbo.SanPhamChiTiet ON;
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaThue, SoLuongTon, AnhBienThe)
VALUES
-- Các biến thể cho Áo Polo (MaSP = 1)
(1, 1, 1, 1, 15000000, 1500000, 50, '/images/polo-gucci-s-den.jpg'), -- S, Đen
(2, 1, 2, 1, 15000000, 1500000, 50, '/images/polo-gucci-m-den.jpg'), -- M, Đen
(3, 1, 2, 2, 15000000, 1500000, 30, '/images/polo-gucci-m-trang.jpg'), -- M, Trắng
-- Các biến thể cho Túi Chanel (MaSP = 2)
(4, 2, NULL, 1, 120000000, 12000000, 10, '/images/chanel-19-den.jpg'), -- Túi (ko có size), Đen
(5, 2, NULL, 3, 120000000, 12000000, 5, '/images/chanel-19-beige.jpg'); -- Túi (ko có size), Beige
SET IDENTITY_INSERT dbo.SanPhamChiTiet OFF;
GO

-- Chèn địa chỉ cho khách hàng (MaTK = 3)
SET IDENTITY_INSERT dbo.SoDiaChi ON;
INSERT INTO SoDiaChi (MaDiaChi, MaTK, HoTenNguoiNhan, SoDienThoai, DiaChiChiTiet, LaMacDinh)
VALUES
(1, 3, N'Lê Văn Khách Hàng', '0900000003', N'789 Đường Khách Hàng, P.1, Q.Tân Bình, TP.HCM', 1),
(2, 3, N'Văn phòng cty', '0900000003', N'100 Nguyễn Văn Trỗi, Q.Phú Nhuận, TP.HCM', 0);
SET IDENTITY_INSERT dbo.SoDiaChi OFF;
GO

-- Chèn giỏ hàng cho khách hàng (MaTK = 3)
SET IDENTITY_INSERT dbo.GioHang ON;
INSERT INTO GioHang (MaGioHang, MaTK) VALUES (1, 3);
SET IDENTITY_INSERT dbo.GioHang OFF;
GO

-- Chèn chi tiết giỏ hàng (Khách hàng 3, Giỏ hàng 1, mua Áo Polo S Đen (MaBienThe = 1))
INSERT INTO GioHangChiTiet (MaGioHang, MaBienThe, SoLuong)
VALUES
(1, 1, 2); -- Thêm 2 cái Áo Polo S Đen vào giỏ
GO

-- Chèn 1 đơn hàng cũ cho Khách hàng 3
SET IDENTITY_INSERT dbo.DonHang ON;
INSERT INTO DonHang (MaDH, MaTK, NgayDat, TongTien, MaDiaChiGiao, PhuongThucThanhToan, TrangThaiDH)
VALUES
(1, 3, GETDATE() - 7, 120000000, 1, N'Chuyển khoản', 3); -- Đã giao
SET IDENTITY_INSERT dbo.DonHang OFF;
GO

-- Chèn chi tiết cho đơn hàng 1 (Mua 1 cái túi Chanel Đen, MaBienThe = 4)
INSERT INTO DonHangCT (MaDH, MaBienThe, SoLuong, DonGia)
VALUES
(1, 4, 1, 120000000);
GO

-- Chèn 1 đánh giá của Khách hàng 3 cho sản phẩm 2 (Túi Chanel)
INSERT INTO DanhGia (MaSP, MaTK, NoiDung, Diem)
VALUES
(2, 3, N'Túi rất đẹp, hàng chuẩn auth, giao nhanh.', 5);
GO

-- Chèn 1 lịch sử nhập kho (Nhân viên 2 nhập Áo Polo M Trắng)
INSERT INTO NhapKho (MaBienThe, MaNV, MaNCC, SoLuong, DonGiaNhap)
VALUES
(3, 2, 1, 100, 8000000); -- Nhập 100 cái áo polo M trắng
GO

-- Chèn 1 lịch sử thuê đồ (Khách hàng 3 thuê 1 cái túi Beige)
INSERT INTO ThueDo (MaTK, MaBienThe, NgayThue, NgayTra, GiaThue, TrangThai)
VALUES
(3, 5, GETDATE() - 3, GETDATE() + 4, 12000000, 0); -- Đang thuê
GO

-- Chèn 1 bài viết (Admin 1 đăng)
SET IDENTITY_INSERT dbo.BaiViet ON;
INSERT INTO BaiViet (MaBV, MaLoaiBV, MaTK, TieuDe, NoiDung)
VALUES
(1, 2, 1, N'Xu hướng Thu-Đông 2025', N'Nội dung chi tiết về xu hướng thời trang thu đông...');
SET IDENTITY_INSERT dbo.BaiViet OFF;
GO

-- Chèn 1 đăng ký thành viên (Khách hàng 3 đăng ký gói VIP Gold)
INSERT INTO DangKyThanhVien (MaTK, MaGoi, NgayBatDau, NgayKetThuc, TrangThai)
VALUES
(3, 1, GETDATE(), DATEADD(day, 365, GETDATE()), 1);
GO

PRINT N'CHÈN DỮ LIỆU MẪU THÀNH CÔNG!';
GO

USE LuxuryFashionDB; -- Đảm bảo bạn đang dùng đúng Database
GO

PRINT N'1. Bảng TaiKhoan';
SELECT * FROM dbo.TaiKhoan;
GO

PRINT N'2. Bảng ThuongHieu';
SELECT * FROM dbo.ThuongHieu;
GO

PRINT N'3. Bảng LoaiSanPham';
SELECT * FROM dbo.LoaiSanPham;
GO

PRINT N'4. Bảng SizeSP';
SELECT * FROM dbo.SizeSP;
GO

PRINT N'5. Bảng MauSacSP';
SELECT * FROM dbo.MauSacSP;
GO

PRINT N'6. Bảng LoaiBaiViet';
SELECT * FROM dbo.LoaiBaiViet;
GO

PRINT N'7. Bảng GoiThanhVien';
SELECT * FROM dbo.GoiThanhVien;
GO

PRINT N'8. Bảng NhaCungCap';
SELECT * FROM dbo.NhaCungCap;
GO

PRINT N'9. Bảng SanPham';
SELECT * FROM dbo.SanPham;
GO

PRINT N'10. Bảng SanPhamChiTiet (Biến thể)';
SELECT * FROM dbo.SanPhamChiTiet;
GO

PRINT N'11. Bảng HinhAnhSP';
SELECT * FROM dbo.HinhAnhSP;
GO

PRINT N'12. Bảng SoDiaChi';
SELECT * FROM dbo.SoDiaChi;
GO

PRINT N'13. Bảng GioHang';
SELECT * FROM dbo.GioHang;
GO

PRINT N'14. Bảng GioHangChiTiet';
SELECT * FROM dbo.GioHangChiTiet;
GO

PRINT N'15. Bảng DonHang';
SELECT * FROM dbo.DonHang;
GO

PRINT N'16. Bảng DonHangCT';
SELECT * FROM dbo.DonHangCT;
GO

PRINT N'17. Bảng NhapKho';
SELECT * FROM dbo.NhapKho;
GO

PRINT N'18. Bảng ThueDo';
SELECT * FROM dbo.ThueDo;
GO

PRINT N'19. Bảng DanhGia';
SELECT * FROM dbo.DanhGia;
GO

PRINT N'20. Bảng BaiViet';
SELECT * FROM dbo.BaiViet;
GO

PRINT N'21. Bảng DangKyThanhVien';
SELECT * FROM dbo.DangKyThanhVien;
GO