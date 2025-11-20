package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "PhongChat")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PhongChat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaPhong")
    private Integer maPhong;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", unique = true, nullable = false)
    private TaiKhoan taiKhoan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNV")
    private TaiKhoan nhanVien;

    @Column(name = "TrangThai")
    private Integer trangThai = 0;

    @Column(name = "NgayTao")
    private LocalDateTime ngayTao;

    @PrePersist
    protected void onCreate() {
        ngayTao = LocalDateTime.now();
    }
}

