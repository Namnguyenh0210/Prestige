package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Role")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaRole")
    private Long id;

    @Column(name = "TenRole", unique = true, nullable = false)
    private String name; // VD: "ADMIN", "USER", "NHANVIEN", "KHACHHANG"
}
