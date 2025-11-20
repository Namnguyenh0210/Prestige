package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "GioHangChiTiet",
    uniqueConstraints = @UniqueConstraint(name = "UK_GioHang_BienThe", columnNames = {"MaGioHang", "MaBienThe"})
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GioHangChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaGH_CT")
    private Integer maGHCT;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaGioHang", nullable = false)
    private GioHang gioHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaBienThe", nullable = false)
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "SoLuong")
    private Integer soLuong = 1;

    @Column(name = "NgayThem")
    private LocalDateTime ngayThem;

    @PrePersist
    protected void onCreate() {
        ngayThem = LocalDateTime.now();
    }
}

