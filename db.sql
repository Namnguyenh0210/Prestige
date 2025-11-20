/*
KỊCH BẢN TẠO CƠ SỞ DỮ LIỆU LUXURY FASHION (BẢN PRODUCTION 2025)
HỆ QUẢN TRỊ: SQL SERVER
MÔ TẢ: Đã bỏ Trigger, logic sẽ được xử lý trong Spring Boot Service.
*** SỬA LỖI: Đổi INT sang BIGINT để khớp với Java Entity (Long id) ***
================================================================================
*/

-- PHẦN 0: HỦY VÀ TẠO LẠI CƠ SỞ DỮ LIỆU


-- Tạo database mới
CREATE DATABASE LuxuryFashion_2025;
GO

-- Sử dụng database mới
USE LuxuryFashion_2025;
GO
PRINT N'PHẦN 0: TẠO VÀ SỬ DỤNG DATABASE LuxuryFashion_2025 THÀNH CÔNG!';
GO

/*
PHẦN 1: HỦY CÁC BẢNG (DROP TABLES)
Hủy theo thứ tự ngược lại của các ràng buộc khóa ngoại để tránh lỗi.
================================================================================
*/

IF OBJECT_ID('dbo.TinNhan', 'U') IS NOT NULL
DROP TABLE dbo.TinNhan;
IF
OBJECT_ID('dbo.PhongChat', 'U') IS NOT NULL
DROP TABLE dbo.PhongChat;
IF
OBJECT_ID('dbo.DangKyThanhVien', 'U') IS NOT NULL
DROP TABLE dbo.DangKyThanhVien;
IF
OBJECT_ID('dbo.NhapKhoChiTiet', 'U') IS NOT NULL
DROP TABLE dbo.NhapKhoChiTiet;
IF
OBJECT_ID('dbo.PhieuNhap', 'U') IS NOT NULL
DROP TABLE dbo.PhieuNhap;
IF
OBJECT_ID('dbo.NhaCungCap', 'U') IS NOT NULL
DROP TABLE dbo.NhaCungCap;
IF
OBJECT_ID('dbo.GioHangChiTiet', 'U') IS NOT NULL
DROP TABLE dbo.GioHangChiTiet;
IF
OBJECT_ID('dbo.GioHang', 'U') IS NOT NULL
DROP TABLE dbo.GioHang;
IF
OBJECT_ID('dbo.BinhLuan', 'U') IS NOT NULL
DROP TABLE dbo.BinhLuan;
IF
OBJECT_ID('dbo.BaiViet', 'U') IS NOT NULL
DROP TABLE dbo.BaiViet;
IF
OBJECT_ID('dbo.LoaiBaiViet', 'U') IS NOT NULL
DROP TABLE dbo.LoaiBaiViet;
IF
OBJECT_ID('dbo.DanhGia', 'U') IS NOT NULL
DROP TABLE dbo.DanhGia;
IF
OBJECT_ID('dbo.DonHangCT', 'U') IS NOT NULL
DROP TABLE dbo.DonHangCT;
IF
OBJECT_ID('dbo.LichSuDonHang', 'U') IS NOT NULL
DROP TABLE dbo.LichSuDonHang;
IF
OBJECT_ID('dbo.DonHang', 'U') IS NOT NULL
DROP TABLE dbo.DonHang;
IF
OBJECT_ID('dbo.HinhThucThanhToan', 'U') IS NOT NULL
DROP TABLE dbo.HinhThucThanhToan;
IF
OBJECT_ID('dbo.KhuyenMai_ChiTiet', 'U') IS NOT NULL
DROP TABLE dbo.KhuyenMai_ChiTiet;
IF
OBJECT_ID('dbo.KhuyenMai', 'U') IS NOT NULL
DROP TABLE dbo.KhuyenMai;
IF
OBJECT_ID('dbo.GoiThanhVien', 'U') IS NOT NULL
DROP TABLE dbo.GoiThanhVien;
IF
OBJECT_ID('dbo.HinhAnhSP', 'U') IS NOT NULL
DROP TABLE dbo.HinhAnhSP;
IF
OBJECT_ID('dbo.SanPhamChiTiet', 'U') IS NOT NULL
DROP TABLE dbo.SanPhamChiTiet;
IF
OBJECT_ID('dbo.SanPham', 'U') IS NOT NULL
DROP TABLE dbo.SanPham;
IF
OBJECT_ID('dbo.MauSacSP', 'U') IS NOT NULL
DROP TABLE dbo.MauSacSP;
IF
OBJECT_ID('dbo.SizeSP', 'U') IS NOT NULL
DROP TABLE dbo.SizeSP;
IF
OBJECT_ID('dbo.LoaiSanPham', 'U') IS NOT NULL
DROP TABLE dbo.LoaiSanPham;
IF
OBJECT_ID('dbo.ThuongHieu', 'U') IS NOT NULL
DROP TABLE dbo.ThuongHieu;
IF
OBJECT_ID('dbo.SoDiaChi', 'U') IS NOT NULL
DROP TABLE dbo.SoDiaChi;
IF
OBJECT_ID('dbo.TaiKhoan_Role', 'U') IS NOT NULL
DROP TABLE dbo.TaiKhoan_Role;
IF
OBJECT_ID('dbo.Role', 'U') IS NOT NULL
DROP TABLE dbo.Role;
IF
OBJECT_ID('dbo.TaiKhoan', 'U') IS NOT NULL
DROP TABLE dbo.TaiKhoan;
GO

PRINT N'PHẦN 1: HỦY BẢNG CŨ THÀNH CÔNG!';
GO

/*
================================================================================
 PHẦN 2: TẠO CẤU TRÚC BẢNG (CREATE TABLES)
 Đã tối ưu NOT NULL cho các cột trạng thái.
================================================================================
*/

