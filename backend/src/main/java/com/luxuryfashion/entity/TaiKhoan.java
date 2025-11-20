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
    private Long id; // Khớp với JpaRepository<TaiKhoan, Long>

    @Column(name = "Email", unique = true, nullable = false, length = 100)
    private String email;

    @Column(name = "MatKhau", nullable = false, length = 255)
    private String password; // Khớp với builder.password() & getPassword()

    @Column(name = "HoTen", nullable = false, length = 100)
    private String fullName; // Khớp với builder.fullName() & getFullName()

    @Column(name = "SoDienThoai", length = 20)
    private String phone;

    @Column(name = "DiaChi", length = 255)
    private String address;

    @Column(name = "Avatar", length = 255)
    private String avatar;

    @Builder.Default
    @Column(name = "TrangThai", nullable = false)
    private boolean enabled = true; // Khớp với builder.enabled(true) & getEnabled()

    @Column(name = "LastLogin")
    private LocalDateTime lastLogin;

    @Builder.Default
    @Column(name = "NgayTao")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Builder.Default
    @Column(name = "NgayCapNhat")
    private LocalDateTime updatedAt = LocalDateTime.now();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "TaiKhoan_Role",
            joinColumns = @JoinColumn(name = "MaTK"),
            inverseJoinColumns = @JoinColumn(name = "MaRole")
    )
    private Set<Role> roles;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = createdAt;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
