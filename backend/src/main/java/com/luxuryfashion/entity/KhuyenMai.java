package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "KhuyenMai")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KhuyenMai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaKM")
    private Integer maKM;

    @Column(name = "TenKM", nullable = false, length = 100)
    private String tenKM;

    @Column(name = "MaCode", unique = true, nullable = false, length = 50)
    private String maCode;

    @Column(name = "LoaiKM", length = 50)
    private String loaiKM;

    @Column(name = "LoaiGiaTri")
    private Integer loaiGiaTri = 0;

    @Column(name = "GiaTri", precision = 18, scale = 2)
    private BigDecimal giaTri;

    @Column(name = "NgayBatDau", nullable = false)
    private LocalDateTime ngayBatDau;

    @Column(name = "NgayKetThuc")
    private LocalDateTime ngayKetThuc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaGoi")
    private GoiThanhVien goiThanhVien;

    @Column(name = "TrangThai")
    private Boolean trangThai = true;

    @Column(name = "SoLanSuDung")
    private Integer soLanSuDung = 0;
}

