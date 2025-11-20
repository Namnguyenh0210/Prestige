package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "GioHang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GioHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaGioHang")
    private Integer maGioHang;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", unique = true, nullable = false)
    private TaiKhoan taiKhoan;
}

