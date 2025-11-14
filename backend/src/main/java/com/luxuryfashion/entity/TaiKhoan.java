package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "TaiKhoan")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaiKhoan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTK")
    private Long id;

    @Column(name = "Email", unique = true, nullable = false, length = 100)
    private String email;

    @Column(name = "MatKhau", nullable = false, length = 255)
    private String password;

    @Column(name = "HoTen", nullable = false, length = 100)
    private String fullName;

    @Column(name = "SoDienThoai", length = 20)
    private String phone;

    @Column(name = "DiaChi", length = 255)
    private String address;

    @Column(name = "Avatar", length = 255)
    private String avatar;

    @Column(name = "TrangThai", nullable = false)
    private boolean enabled = true;

    @Column(name = "LastLogin")
    private LocalDateTime lastLogin;

    @Column(name = "NgayTao")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "NgayCapNhat")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "TaiKhoan_Role",
            joinColumns = @JoinColumn(name = "MaTK"),
            inverseJoinColumns = @JoinColumn(name = "MaRole")
    )
    private Set<Role> roles;
}
