package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "SoDiaChi")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SoDiaChi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDiaChi")
    private Integer maDiaChi;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", nullable = false)
    private TaiKhoan taiKhoan;

    @Column(name = "HoTenNguoiNhan", nullable = false, length = 100)
    private String hoTenNguoiNhan;

    @Column(name = "SoDienThoai", nullable = false, length = 20)
    private String soDienThoai;

    @Column(name = "DiaChiChiTiet", nullable = false, length = 500)
    private String diaChiChiTiet;

    @Column(name = "LaMacDinh")
    private Boolean laMacDinh = false;
}

