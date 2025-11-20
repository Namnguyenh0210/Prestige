package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "GoiThanhVien")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GoiThanhVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaGoi")
    private Integer maGoi;

    @Column(name = "TenGoi", length = 100)
    private String tenGoi;

    @Column(name = "Gia", precision = 18, scale = 2)
    private BigDecimal gia;

    @Column(name = "ThoiHan")
    private Integer thoiHan; // Số ngày

    @Column(name = "UuDai", length = 255)
    private String uuDai;
}

