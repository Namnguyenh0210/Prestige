/*
================================================================================
 KỊCH BẢN TẠO CƠ SỞ DỮ LIỆU LUXURY FASHION (BẢN PRODUCTION 2025)
 HỆ QUẢN TRỊ: SQL SERVER
 MÔ TẢ: Đã bỏ Trigger, logic sẽ được xử lý trong Spring Boot Service.
================================================================================
*/

-- TẠO CƠ SỞ DỮ LIỆU (Chạy một lần)
IF
NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'LuxuryFashion_2025')
BEGIN
    CREATE
DATABASE LuxuryFashion_2025;
END;
GO

USE LuxuryFashion_2025;
GO

/*
================================================================================
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
    MaTK        INT IDENTITY(1,1) PRIMARY KEY,
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
    MaRole  INT IDENTITY(1,1) PRIMARY KEY,
    TenRole VARCHAR(50) UNIQUE NOT NULL
);

-- Bảng: TaiKhoan_Role (Nối Tài Khoản - Quyền)
CREATE TABLE TaiKhoan_Role
(
    MaTK   INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaRole INT NOT NULL FOREIGN KEY REFERENCES Role(MaRole),
    PRIMARY KEY (MaTK, MaRole)
);

-- Bảng: SoDiaChi
CREATE TABLE SoDiaChi
(
    MaDiaChi       INT IDENTITY(1,1) PRIMARY KEY,
    MaTK           INT         NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    HoTenNguoiNhan NVARCHAR(100) NOT NULL,
    SoDienThoai    VARCHAR(20) NOT NULL,
    DiaChiChiTiet  NVARCHAR(500) NOT NULL,
    LaMacDinh      BIT DEFAULT 0
);

-- Bảng: ThuongHieu
CREATE TABLE ThuongHieu
(
    MaTH  INT IDENTITY(1,1) PRIMARY KEY,
    TenTH NVARCHAR(100) NOT NULL,
    MoTa  NVARCHAR(255)
);

-- Bảng: LoaiSanPham
CREATE TABLE LoaiSanPham
(
    MaLoai  INT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL,
    MoTa    NVARCHAR(255)
);

-- Bảng: SizeSP
CREATE TABLE SizeSP
(
    MaSize  INT IDENTITY(1,1) PRIMARY KEY,
    TenSize NVARCHAR(20) UNIQUE NOT NULL
);

-- Bảng: MauSacSP
CREATE TABLE MauSacSP
(
    MaMau  INT IDENTITY(1,1) PRIMARY KEY,
    TenMau NVARCHAR(50) UNIQUE NOT NULL,
    MaHex  VARCHAR(7)
);

-- Bảng: SanPham
CREATE TABLE SanPham
(
    MaSP        INT IDENTITY(1,1) PRIMARY KEY,
    TenSP       NVARCHAR(255) NOT NULL,
    MaLoai      INT FOREIGN KEY REFERENCES LoaiSanPham(MaLoai) ON DELETE SET NULL,
    MaTH        INT FOREIGN KEY REFERENCES ThuongHieu(MaTH) ON DELETE SET NULL,
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
    MaBienThe  INT IDENTITY(1,1) PRIMARY KEY,
    MaSP       INT            NOT NULL FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
    MaSize     INT FOREIGN KEY REFERENCES SizeSP(MaSize),
    MaMau      INT FOREIGN KEY REFERENCES MauSacSP(MaMau),
    GiaBan     DECIMAL(18, 2) NOT NULL,
    GiaNhap    DECIMAL(18, 2) DEFAULT 0,
    SoLuongTon INT            DEFAULT 0,
    AnhBienThe NVARCHAR(255),
    CONSTRAINT UK_SanPham_Variant UNIQUE (MaSP, MaSize, MaMau)
);

-- Bảng: HinhAnhSP
CREATE TABLE HinhAnhSP
(
    MaAnh    INT IDENTITY(1,1) PRIMARY KEY,
    MaSP     INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE,
    DuongDan NVARCHAR(255)
);

-- Bảng: GoiThanhVien
CREATE TABLE GoiThanhVien
(
    MaGoi   INT IDENTITY(1,1) PRIMARY KEY,
    TenGoi  NVARCHAR(100),
    Gia     DECIMAL(18, 2),
    ThoiHan INT, -- Số ngày
    UuDai   NVARCHAR(255)
);

-- Bảng: KhuyenMai
CREATE TABLE KhuyenMai
(
    MaKM        INT IDENTITY(1,1) PRIMARY KEY,
    TenKM       NVARCHAR(100) NOT NULL,
    MaCode      VARCHAR(50) UNIQUE NOT NULL,
    LoaiKM      VARCHAR(50),
    LoaiGiaTri  INT DEFAULT 0, -- 0: %, 1: VND
    GiaTri      DECIMAL(18, 2),
    NgayBatDau  DATETIME           NOT NULL,
    NgayKetThuc DATETIME,
    MaGoi       INT FOREIGN KEY REFERENCES GoiThanhVien(MaGoi),
    TrangThai   BIT DEFAULT 1,
    SoLanSuDung INT DEFAULT 0
);

-- Bảng: KhuyenMai_ChiTiet (Nối Khuyến Mãi - Sản phẩm/Biến thể)
CREATE TABLE KhuyenMai_ChiTiet
(
    MaKM      INT NOT NULL FOREIGN KEY REFERENCES KhuyenMai(MaKM),
    MaSP      INT FOREIGN KEY REFERENCES SanPham(MaSP),
    MaBienThe INT FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    CONSTRAINT UK_KhuyenMai_ChiTiet UNIQUE (MaKM, MaSP, MaBienThe)
);

-- Bảng: HinhThucThanhToan
CREATE TABLE HinhThucThanhToan
(
    MaHinhThucTT INT IDENTITY(1,1) PRIMARY KEY,
    TenHinhThuc  NVARCHAR(100) UNIQUE NOT NULL,
    MoTa         NVARCHAR(255),
    TrangThai    BIT DEFAULT 1
);

-- Bảng: DonHang
CREATE TABLE DonHang
(
    MaDH               INT IDENTITY(1,1) PRIMARY KEY,
    MaTK               INT FOREIGN KEY REFERENCES TaiKhoan(MaTK) ON DELETE SET NULL,
    NgayDat            DATETIME       DEFAULT GETDATE(),
    TongTien           DECIMAL(18, 2) DEFAULT 0,
    PhiShip            DECIMAL(18, 2) DEFAULT 0,
    MaKM               INT FOREIGN KEY REFERENCES KhuyenMai(MaKM),
    MaDiaChiGiao       INT FOREIGN KEY REFERENCES SoDiaChi(MaDiaChi),
    MaHinhThucTT       INT FOREIGN KEY REFERENCES HinhThucThanhToan(MaHinhThucTT),
    GhiChu             NVARCHAR(500),
    TrangThaiDH        INT NOT NULL   DEFAULT 0, -- 0: Chờ xác nhận, 1: Đang giao...
    TrangThaiThanhToan INT NOT NULL   DEFAULT 0, -- 0=Chờ,1=Đã TT,2=Lỗi,3=Hoàn tiền
    NgayThanhToan      DATETIME NULL,
    NgayCapNhat        DATETIME       DEFAULT GETDATE()
);

-- Bảng: DonHangCT (Chi tiết đơn hàng)
CREATE TABLE DonHangCT
(
    MaCT      INT IDENTITY(1,1) PRIMARY KEY,
    MaDH      INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDH) ON DELETE CASCADE,
    MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong   INT,
    DonGia    DECIMAL(18, 2)
);

-- Bảng: LichSuDonHang (Audit Trail - Rất "xịn")
CREATE TABLE LichSuDonHang
(
    MaLichSu     INT IDENTITY(1,1) PRIMARY KEY,
    MaDH         INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDH) ON DELETE CASCADE,
    TrangThaiCu  INT NOT NULL,
    TrangThaiMoi INT NOT NULL,
    ThoiGian     DATETIME DEFAULT GETDATE(),
    GhiChu       NVARCHAR(255),
    NguoiCapNhat NVARCHAR(50) -- Tên Admin/Nhân viên
);

-- Bảng: DanhGia
CREATE TABLE DanhGia
(
    MaDG           INT IDENTITY(1,1) PRIMARY KEY,
    MaCT           INT UNIQUE NOT NULL FOREIGN KEY REFERENCES DonHangCT(MaCT), -- Chỉ review SP đã mua
    MaTK           INT        NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
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
    MaLoaiBV  INT IDENTITY(1,1) PRIMARY KEY,
    TenLoaiBV NVARCHAR(100)
);

-- Bảng: BaiViet
CREATE TABLE BaiViet
(
    MaBV      INT IDENTITY(1,1) PRIMARY KEY,
    MaLoaiBV  INT FOREIGN KEY REFERENCES LoaiBaiViet(MaLoaiBV),
    MaTK      INT FOREIGN KEY REFERENCES TaiKhoan(MaTK),
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
    MaBL           INT IDENTITY(1,1) PRIMARY KEY,
    MaSP           INT FOREIGN KEY REFERENCES SanPham(MaSP),
    MaBV           INT FOREIGN KEY REFERENCES BaiViet(MaBV),
    MaTK           INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
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
    MaGioHang INT IDENTITY(1,1) PRIMARY KEY,
    MaTK      INT UNIQUE NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK)
);

-- Bảng: GioHangChiTiet
CREATE TABLE GioHangChiTiet
(
    MaGH_CT   INT IDENTITY(1,1) PRIMARY KEY,
    MaGioHang INT NOT NULL FOREIGN KEY REFERENCES GioHang(MaGioHang),
    MaBienThe INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong   INT      DEFAULT 1,
    NgayThem  DATETIME DEFAULT GETDATE(),
    CONSTRAINT UK_GioHang_BienThe UNIQUE (MaGioHang, MaBienThe)
);

-- Bảng: NhaCungCap
CREATE TABLE NhaCungCap
(
    MaNCC       INT IDENTITY(1,1) PRIMARY KEY,
    TenNCC      NVARCHAR(100),
    SoDienThoai VARCHAR(20),
    DiaChi      NVARCHAR(255)
);

-- Bảng: PhieuNhap
CREATE TABLE PhieuNhap
(
    MaPN     INT IDENTITY(1,1) PRIMARY KEY,
    MaNV     INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK), -- Mã Nhân viên
    MaNCC    INT FOREIGN KEY REFERENCES NhaCungCap(MaNCC),
    NgayNhap DATETIME       DEFAULT GETDATE(),
    TongTien DECIMAL(18, 2) DEFAULT 0,
    GhiChu   NVARCHAR(500)
);

-- Bảng: NhapKhoChiTiet
CREATE TABLE NhapKhoChiTiet
(
    MaNK_CT    INT IDENTITY(1,1) PRIMARY KEY,
    MaPN       INT NOT NULL FOREIGN KEY REFERENCES PhieuNhap(MaPN) ON DELETE CASCADE,
    MaBienThe  INT NOT NULL FOREIGN KEY REFERENCES SanPhamChiTiet(MaBienThe),
    SoLuong    INT,
    DonGiaNhap DECIMAL(18, 2),
    ThanhTien  DECIMAL(18, 2)
);

-- Bảng: DangKyThanhVien
CREATE TABLE DangKyThanhVien
(
    MaDK        INT IDENTITY(1,1) PRIMARY KEY,
    MaTK        INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaGoi       INT NOT NULL FOREIGN KEY REFERENCES GoiThanhVien(MaGoi),
    NgayBatDau  DATETIME DEFAULT GETDATE(),
    NgayKetThuc DATETIME,
    TrangThai   INT      DEFAULT 1
);

-- Bảng: PhongChat
CREATE TABLE PhongChat
(
    MaPhong   INT IDENTITY(1,1) PRIMARY KEY,
    MaTK      INT UNIQUE NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    MaNV      INT FOREIGN KEY REFERENCES TaiKhoan(MaTK),
    TrangThai INT      DEFAULT 0,
    NgayTao   DATETIME DEFAULT GETDATE()
);

-- Bảng: TinNhan
CREATE TABLE TinNhan
(
    MaTinNhan    BIGINT IDENTITY(1,1) PRIMARY KEY,
    MaPhong      INT NOT NULL FOREIGN KEY REFERENCES PhongChat(MaPhong) ON DELETE CASCADE,
    MaNguoiGui   INT NOT NULL FOREIGN KEY REFERENCES TaiKhoan(MaTK),
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
INSERT INTO Role (MaRole, TenRole)
VALUES (1, 'ADMIN'),
       (2, 'NHANVIEN'),
       (3, 'KHACHHANG');
SET
IDENTITY_INSERT dbo.Role OFF;
GO

SET IDENTITY_INSERT dbo.TaiKhoan ON;
INSERT INTO TaiKhoan (MaTK, HoTen, Email, MatKhau, SoDienThoai, DiaChi, TrangThai)
VALUES (1, N'Admin Luxury', 'admin@luxury.com', '$2a$10$E.Gf.Y..VL/q/gAm18QQvOMkU.HHQthaqHBAP.26wG.Y.OMT2nLGu',
        '0900000001', N'123 Đường Admin, Q1, TP.HCM', 1), -- Mật khẩu là 123 (đã bcrypt)
       (2, N'Nguyễn Thị Bán Hàng', 'nhanvien@luxury.com',
        '$2a$10$E.Gf.Y..VL/q/gAm18QQvOMkU.HHQthaqHBAP.26wG.Y.OMT2nLGu', '0900000002',
        N'456 Đường Nhân Viên, Q3, TP.HCM', 1),
       (3, N'Lê Văn Khách', 'khachhang@luxury.com', '$2a$10$E.Gf.Y..VL/q/gAm18QQvOMkU.HHQthaqHBAP.26wG.Y.OMT2nLGu',
        '0900000003', N'789 Đường Khách Hàng, Q.Tân Bình, TP.HCM', 1);
SET
IDENTITY_INSERT dbo.TaiKhoan OFF;
GO

INSERT INTO TaiKhoan_Role (MaTK, MaRole) VALUES
(1, 1), -- Admin Luxury là ADMIN
(2, 2), -- Nguyễn Thị Bán Hàng là NHANVIEN
(3, 3); -- Lê Văn Khách là KHACHHANG
GO

SET IDENTITY_INSERT dbo.ThuongHieu ON;
INSERT INTO ThuongHieu (MaTH, TenTH, MoTa)
VALUES (1, N'Gucci', N'Thương hiệu thời trang cao cấp của Ý'),
       (2, N'Chanel', N'Thương hiệu thời trang cao cấp của Pháp');
SET
IDENTITY_INSERT dbo.ThuongHieu OFF;
GO

SET IDENTITY_INSERT dbo.LoaiSanPham ON;
INSERT INTO LoaiSanPham (MaLoai, TenLoai, MoTa)
VALUES (1, N'Áo Polo', N'Các loại áo polo nam/nữ'),
       (2, N'Túi xách', N'Túi xách và phụ kiện');
SET
IDENTITY_INSERT dbo.LoaiSanPham OFF;
GO

SET IDENTITY_INSERT dbo.SizeSP ON;
INSERT INTO SizeSP (MaSize, TenSize)
VALUES (1, N'S'),
       (2, N'M'),
       (3, N'L');
SET
IDENTITY_INSERT dbo.SizeSP OFF;
GO

SET IDENTITY_INSERT dbo.MauSacSP ON;
INSERT INTO MauSacSP (MaMau, TenMau, MaHex)
VALUES (1, N'Đen', '#000000'),
       (2, N'Trắng', '#FFFFFF');
SET
IDENTITY_INSERT dbo.MauSacSP OFF;
GO

SET IDENTITY_INSERT dbo.HinhThucThanhToan ON;
INSERT INTO HinhThucThanhToan (MaHinhThucTT, TenHinhThuc, MoTa, TrangThai)
VALUES (1, N'Thanh toán khi nhận hàng (COD)', N'Trả tiền mặt khi shipper giao hàng', 1),
       (2, N'Thanh toán qua VNPay', N'Quét mã QR qua cổng VNPay', 1);
SET
IDENTITY_INSERT dbo.HinhThucThanhToan OFF;
GO

SET IDENTITY_INSERT dbo.NhaCungCap ON;
INSERT INTO NhaCungCap (MaNCC, TenNCC, SoDienThoai, DiaChi)
VALUES (1, N'Nhà phân phối Gucci VN', '02811112222', N'10 Nguyễn Trãi, Q1, TP.HCM');
SET
IDENTITY_INSERT dbo.NhaCungCap OFF;
GO

SET IDENTITY_INSERT dbo.GoiThanhVien ON;
INSERT INTO GoiThanhVien (MaGoi, TenGoi, Gia, ThoiHan, UuDai)
VALUES (1, N'VIP Gold', 5000000, 365, N'Giảm 10% mọi đơn hàng');
SET
IDENTITY_INSERT dbo.GoiThanhVien OFF;
GO

SET IDENTITY_INSERT dbo.LoaiBaiViet ON;
INSERT INTO LoaiBaiViet (MaLoaiBV, TenLoaiBV)
VALUES (1, N'Xu hướng thời trang');
SET
IDENTITY_INSERT dbo.LoaiBaiViet OFF;
GO

SET IDENTITY_INSERT dbo.KhuyenMai ON;
INSERT INTO KhuyenMai (MaKM, TenKM, MaCode, LoaiKM, LoaiGiaTri, GiaTri, NgayBatDau, NgayKetThuc, TrangThai)
VALUES (1, N'Giảm giá 10% toàn cửa hàng', 'HE2025', N'Toàn cửa hàng', 0, 10.00, GETDATE() - 1, GETDATE() + 30, 1);
SET
IDENTITY_INSERT dbo.KhuyenMai OFF;
GO

-- 2. Chèn Sản Phẩm (Phụ thuộc các bảng trên)

SET IDENTITY_INSERT dbo.SanPham ON;
INSERT INTO SanPham (MaSP, TenSP, MaLoai, MaTH, MoTa, AnhChinh, GioiTinh, TrangThaiSP)
VALUES (1, N'Áo Polo Gucci Cotton', 1, 1, N'Áo polo nam chất liệu cotton cao cấp', '/images/polo-gucci.jpg', 0,
        1), -- 0 = Nam
       (2, N'Túi Chanel 19 Flap Bag', 2, 2, N'Túi xách Chanel 19 da cừu', '/images/chanel-19.jpg', 2, 1); -- 2 = Unisex
SET
IDENTITY_INSERT dbo.SanPham OFF;
GO

-- 3. Chèn Biến Thể Sản Phẩm (SKU)

SET IDENTITY_INSERT dbo.SanPhamChiTiet ON;
INSERT INTO SanPhamChiTiet (MaBienThe, MaSP, MaSize, MaMau, GiaBan, GiaNhap, SoLuongTon, AnhBienThe)
VALUES (1, 1, 1, 1, 15000000, 8000000, 50, '/images/polo-gucci-s-den.jpg'),   -- Áo Polo S, Đen
       (2, 1, 2, 1, 15000000, 8000000, 50, '/images/polo-gucci-m-den.jpg'),   -- Áo Polo M, Đen
       (3, 1, 2, 2, 15000000, 8000000, 30, '/images/polo-gucci-m-trang.jpg'), -- Áo Polo M, Trắng
       (4, 2, NULL, 1, 120000000, 70000000, 10, '/images/chanel-19-den.jpg'); -- Túi Chanel (ko size), Đen
SET
IDENTITY_INSERT dbo.SanPhamChiTiet OFF;
GO

-- 4. Chèn dữ liệu nghiệp vụ (Logic)

-- 4.1. ADMIN (MaTK=1) đăng bài
SET IDENTITY_INSERT dbo.BaiViet ON;
INSERT INTO BaiViet (MaBV, MaLoaiBV, MaTK, TieuDe, NoiDung, TrangThai, Slug)
VALUES (1, 1, 1, N'Bộ sưu tập Thu-Đông 2025', N'Nội dung chi tiết...', 1, 'bo-suu-tap-thu-dong-2025');
SET
IDENTITY_INSERT dbo.BaiViet OFF;
GO

-- 4.2. NHÂN VIÊN (MaTK=2) nhập kho
SET IDENTITY_INSERT dbo.PhieuNhap ON;
INSERT INTO PhieuNhap (MaPN, MaNV, MaNCC, TongTien, GhiChu)
VALUES (1, 2, 1, 800000000.00, N'Nhập 100 áo Polo M Trắng');
SET
IDENTITY_INSERT dbo.PhieuNhap OFF;
GO

INSERT INTO NhapKhoChiTiet (MaPN, MaBienThe, SoLuong, DonGiaNhap, ThanhTien) VALUES
(1, 3, 100, 8000000.00, 800000000.00); -- Nhập 100 áo Polo M Trắng (MaBienThe=3)
GO

-- **GHI CHÚ QUAN TRỌNG**: Logic cập nhật SoLuongTon và GiaNhap trong SanPhamChiTiet
-- sẽ được xử lý trong Spring Boot Service, KHÔNG dùng Trigger.
-- Câu lệnh UPDATE dưới đây chỉ để GIẢ LẬP logic đó cho dữ liệu mẫu:
UPDATE SanPhamChiTiet
SET SoLuongTon = SoLuongTon + 100,
    GiaNhap    = 8000000.00
WHERE MaBienThe = 3;
GO

-- 4.3. KHÁCH HÀNG (MaTK=3)
-- 4.3.1. Địa chỉ của khách
SET IDENTITY_INSERT dbo.SoDiaChi ON;
INSERT INTO SoDiaChi (MaDiaChi, MaTK, HoTenNguoiNhan, SoDienThoai, DiaChiChiTiet, LaMacDinh)
VALUES (1, 3, N'Lê Văn Khách', '0900000003', N'789 Đường Khách Hàng, P.1, Q.Tân Bình, TP.HCM', 1);
SET
IDENTITY_INSERT dbo.SoDiaChi OFF;
GO

-- 4.3.2. Giỏ hàng của khách
SET IDENTITY_INSERT dbo.GioHang ON;
INSERT INTO GioHang (MaGioHang, MaTK)
VALUES (1, 3);
SET
IDENTITY_INSERT dbo.GioHang OFF;
GO

INSERT INTO GioHangChiTiet (MaGioHang, MaBienThe, SoLuong) VALUES
(1, 1, 2); -- Khách có 2 cái Áo Polo S Đen (MaBienThe=1) trong giỏ
GO

-- 4.3.3. Khách đăng ký gói VIP
INSERT INTO DangKyThanhVien (MaTK, MaGoi, NgayBatDau, NgayKetThuc, TrangThai) VALUES
(3, 1, GETDATE(), DATEADD(day, 365, GETDATE()), 1);
GO

-- 4.3.4. Khách chat với CSKH
SET IDENTITY_INSERT dbo.PhongChat ON;
INSERT INTO PhongChat (MaPhong, MaTK, MaNV, TrangThai)
VALUES (1, 3, 2, 1); -- Phòng chat của Khách (3), đang được NV (2) hỗ trợ
SET
IDENTITY_INSERT dbo.PhongChat OFF;
GO

INSERT INTO TinNhan (MaPhong, MaNguoiGui, LoaiNguoiGui, LoaiTinNhan, NoiDung) VALUES
(1, 3, 0, 0, N'Chào shop, tôi cần tư vấn về áo Polo'); -- 0=Khách, 0=Text
GO

-- 4.3.5. Đơn hàng cũ (ĐÃ GIAO) của khách
SET IDENTITY_INSERT dbo.DonHang ON;
INSERT INTO DonHang (MaDH, MaTK, NgayDat, TongTien, PhiShip, MaDiaChiGiao, MaHinhThucTT, TrangThaiDH,
                     TrangThaiThanhToan, NgayThanhToan, NgayCapNhat)
VALUES (1, 3, GETDATE() - 7, 120000000.00, 30000.00, 1, 1, -- MaDiaChiGiao=1, MaHinhThucTT=1 (COD)
        3, -- TrangThaiDH = 3 (Đã giao)
        1, -- TrangThaiThanhToan = 1 (Đã thanh toán)
        GETDATE() - 6, -- NgayThanhToan
        GETDATE() - 6);
SET
IDENTITY_INSERT dbo.DonHang OFF;
GO

-- 4.3.6. Chi tiết đơn hàng cũ
SET IDENTITY_INSERT dbo.DonHangCT ON;
INSERT INTO DonHangCT (MaCT, MaDH, MaBienThe, SoLuong, DonGia)
VALUES (1, 1, 4, 1, 120000000.00); -- Đã mua 1 Túi Chanel Đen (MaBienThe=4)
SET
IDENTITY_INSERT dbo.DonHangCT OFF;
GO

-- 4.3.7. Lịch sử đơn hàng cũ
INSERT INTO LichSuDonHang (MaDH, TrangThaiCu, TrangThaiMoi, GhiChu, NguoiCapNhat) VALUES
(1, 0, 1, N'Nhân viên xác nhận đơn', N'Nguyễn Thị Bán Hàng'),
(1, 1, 2, N'Bàn giao cho đơn vị vận chuyển', N'Nguyễn Thị Bán Hàng'),
(1, 2, 3, N'Giao hàng thành công', N'Hệ thống');
GO

-- 4.3.8. Khách đánh giá đơn hàng cũ
SET IDENTITY_INSERT dbo.DanhGia ON;
INSERT INTO DanhGia (MaDG, MaCT, MaTK, NoiDung, Diem)
VALUES (1, 1, 3, N'Túi rất đẹp, hàng chuẩn auth, giao nhanh.', 5); -- Đánh giá cho MaCT=1 (Túi Chanel)
SET
IDENTITY_INSERT dbo.DanhGia OFF;
GO

PRINT N'PHẦN 3: CHÈN DỮ LIỆU MẪU THÀNH CÔNG!';
GO








-- 1. TaiKhoan
SELECT *
FROM TaiKhoan;

-- 2. Role
SELECT *
FROM Role;

-- 3. TaiKhoan_Role
SELECT *
FROM TaiKhoan_Role;

-- 4. SoDiaChi
SELECT *
FROM SoDiaChi;

-- 5. ThuongHieu
SELECT *
FROM ThuongHieu;

-- 6. LoaiSanPham
SELECT *
FROM LoaiSanPham;

-- 7. SizeSP
SELECT *
FROM SizeSP;

-- 8. MauSacSP
SELECT *
FROM MauSacSP;

-- 9. SanPham
SELECT *
FROM SanPham;

-- 10. SanPhamChiTiet
SELECT *
FROM SanPhamChiTiet;

-- 11. HinhAnhSP
SELECT *
FROM HinhAnhSP;

-- 12. GoiThanhVien
SELECT *
FROM GoiThanhVien;

-- 13. KhuyenMai
SELECT *
FROM KhuyenMai;

-- 14. KhuyenMai_ChiTiet
SELECT *
FROM KhuyenMai_ChiTiet;

-- 15. HinhThucThanhToan
SELECT *
FROM HinhThucThanhToan;

-- 16. DonHang
SELECT *
FROM DonHang;

-- 17. DonHangCT
SELECT *
FROM DonHangCT;

-- 18. LichSuDonHang
SELECT *
FROM LichSuDonHang;

-- 19. DanhGia
SELECT *
FROM DanhGia;

-- 20. LoaiBaiViet
SELECT *
FROM LoaiBaiViet;

-- 21. BaiViet
SELECT *
FROM BaiViet;

-- 22. BinhLuan
SELECT *
FROM BinhLuan;

-- 23. GioHang
SELECT *
FROM GioHang;

-- 24. GioHangChiTiet
SELECT *
FROM GioHangChiTiet;

-- 25. NhaCungCap
SELECT *
FROM NhaCungCap;

-- 26. PhieuNhap
SELECT *
FROM PhieuNhap;

-- 27. NhapKhoChiTiet
SELECT *
FROM NhapKhoChiTiet;

-- 28. DangKyThanhVien
SELECT *
FROM DangKyThanhVien;

-- 29. PhongChat
SELECT *
FROM PhongChat;

-- 30. TinNhan
SELECT *
FROM TinNhan;