-- Bảng: TaiKhoan
CREATE TABLE TaiKhoan
(
    MaTK        BIGINT IDENTITY(1,1) PRIMARY KEY,
    HoTen       NVARCHAR(100) NOT NULL,
    Email       VARCHAR(100) UNIQUE NOT NULL,
    MatKhau     VARCHAR(255)        NOT NULL,
    SoDienThoai VARCHAR(20),
    DiaChi      NVARCHAR(255),
    Avatar      NVARCHAR(255),
    LastLogin   DATETIME,
    TrangThai   BIT                 NOT NULL DEFAULT 1,
    NgayTao     DATETIME                     DEFAULT GETDATE(),
    NgayCapNhat DATETIME                     DEFAULT GETDATE()
);

-- Bảng: Role (Phân Quyền)
CREATE TABLE Role
(
    MaRole  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenRole VARCHAR(50) UNIQUE NOT NULL
);

-- Bảng: TaiKhoan_Role (Nối Tài Khoản - Quyền)
CREATE TABLE TaiKhoan_Role
(
    MaTK   BIGINT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaRole BIGINT NOT NULL FOREIGN KEY REFERENCES Role(MaRole),
    PRIMARY KEY (MaTK, MaRole)
);

-- Bảng: SoDiaChi
CREATE TABLE SoDiaChi
(
    MaDiaChi       BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaTK           BIGINT      NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    HoTenNguoiNhan NVARCHAR(100) NOT NULL,
    SoDienThoai    VARCHAR(20) NOT NULL,
    DiaChiChiTiet  NVARCHAR(500) NOT NULL,
    LaMacDinh      BIT DEFAULT 0
);

-- Bảng: ThuongHieu
CREATE TABLE ThuongHieu
(
    MaTH  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenTH NVARCHAR(100) NOT NULL,
    MoTa  NVARCHAR(255)
);

-- Bảng: LoaiSanPham
CREATE TABLE LoaiSanPham
(
    MaLoai  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL,
    MoTa    NVARCHAR(255)
);

-- Bảng: SizeSP
CREATE TABLE SizeSP
(
    MaSize  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenSize NVARCHAR(20) UNIQUE NOT NULL
);

-- Bảng: MauSacSP
CREATE TABLE MauSacSP
(
    MaMau  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenMau NVARCHAR(50) UNIQUE NOT NULL,
    MaHex  VARCHAR(7)
);

-- Bảng: SanPham
CREATE TABLE SanPham
(
    MaSP        BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenSP       NVARCHAR(255) NOT NULL,
    MaLoai      BIGINT FOREIGN KEY REFERENCES LoaiSanPham(MaLoai) ON DELETE SET NULL,
    MaTH        BIGINT FOREIGN KEY REFERENCES ThuongHieu(MaTH) ON DELETE SET NULL,
    MoTa        NVARCHAR(MAX),
    AnhChinh    NVARCHAR(255),
    GioiTinh    INT NOT NULL DEFAULT 2, -- 0=Nam, 1=Nữ, 2=Unisex
    TrangThaiSP INT NOT NULL DEFAULT 1, -- 1: Đang bán, 0: Ngừng bán
    NgayTao     DATETIME     DEFAULT GETDATE(),
    NgayCapNhat DATETIME     DEFAULT GETDATE()
);

-- Bảng: SanPhamChiTiet (Biến thể SKU)
CREATE TABLE SanPhamChiTiet
(
    MaBienThe  BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaSP       BIGINT         NOT NULL FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
    MaSize     BIGINT FOREIGN KEY REFERENCES SizeSP(MaSize),
    MaMau      BIGINT FOREIGN KEY REFERENCES MauSacSP(MaMau),
    GiaBan     DECIMAL(18, 2) NOT NULL,
    GiaNhap    DECIMAL(18, 2) DEFAULT 0,
    SoLuongTon INT            DEFAULT 0,
    AnhBienThe NVARCHAR(255),
    CONSTRAINT UK_SanPham_Variant UNIQUE (MaSP, MaSize, MaMau)
);

-- Bảng: HinhAnhSP
CREATE TABLE HinhAnhSP
(
    MaAnh    BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaSP     BIGINT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
    DuongDan NVARCHAR(255)
);

-- Bảng: GoiThanhVien
CREATE TABLE GoiThanhVien
(
    MaGoi   BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenGoi  NVARCHAR(100),
    Gia     DECIMAL(18, 2),
    ThoiHan INT, -- Số ngày
    UuDai   NVARCHAR(255)
);

-- Bảng: KhuyenMai
CREATE TABLE KhuyenMai
(
    MaKM        BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenKM       NVARCHAR(100) NOT NULL,
    MaCode      VARCHAR(50) UNIQUE NOT NULL,
    LoaiKM      VARCHAR(50),
    LoaiGiaTri  INT DEFAULT 0, -- 0: %, 1: VND
    GiaTri      DECIMAL(18, 2),
    NgayBatDau  DATETIME           NOT NULL,
    NgayKetThuc DATETIME,
    MaGoi       BIGINT FOREIGN KEY REFERENCES GoiThanhVien(MaGoi),
    TrangThai   BIT DEFAULT 1,
    SoLanSuDung INT DEFAULT 0
);

-- Bảng: KhuyenMai_ChiTiet (Nối Khuyến Mãi - Sản phẩm/Biến thể)
CREATE TABLE KhuyenMai_ChiTiet
(
    MaKM      BIGINT NOT NULL FOREIGN KEY REFERENCES KhuyenMai(MaKM),
    MaSP      BIGINT FOREIGN KEY REFERENCES SanPham(MaSP),
    MaBienThe BIGINT FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    CONSTRAINT UK_KhuyenMai_ChiTiet UNIQUE (MaKM, MaSP, MaBienThe)
);

-- Bảng: HinhThucThanhToan
CREATE TABLE HinhThucThanhToan
(
    MaHinhThucTT BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenHinhThuc  NVARCHAR(100) UNIQUE NOT NULL,
    MoTa         NVARCHAR(255),
    TrangThai    BIT DEFAULT 1
);

