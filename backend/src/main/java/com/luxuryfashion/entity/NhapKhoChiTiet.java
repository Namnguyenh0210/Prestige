package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "NhapKhoChiTiet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NhapKhoChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaNK_CT")
    private Integer maNKCT;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaPN", nullable = false)
    private PhieuNhap phieuNhap;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaBienThe", nullable = false)
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "DonGiaNhap", precision = 18, scale = 2)
    private BigDecimal donGiaNhap;

    @Column(name = "ThanhTien", precision = 18, scale = 2)
    private BigDecimal thanhTien;
}

