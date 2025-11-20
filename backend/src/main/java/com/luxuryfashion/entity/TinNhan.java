package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "TinNhan")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TinNhan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTinNhan")
    private Long maTinNhan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaPhong", nullable = false)
    private PhongChat phongChat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNguoiGui", nullable = false)
    private TaiKhoan nguoiGui;

    @Column(name = "LoaiNguoiGui")
    private Integer loaiNguoiGui = 0;

    @Column(name = "LoaiTinNhan")
    private Integer loaiTinNhan = 0;

    @Column(name = "NoiDung", columnDefinition = "NVARCHAR(MAX)")
    private String noiDung;

    @Column(name = "ThoiGianGui")
    private LocalDateTime thoiGianGui;

    @Column(name = "DaDoc")
    private Boolean daDoc = false;

    @PrePersist
    protected void onCreate() {
        thoiGianGui = LocalDateTime.now();
    }
}

