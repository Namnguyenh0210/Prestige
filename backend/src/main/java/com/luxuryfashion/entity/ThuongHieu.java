package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "ThuongHieu")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ThuongHieu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTH")
    private Integer maTH;

    @Column(name = "TenTH", nullable = false)
    private String tenTH;

    @Column(name = "MoTa")
    private String moTa;
}