-- Bảng: DonHang
CREATE TABLE DonHang
(
    MaDH               BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaTK               BIGINT FOREIGN KEY REFERENCES TaiKhoan(MaTK) ON DELETE SET NULL,
    NgayDat            DATETIME       DEFAULT GETDATE(),
    TongTien           DECIMAL(18, 2) DEFAULT 0,
    PhiShip            DECIMAL(18, 2) DEFAULT 0,
    MaKM               BIGINT FOREIGN KEY REFERENCES KhuyenMai(MaKM),
    MaDiaChiGiao       BIGINT FOREIGN KEY REFERENCES SoDiaChi(MaDiaChi),
    MaHinhThucTT       BIGINT FOREIGN KEY REFERENCES HinhThucThanhToan(MaHinhThucTT),
    GhiChu             NVARCHAR(500),
    TrangThaiDH        INT NOT NULL   DEFAULT 0, -- 0: Chờ xác nhận, 1: Đang giao...
    TrangThaiThanhToan INT NOT NULL   DEFAULT 0, -- 0=Chờ,1=Đã TT,2=Lỗi,3=Hoàn tiền
    NgayThanhToan      DATETIME NULL,
    NgayCapNhat        DATETIME       DEFAULT GETDATE()
);

-- Bảng: DonHangCT (Chi tiết đơn hàng)
CREATE TABLE DonHangCT
(
    MaCT      BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaDH      BIGINT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDH) ON DELETE CASCADE,
    MaBienThe BIGINT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong   INT,
    DonGia    DECIMAL(18, 2)
);

-- Bảng: LichSuDonHang (Audit Trail - Rất "xịn")
CREATE TABLE LichSuDonHang
(
    MaLichSu     BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaDH         BIGINT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDH) ON DELETE CASCADE,
    TrangThaiCu  INT NOT NULL,
    TrangThaiMoi INT NOT NULL,
    ThoiGian     DATETIME DEFAULT GETDATE(),
    GhiChu       NVARCHAR(255),
    NguoiCapNhat NVARCHAR(50) -- Tên Admin/Nhân viên
);

-- Bảng: DanhGia
CREATE TABLE DanhGia
(
    MaDG           BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaCT           BIGINT UNIQUE NOT NULL FOREIGN KEY REFERENCES DonHangCT(MaCT), -- Chỉ review SP đã mua
    MaTK           BIGINT        NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    NoiDung        NVARCHAR(500),
    Diem           INT        NOT NULL CHECK (Diem >= 1 AND Diem <= 5),
    HinhAnh        NVARCHAR(255),
    NgayDanhGia    DATETIME DEFAULT GETDATE(),
    SoLuongLike    INT      DEFAULT 0,
    SoLuongPhanHoi INT      DEFAULT 0
);

-- Bảng: LoaiBaiViet
CREATE TABLE LoaiBaiViet
(
    MaLoaiBV  BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenLoaiBV NVARCHAR(100)
);

-- Bảng: BaiViet
CREATE TABLE BaiViet
(
    MaBV      BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaLoaiBV  BIGINT FOREIGN KEY REFERENCES LoaiBaiViet(MaLoaiBV),
    MaTK      BIGINT FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    TieuDe    NVARCHAR(255),
    NoiDung   NVARCHAR(MAX),
    HinhAnh   NVARCHAR(255),
    LuotXem   INT      DEFAULT 0,
    TrangThai BIT      DEFAULT 1,  -- 1: Xuất bản, 0: Bản nháp
    Slug      VARCHAR(255) UNIQUE, -- Đường dẫn SEO
    NgayDang  DATETIME DEFAULT GETDATE()
);

-- Bảng: BinhLuan
CREATE TABLE BinhLuan
(
    MaBL           BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaSP           BIGINT FOREIGN KEY REFERENCES SanPham(MaSP),
    MaBV           BIGINT FOREIGN KEY REFERENCES BaiViet(MaBV),
    MaTK           BIGINT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    NoiDung        NVARCHAR(500) NOT NULL,
    NgayBinhLuan   DATETIME DEFAULT GETDATE(),
    AnDanh         BIT      DEFAULT 0,
    TrangThai      BIT      DEFAULT 1,
    SoLuongLike    INT      DEFAULT 0,
    SoLuongPhanHoi INT      DEFAULT 0,
    CONSTRAINT CK_BinhLuan CHECK (MaSP IS NOT NULL OR MaBV IS NOT NULL)
);

-- Bảng: GioHang
CREATE TABLE GioHang
(
    MaGioHang BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaTK      BIGINT UNIQUE NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK)
);

-- Bảng: GioHangChiTiet
CREATE TABLE GioHangChiTiet
(
    MaGH_CT   BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaGioHang BIGINT NOT NULL FOREIGN KEY REFERENCES GioHang(MaGioHang),
    MaBienThe BIGINT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong   INT      DEFAULT 1,
    NgayThem  DATETIME DEFAULT GETDATE(),
    CONSTRAINT UK_GioHang_BienThe UNIQUE (MaGioHang, MaBienThe)
);

-- Bảng: NhaCungCap
CREATE TABLE NhaCungCap
(
    MaNCC       BIGINT IDENTITY(1,1) PRIMARY KEY,
    TenNCC      NVARCHAR(100),
    SoDienThoai VARCHAR(20),
    DiaChi      NVARCHAR(255)
);

-- Bảng: PhieuNhap
CREATE TABLE PhieuNhap
(
    MaPN     BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaNV     BIGINT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK), -- Mã Nhân viên
    MaNCC    BIGINT FOREIGN KEY REFERENCES NhaCungCap(MaNCC),
    NgayNhap DATETIME       DEFAULT GETDATE(),
    TongTien DECIMAL(18, 2) DEFAULT 0,
    GhiChu   NVARCHAR(500)
);

-- Bảng: NhapKhoChiTiet
CREATE TABLE NhapKhoChiTiet
(
    MaNK_CT    BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaPN       BIGINT NOT NULL FOREIGN KEY REFERENCES PhieuNhap(MaPN) ON DELETE CASCADE,
    MaBienThe  BIGINT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong    INT,
    DonGiaNhap DECIMAL(18, 2),
    ThanhTien  DECIMAL(18, 2)
);

