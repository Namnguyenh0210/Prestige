package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "LichSuDonHang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LichSuDonHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLichSu")
    private Integer maLichSu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaDH", nullable = false)
    private DonHang donHang;

    @Column(name = "TrangThaiCu", nullable = false)
    private Integer trangThaiCu;

    @Column(name = "TrangThaiMoi", nullable = false)
    private Integer trangThaiMoi;

    @Column(name = "ThoiGian")
    private LocalDateTime thoiGian;

    @Column(name = "GhiChu", length = 255)
    private String ghiChu;

    @Column(name = "NguoiCapNhat", length = 50)
    private String nguoiCapNhat;

    @PrePersist
    protected void onCreate() {
        thoiGian = LocalDateTime.now();
    }
}

