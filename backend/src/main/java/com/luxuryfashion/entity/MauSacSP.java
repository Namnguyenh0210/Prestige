package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "MauSacSP")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MauSacSP {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaMau")
    private Integer maMau;

    @Column(name = "TenMau", unique = true, nullable = false)
    private String tenMau;

    @Column(name = "MaHex", length = 7)
    private String maHex;
}

