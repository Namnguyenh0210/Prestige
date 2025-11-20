package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "SanPhamChiTiet",
    uniqueConstraints = @UniqueConstraint(name = "UK_SanPham_Variant", columnNames = {"MaSP", "MaSize", "MaMau"})
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SanPhamChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBienThe")
    private Integer maBienThe;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", nullable = false)
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSize")
    private SizeSP sizeSP;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaMau")
    private MauSacSP mauSacSP;

    @Column(name = "GiaBan", nullable = false, precision = 18, scale = 2)
    private BigDecimal giaBan;

    @Column(name = "GiaNhap", precision = 18, scale = 2)
    private BigDecimal giaNhap = BigDecimal.ZERO;

    @Column(name = "SoLuongTon")
    private Integer soLuongTon = 0;

    @Column(name = "AnhBienThe")
    private String anhBienThe;
}