-- Bảng: DangKyThanhVien
CREATE TABLE DangKyThanhVien
(
    MaDK        BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaTK        BIGINT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaGoi       BIGINT NOT NULL FOREIGN KEY REFERENCES GoiThanhVien(MaGoi),
    NgayBatDau  DATETIME DEFAULT GETDATE(),
    NgayKetThuc DATETIME,
    TrangThai   INT      DEFAULT 1
);

-- Bảng: PhongChat
CREATE TABLE PhongChat
(
    MaPhong   BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaTK      BIGINT UNIQUE NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaNV      BIGINT FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    TrangThai INT      DEFAULT 0,
    NgayTao   DATETIME DEFAULT GETDATE()
);

-- Bảng: TinNhan
CREATE TABLE TinNhan
(
    MaTinNhan    BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaPhong      BIGINT NOT NULL FOREIGN KEY REFERENCES PhongChat(MaPhong) ON DELETE CASCADE,
    MaNguoiGui   BIGINT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    LoaiNguoiGui INT      DEFAULT 0, -- 0=Khách, 1=Nhân viên, 2=Bot
    LoaiTinNhan  INT      DEFAULT 0, -- 0=Text, 1=Image
    NoiDung      NVARCHAR(MAX),
    ThoiGianGui  DATETIME DEFAULT GETDATE(),
    DaDoc        BIT      DEFAULT 0
);
GO

PRINT N'PHẦN 2: TẠO CẤU TRÚC BẢNG THÀNH CÔNG!';
GO

/*
================================================================================
 PHẦN 3: CHÈN DỮ LIỆU MẪU (INSERT DATA)
 Chèn theo thứ tự logic để đảm bảo khóa ngoại hợp lệ.
================================================================================
*/
USE LuxuryFashion_2025;
GO

-- 1. Chèn các bảng Danh Mục (Không phụ thuộc)

SET IDENTITY_INSERT dbo.Role ON;
INSERT INTO Role (MaRole, TenRole) VALUES
(1, 'ADMIN'),
(2, 'NHANVIEN'),
(3, 'KHACHHANG');
SET IDENTITY_INSERT dbo.Role OFF;
GO

SET IDENTITY_INSERT dbo.TaiKhoan ON;
INSERT INTO TaiKhoan (MaTK, HoTen, Email, MatKhau, SoDienThoai, DiaChi, TrangThai) VALUES
(1, N'Admin Luxury', 'admin@luxury.com', '123', '0900000001', N'123 Đường Admin, Q1, TP.HCM', 1), -- Mật khẩu: 123 (plain text)
(2, N'Nguyễn Thị Bán Hàng', 'nhanvien@luxury.com', '123', '0900000002', N'456 Đường Nhân Viên, Q3, TP.HCM', 1), -- Mật khẩu: 123 (plain text)
(3, N'Lê Văn Khách', 'khachhang@luxury.com', '123', '0900000003', N'789 Đường Khách Hàng, Q.Tân Bình, TP.HCM', 1); -- Mật khẩu: 123 (plain text)
SET IDENTITY_INSERT dbo.TaiKhoan OFF;
GO

INSERT INTO TaiKhoan_Role (MaTK, MaRole) VALUES
(1, 1), -- Admin Luxury là ADMIN
(2, 2), -- Nguyễn Thị Bán Hàng là NHANVIEN
(3, 3); -- Lê Văn Khách là KHACHHANG
GO

SET IDENTITY_INSERT dbo.ThuongHieu ON;
INSERT INTO ThuongHieu (MaTH, TenTH, MoTa) VALUES
(1, N'Gucci', N'Thương hiệu thời trang cao cấp của Ý'),
(2, N'Chanel', N'Thương hiệu thời trang cao cấp của Pháp'),
(3, N'MLB', N'Thương hiệu thời trang thể thao Hàn Quốc');
SET IDENTITY_INSERT dbo.ThuongHieu OFF;
GO


SET IDENTITY_INSERT dbo.LoaiSanPham ON;
INSERT INTO LoaiSanPham (MaLoai, TenLoai, MoTa) VALUES
(1, N'Áo Polo', N'Các loại áo polo'),
(2, N'T-Shirt', N'Áo thun nam nữ'),
(3, N'Quần', N'Quần thời trang'),
(4, N'Áo Khoác', N'Áo khoác thời trang');
SET IDENTITY_INSERT dbo.LoaiSanPham OFF;
GO


SET IDENTITY_INSERT dbo.SizeSP ON;
INSERT INTO SizeSP (MaSize, TenSize) VALUES
(1, N'S'),
(2, N'M'),
(3, N'L'),
(4, N'XL');
SET IDENTITY_INSERT dbo.SizeSP OFF;
GO


SET IDENTITY_INSERT dbo.MauSacSP ON;
INSERT INTO MauSacSP (MaMau, TenMau, MaHex) VALUES
(1, N'Đen', '#000000'),
(2, N'Trắng', '#FFFFFF'),
(3, N'Be', '#F5F5DC'),
(4, N'Xanh đen', '#0A2342');
SET IDENTITY_INSERT dbo.MauSacSP OFF;
GO


SET IDENTITY_INSERT dbo.HinhThucThanhToan ON;
INSERT INTO HinhThucThanhToan (MaHinhThucTT, TenHinhThuc, MoTa, TrangThai) VALUES
(1, N'Thanh toán khi nhận hàng (COD)', N'Trả tiền mặt khi shipper giao hàng', 1),
(2, N'Thanh toán qua VNPay', N'Quét mã QR qua cổng VNPay', 1);
SET IDENTITY_INSERT dbo.HinhThucThanhToan OFF;
GO

SET IDENTITY_INSERT dbo.NhaCungCap ON;
INSERT INTO NhaCungCap (MaNCC, TenNCC, SoDienThoai, DiaChi) VALUES
(1, N'Nhà phân phối Gucci VN', '02811112222', N'10 Nguyễn Trãi, Q1, TP.HCM');
SET IDENTITY_INSERT dbo.NhaCungCap OFF;
GO

SET IDENTITY_INSERT dbo.GoiThanhVien ON;
INSERT INTO GoiThanhVien (MaGoi, TenGoi, Gia, ThoiHan, UuDai) VALUES
(1, N'VIP Gold', 5000000, 365, N'Giảm 10% mọi đơn hàng');
SET IDENTITY_INSERT dbo.GoiThanhVien OFF;
GO

