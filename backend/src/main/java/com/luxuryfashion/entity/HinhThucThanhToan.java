package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "HinhThucThanhToan")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HinhThucThanhToan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaHinhThucTT")
    private Integer maHinhThucTT;

    @Column(name = "TenHinhThuc", unique = true, nullable = false, length = 100)
    private String tenHinhThuc;

    @Column(name = "MoTa", length = 255)
    private String moTa;

    @Column(name = "TrangThai")
    private Boolean trangThai = true;
}

