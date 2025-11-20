package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "DonHang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDH")
    private Integer maDH;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK")
    private TaiKhoan taiKhoan;

    @Column(name = "NgayDat")
    private LocalDateTime ngayDat;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @Column(name = "PhiShip", precision = 18, scale = 2)
    private BigDecimal phiShip;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKM")
    private KhuyenMai khuyenMai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaDiaChiGiao")
    private SoDiaChi soDiaChi;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaHinhThucTT")
    private HinhThucThanhToan hinhThucThanhToan;

    @Column(name = "GhiChu", length = 500)
    private String ghiChu;

    @Column(name = "TrangThaiDH", nullable = false)
    private Integer trangThaiDH = 0;

    @Column(name = "TrangThaiThanhToan", nullable = false)
    private Integer trangThaiThanhToan = 0;

    @Column(name = "NgayThanhToan")
    private LocalDateTime ngayThanhToan;

    @Column(name = "NgayCapNhat")
    private LocalDateTime ngayCapNhat;

    @OneToMany(mappedBy = "donHang", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DonHangCT> chiTietDonHang;

    @OneToMany(mappedBy = "donHang", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<LichSuDonHang> lichSuDonHang;

    @PrePersist
    protected void onCreate() {
        ngayDat = LocalDateTime.now();
        ngayCapNhat = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        ngayCapNhat = LocalDateTime.now();
    }
}