SET IDENTITY_INSERT dbo.LoaiBaiViet ON;
INSERT INTO LoaiBaiViet (MaLoaiBV, TenLoaiBV) VALUES
(1, N'Xu hướng thời trang');
SET IDENTITY_INSERT dbo.LoaiBaiViet OFF;
GO

SET IDENTITY_INSERT dbo.KhuyenMai ON;
INSERT INTO KhuyenMai (MaKM, TenKM, MaCode, LoaiKM, LoaiGiaTri, GiaTri, NgayBatDau, NgayKetThuc, TrangThai) VALUES
(1, N'Giảm giá 10% toàn cửa hàng', 'HE2025', N'Toàn cửa hàng', 0, 10.00, GETDATE() - 1, GETDATE() + 30, 1);
SET IDENTITY_INSERT dbo.KhuyenMai OFF;
GO

-- 2. Chèn Sản Phẩm (Phụ thuộc các bảng trên)

SET IDENTITY_INSERT dbo.SanPham ON;
INSERT INTO SanPham (MaSP, TenSP, MaLoai, MaTH, MoTa, AnhChinh, GioiTinh, TrangThaiSP) VALUES
-- GUCCI (4 sản phẩm)
(1, N'Áo Polo Gucci Cotton', 1, 1, N'Áo polo Gucci', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/04/ao-polo-nam-gucci-cotton-piquet-polo-with-double-g-752604-mau-trang-kem-size-xs-661e3a9285fbc-16042024154506.jpg', 2, 1),
(2, N'Áo Thun Gucci Print',   2, 1, N'Áo thun Gucci', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/06/ao-thun-gucci-with-gucci-blade-print-t-shirt-mau-trang-6492642f01dfc-21062023094503.jpg', 2, 1),
(3, N'Quần Gucci Trackpant',  3, 1, N'Quần Gucci', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/476/319/products/gucci-black-taped-logo-track-pant.webp?v=1677586605390', 2, 1),
(4, N'Áo Khoác Gucci GG',     4, 1, N'Áo khoác Gucci', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/12/ao-khoac-nam-gucci-gg-technical-jersey-xip-jacket-737363-mau-nau-size-s-n-dg-676cfc86b54c2-26122024134942.jpg', 2, 1),

-- CHANEL (4 sản phẩm)
(5, N'Áo Polo Chanel Logo', 1, 2, N'Polo Chanel', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/562/756/products/vn-11134207-7r98o-lzvvkdx3bgwdda.jpg?v=1745749588853', 2, 1),
(6, N'T-Shirt Chanel Classic', 2, 2, N'Áo thun Chanel', 'https://yeli.vn/resources/uploaded/YeliShop/Products/2021/07/14607/order-ao-thun-chanel-logo-to-1-637620631410125837.jpg', 2, 1),
(7, N'Quần Chanel Pants', 3, 2, N'Quần Chanel', 'https://static.hotdeal.vn/images/859/859348/400x500/203799-quan-legging-in-hoa-tiet-ca-tinh-203782-vn-2-3.jpg', 2, 1),
(8, N'Áo Khoác Chanel Jacket', 4, 2, N'Jacket Chanel', 'https://bizweb.dktcdn.net/100/397/400/products/4-5-b73e0da8-2efd-4fa5-8ba6-611bdac58c8e.jpg?v=1662438941547', 2, 1),

-- MLB (4 sản phẩm)
(9, N'Áo Polo MLB Monogram', 1, 3, N'Polo MLB', 'https://bizweb.dktcdn.net/100/397/400/products/4-5-b73e0da8-2efd-4fa5-8ba6-611bdac58c8e.jpg?v=1662438941547', 2, 1),
(10, N'T-Shirt MLB BigLogo', 2, 3, N'Áo thun MLB', 'https://bizweb.dktcdn.net/100/446/974/products/ao-mlb-classic-monogram-big-logo-short-sleeve-t-shirt-new-york-yankees-black-3atsm0233-50bks-3.jpg?v=1686635060437', 2, 1),
(11, N'Quần MLB Sport', 3, 3, N'Quần MLB', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/10/quan-jogger-mlb-classic-sports-logo-jogger-pants-la-dodgers-3fptg0134-07nys-mau-xanh-navy-652e5465a27ea-17102023163117.jpg', 2, 1),
(12, N'Áo Khoác MLB Varsity', 4, 3, N'Áo khoác MLB', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/10/ao-bomber-mlb-wool-basic-varsity-jacket-new-york-yankees-3ajpv0634-50bkl-mau-den-652de78bbbe8d-17102023084651.jpg', 2, 1);
SET IDENTITY_INSERT dbo.SanPham OFF;
GO


-- 3. Chèn Biến Thể Sản Phẩm (SKU)

SET IDENTITY_INSERT dbo.SanPhamChiTiet ON;

-- ===================== GUCCI =====================
-- SP1: Áo Polo Gucci Cotton
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(1, 1, 1, 1, 15000000, 8000000, 20, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1645054205/658077_XJDIJ_1082_001_100_0000_Light.jpg'),
(2, 1, 2, 1, 15000000, 8000000, 25, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1645054205/658077_XJDIJ_1082_001_100_0000_Light.jpg'),
(3, 1, 3, 2, 15000000, 8000000, 15, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1685372400/745249_XJF4M_9037_001_100_0000_Light.jpg'),
(4, 1, 4, 2, 15000000, 8000000, 10, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1685372400/745249_XJF4M_9037_001_100_0000_Light.jpg');

-- SP2: Áo Thun Gucci Print
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(5, 2, 1, 1, 12000000, 6000000, 20, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1684162800/548334_XJDAF_1082_001_100_0000_Light.jpg'),
(6, 2, 2, 1, 12000000, 6000000, 25, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1684162800/548334_XJDAF_1082_001_100_0000_Light.jpg'),
(7, 2, 3, 2, 12000000, 6000000, 10, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1684162800/548334_XJDAF_9088_001_100_0000_Light.jpg'),
(8, 2, 4, 2, 12000000, 6000000, 5, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1684162800/548334_XJDAF_9088_001_100_0000_Light.jpg');

-- SP3: Quần Gucci Trackpant
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(9, 3, 1, 1, 18000000, 9000000, 10, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1690218000/751555_XJF23_1082_001_100_0000_Light.jpg'),
(10, 3, 2, 1, 18000000, 9000000, 12, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1690218000/751555_XJF23_1082_001_100_0000_Light.jpg'),
(11, 3, 3, 1, 18000000, 9000000, 8, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1690218000/751555_XJF23_1082_001_100_0000_Light.jpg'),
(12, 3, 4, 1, 18000000, 9000000, 5, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1690218000/751555_XJF23_1082_001_100_0000_Light.jpg');

-- SP4: Áo Khoác Gucci GG
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(13, 4, 1, 3, 35000000, 20000000, 6, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1633453207/658077_XJDIJ_2184_001_100_0000_Light.jpg'),
(14, 4, 2, 3, 35000000, 20000000, 5, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1633453207/658077_XJDIJ_2184_001_100_0000_Light.jpg'),
(15, 4, 3, 3, 35000000, 20000000, 4, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1633453207/658077_XJDIJ_2184_001_100_0000_Light.jpg'),
(16, 4, 4, 3, 35000000, 20000000, 3, 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1633453207/658077_XJDIJ_2184_001_100_0000_Light.jpg');

-- ===================== CHANEL =====================
-- SP5: Áo Polo Chanel Logo
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(17, 5, 1, 1, 11000000, 6000000, 20, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1676402323907-23p-p74656-k10703-94305-black-8817332994078.jpg'),
(18, 5, 2, 1, 11000000, 6000000, 20, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1676402323907-23p-p74656-k10703-94305-black-8817332994078.jpg'),
(19, 5, 3, 2, 11000000, 6000000, 12, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1676402323907-23p-p74656-k10703-10601-white-8817333026846.jpg'),
(20, 5, 4, 2, 11000000, 6000000, 8, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1676402323907-23p-p74656-k10703-10601-white-8817333026846.jpg');

-- SP6: T-Shirt Chanel Classic
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(21, 6, 1, 1, 10000000, 5000000, 15, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1708596821111-24p-p76388-k10924-94305-black-8847388110878.jpg'),
(22, 6, 2, 1, 10000000, 5000000, 20, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1708596821111-24p-p76388-k10924-94305-black-8847388110878.jpg'),
(23, 6, 3, 2, 10000000, 5000000, 10, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1708596821111-24p-p76388-k10924-10601-white-8847388143646.jpg'),
(24, 6, 4, 2, 10000000, 5000000, 7, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1708596821111-24p-p76388-k10924-10601-white-8847388143646.jpg');

-- SP7: Quần Chanel Pants
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(25, 7, 1, 1, 15000000, 8000000, 12, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg'),
(26, 7, 2, 1, 15000000, 8000000, 10, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg'),
(27, 7, 3, 1, 15000000, 8000000, 8, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg'),
(28, 7, 4, 1, 15000000, 8000000, 5, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg');

-- SP8: Áo Khoác Chanel Jacket
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(29, 8, 1, 1, 20000000, 12000000, 8, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg'),
(30, 8, 2, 1, 20000000, 12000000, 7, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-black-8835089629214.jpg'),
(31, 8, 3, 2, 20000000, 12000000, 5, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-white-8835089661982.jpg'),
(32, 8, 4, 2, 20000000, 12000000, 4, 'https://www.chanel.com/images/q_auto,f_auto,fl_lossy,dpr_auto/w_1920/FSH-1692093605823-23k-p75711-v67492-94305-white-8835089661982.jpg');

-- ===================== MLB =====================
-- SP9: Áo Polo MLB Monogram
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(33, 9, 1, 1, 3500000, 1800000, 20, 'https://product.hstatic.net/1000284478/product/3ampr014n-50bks-ao-polo-mlb-monogram-overfit-new-york-yankees-1_0a5e8a7e8a3c424b9c3c8a7e8a3c424b_grande.jpg'),
(34, 9, 2, 1, 3500000, 1800000, 22, 'https://product.hstatic.net/1000284478/product/3ampr014n-50bks-ao-polo-mlb-monogram-overfit-new-york-yankees-1_0a5e8a7e8a3c424b9c3c8a7e8a3c424b_grande.jpg'),
(35, 9, 3, 3, 3500000, 1800000, 15, 'https://product.hstatic.net/1000284478/product/3ampr014n-43bgs-ao-polo-mlb-monogram-overfit-new-york-yankees-1_grande.jpg'),
(36, 9, 4, 3, 3500000, 1800000, 10, 'https://product.hstatic.net/1000284478/product/3ampr014n-43bgs-ao-polo-mlb-monogram-overfit-new-york-yankees-1_grande.jpg');

-- SP10: T-Shirt MLB BigLogo
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(37, 10, 1, 1, 2500000, 1300000, 30, 'https://product.hstatic.net/1000284478/product/3atsm0233-50bks-ao-thun-mlb-classic-monogram-big-logo-new-york-yankees-1_grande.jpg'),
(38, 10, 2, 1, 2500000, 1300000, 25, 'https://product.hstatic.net/1000284478/product/3atsm0233-50bks-ao-thun-mlb-classic-monogram-big-logo-new-york-yankees-1_grande.jpg'),
(39, 10, 3, 2, 2500000, 1300000, 20, 'https://product.hstatic.net/1000284478/product/3atsm0233-50whs-ao-thun-mlb-classic-monogram-big-logo-new-york-yankees-1_grande.jpg'),
(40, 10, 4, 2, 2500000, 1300000, 15, 'https://product.hstatic.net/1000284478/product/3atsm0233-50whs-ao-thun-mlb-classic-monogram-big-logo-new-york-yankees-1_grande.jpg');

-- SP11: Quần MLB Sport
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(41, 11, 1, 4, 2900000, 1500000, 12, 'https://product.hstatic.net/1000284478/product/3fptg0134-07nys-quan-jogger-mlb-classic-sports-logo-la-dodgers-1_grande.jpg'),
(42, 11, 2, 4, 2900000, 1500000, 10, 'https://product.hstatic.net/1000284478/product/3fptg0134-07nys-quan-jogger-mlb-classic-sports-logo-la-dodgers-1_grande.jpg'),
(43, 11, 3, 4, 2900000, 1500000, 8, 'https://product.hstatic.net/1000284478/product/3fptg0134-07nys-quan-jogger-mlb-classic-sports-logo-la-dodgers-1_grande.jpg'),
(44, 11, 4, 4, 2900000, 1500000, 5, 'https://product.hstatic.net/1000284478/product/3fptg0134-07nys-quan-jogger-mlb-classic-sports-logo-la-dodgers-1_grande.jpg');

-- SP12: Áo Khoác MLB Varsity
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe) VALUES
(45, 12, 1, 1, 4500000, 2500000, 10, 'https://product.hstatic.net/1000284478/product/3ajpv0634-50bkl-ao-khoac-mlb-wool-basic-varsity-new-york-yankees-1_grande.jpg'),
(46, 12, 2, 1, 4500000, 2500000, 8, 'https://product.hstatic.net/1000284478/product/3ajpv0634-50bkl-ao-khoac-mlb-wool-basic-varsity-new-york-yankees-1_grande.jpg'),
(47, 12, 3, 1, 4500000, 2500000, 6, 'https://product.hstatic.net/1000284478/product/3ajpv0634-50bkl-ao-khoac-mlb-wool-basic-varsity-new-york-yankees-1_grande.jpg'),
(48, 12, 4, 1, 4500000, 2500000, 5, 'https://product.hstatic.net/1000284478/product/3ajpv0634-50bkl-ao-khoac-mlb-wool-basic-varsity-new-york-yankees-1_grande.jpg');
SET IDENTITY_INSERT dbo.SanPhamChiTiet OFF;
GO

-- 4. Chèn dữ liệu nghiệp vụ (Logic)
-- 4.1. ADMIN (MaTK=1) đăng bài
SET IDENTITY_INSERT dbo.BaiViet ON;
INSERT INTO BaiViet (MaBV, MaLoaiBV, MaTK, TieuDe, NoiDung, HinhAnh, TrangThai, Slug) VALUES
(1, 1, 1, N'Bộ sưu tập Thu-Đông 2025 từ Gucci', N'Gucci vừa cho ra mắt bộ sưu tập Thu-Đông 2025, kết hợp giữa di sản cổ điển và cảm hứng đương đại. Các thiết kế nổi bật với chất liệu cao cấp và họa tiết monogram đặc trưng.', 'https://media.gucci.com/content/DiaryArticleSingle_Standard_1600x1600/1695222013/DiaryArticleSingle_gucci-ancora-fashion-show-2023-01_001_Default.jpg', 1, 'bo-suu-tap-thu-dong-2025-tu-gucci');
SET IDENTITY_INSERT dbo.BaiViet OFF;
GO

-- 4.2. NHÂN VIÊN (MaTK=2) nhập kho
SET IDENTITY_INSERT dbo.PhieuNhap ON;
INSERT INTO PhieuNhap (MaPN, MaNV, MaNCC, TongTien, GhiChu) VALUES
(1, 2, 1, 80000000.00, N'Nhập 10 áo Polo Gucci Cotton size M, màu trắng');
SET IDENTITY_INSERT dbo.PhieuNhap OFF;
GO

INSERT INTO NhapKhoChiTiet (MaPN, MaBienThe, SoLuong, DonGiaNhap, ThanhTien) VALUES
(1, 3, 10, 8000000.00, 80000000.00); -- Nhập 10 áo Polo Gucci Cotton M Trắng (MaBienThe=3)
GO

-- GHI CHÚ QUAN TRỌNG: Logic cập nhật SoLuongTon và GiaNhap trong SanPhamChiTiet
-- sẽ được xử lý trong Spring Boot Service, KHÔNG dùng Trigger.
-- Câu lệnh UPDATE dưới đây chỉ để GIẢ LẬP logic đó cho dữ liệu mẫu:
UPDATE SanPhamChiTiet
SET SoLuongTon = SoLuongTon + 10
WHERE MaBienThe = 3;
GO

-- 4.3. KHÁCH HÀNG (MaTK=3)
-- 4.3.1. Địa chỉ của khách
SET IDENTITY_INSERT dbo.SoDiaChi ON;
INSERT INTO SoDiaChi (MaDiaChi, MaTK, HoTenNguoiNhan, SoDienThoai, DiaChiChiTiet, LaMacDinh) VALUES
(1, 3, N'Lê Văn Khách', '0900000003', N'789 Đường Khách Hàng, P.1, Q.Tân Bình, TP.HCM', 1);
SET IDENTITY_INSERT dbo.SoDiaChi OFF;
GO

-- 4.3.2. Giỏ hàng của khách
SET IDENTITY_INSERT dbo.GioHang ON;
INSERT INTO GioHang (MaGioHang, MaTK) VALUES
(1, 3);
SET IDENTITY_INSERT dbo.GioHang OFF;
GO

INSERT INTO GioHangChiTiet (MaGioHang, MaBienThe, SoLuong) VALUES
(1, 1, 2); -- Khách có 2 cái Áo Polo Gucci Cotton S Đen (MaBienThe=1) trong giỏ
GO

-- 4.3.3. Khách đăng ký gói VIP
INSERT INTO DangKyThanhVien (MaTK, MaGoi, NgayBatDau, NgayKetThuc, TrangThai) VALUES
(3, 1, GETDATE(), DATEADD(day, 365, GETDATE()), 1);
GO

-- 4.3.4. Khách chat với CSKH
SET IDENTITY_INSERT dbo.PhongChat ON;
INSERT INTO PhongChat (MaPhong, MaTK, MaNV, TrangThai) VALUES
(1, 3, 2, 1); -- Phòng chat của Khách (3), đang được NV (2) hỗ trợ
SET IDENTITY_INSERT dbo.PhongChat OFF;
GO

INSERT INTO TinNhan (MaPhong, MaNguoiGui, LoaiNguoiGui, LoaiTinNhan, NoiDung) VALUES
(1, 3, 0, 0, N'Chào shop, tôi cần tư vấn về áo Polo'); -- 0=Khách, 0=Text
GO

-- 4.3.5. Đơn hàng cũ (ĐÃ GIAO) của khách
SET IDENTITY_INSERT dbo.DonHang ON;
INSERT INTO DonHang (MaDH, MaTK, NgayDat, TongTien, PhiShip, MaDiaChiGiao, MaHinhThucTT, TrangThaiDH, TrangThaiThanhToan, NgayThanhToan, NgayCapNhat) VALUES
(1, 3, GETDATE() - 7, 35030000.00, 30000.00, 1, 1, -- MaDiaChiGiao=1, MaHinhThucTT=1 (COD)
 4, -- TrangThaiDH = 4 (Đã giao)
 1, -- TrangThaiThanhToan = 1 (Đã thanh toán)
 GETDATE() - 6, -- NgayThanhToan
 GETDATE() - 6);
SET IDENTITY_INSERT dbo.DonHang OFF;
GO

-- 4.3.6. Chi tiết đơn hàng cũ
SET IDENTITY_INSERT dbo.DonHangCT ON;
INSERT INTO DonHangCT (MaCT, MaDH, MaBienThe, SoLuong, DonGia) VALUES
(1, 1, 13, 1, 35000000.00); -- Đã mua 1 Áo Khoác Gucci GG (MaBienThe=13)
SET IDENTITY_INSERT dbo.DonHangCT OFF;
GO

-- 4.3.7. Lịch sử đơn hàng cũ
INSERT INTO LichSuDonHang (MaDH, TrangThaiCu, TrangThaiMoi, GhiChu, NguoiCapNhat) VALUES
(1, 0, 1, N'Nhân viên xác nhận đơn', N'Nguyễn Thị Bán Hàng'),
(1, 1, 2, N'Đang chuẩn bị hàng', N'Nguyễn Thị Bán Hàng'),
(1, 2, 3, N'Bàn giao cho đơn vị vận chuyển', N'Hệ thống'),
(1, 3, 4, N'Giao hàng thành công', N'Hệ thống');
GO

-- 4.3.8. Khách đánh giá đơn hàng cũ
SET IDENTITY_INSERT dbo.DanhGia ON;
INSERT INTO DanhGia (MaDG, MaCT, MaTK, NoiDung, Diem) VALUES
(1, 1, 3, N'Áo khoác rất đẹp, hàng chuẩn auth, giao nhanh.', 5); -- Đánh giá cho MaCT=1 (Áo Khoác Gucci)
SET IDENTITY_INSERT dbo.DanhGia OFF;
GO

PRINT N'PHẦN 3: CHÈN DỮ LIỆU MẪU THÀNH CÔNG!';
GO

-- PHẦN 4: KIỂM TRA DỮ LIỆU
PRINT N'========================================';
PRINT N'PHẦN 4: KIỂM TRA DỮ LIỆU';
PRINT N'========================================';
GO

-- 1. Tổng quan số lượng
SELECT (SELECT COUNT(*) FROM TaiKhoan) AS TongTaiKhoan,
       (SELECT COUNT(*) FROM SanPham) AS TongSanPham,
       (SELECT COUNT(*) FROM SanPhamChiTiet) AS TongBienThe,
       (SELECT COUNT(*) FROM DonHang) AS TongDonHang;
GO

-- 2. Kiểm tra sản phẩm có TrangThaiSP = 1 (đang bán)
SELECT MaSP, TenSP, GioiTinh, TrangThaiSP, MaTH, MaLoai
FROM SanPham
WHERE TrangThaiSP = 1;
GO

-- 3. Kiểm tra biến thể của một sản phẩm cụ thể (ví dụ MaSP = 1)
SELECT spct.MaBienThe, sp.TenSP, s.TenSize, m.TenMau, spct.GiaBan, spct.SoLuongTon
FROM SanPhamChiTiet spct
INNER JOIN SanPham sp ON spct.MaSP = sp.MaSP
LEFT JOIN SizeSP s ON spct.MaSize = s.MaSize
LEFT JOIN MauSacSP m ON spct.MaMau = m.MaMau
WHERE spct.MaSP = 1
ORDER BY spct.MaBienThe;
GO

-- 4. Kiểm tra đơn hàng và chi tiết đơn hàng
SELECT dh.MaDH, tk.HoTen, dh.TongTien, dh.TrangThaiDH, httt.TenHinhThuc
FROM DonHang dh
LEFT JOIN TaiKhoan tk ON dh.MaTK = tk.MaTK
LEFT JOIN HinhThucThanhToan httt ON dh.MaHinhThucTT = httt.MaHinhThucTT;

SELECT ct.MaDH, sp.TenSP, s.TenSize, m.TenMau, ct.SoLuong, ct.DonGia
FROM DonHangCT ct
JOIN SanPhamChiTiet spct ON ct.MaBienThe = spct.MaBienThe
JOIN SanPham sp ON spct.MaSP = sp.MaSP
LEFT JOIN SizeSP s ON spct.MaSize = s.MaSize
LEFT JOIN MauSacSP m ON spct.MaMau = m.MaMau
WHERE ct.MaDH = 1;
GO

-- 5. Kiểm tra giỏ hàng của khách hàng
SELECT tk.HoTen, sp.TenSP, s.TenSize, m.TenMau, ghct.SoLuong
FROM GioHangChiTiet ghct
JOIN GioHang gh ON ghct.MaGioHang = gh.MaGioHang
JOIN TaiKhoan tk ON gh.MaTK = tk.MaTK
JOIN SanPhamChiTiet spct ON ghct.MaBienThe = spct.MaBienThe
JOIN SanPham sp ON spct.MaSP = sp.MaSP
LEFT JOIN SizeSP s ON spct.MaSize = s.MaSize
LEFT JOIN MauSacSP m ON spct.MaMau = m.MaMau
WHERE tk.MaTK = 3;
GO
