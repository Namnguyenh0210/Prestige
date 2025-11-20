package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "BinhLuan")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BinhLuan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBL")
    private Integer maBL;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaBV")
    private BaiViet baiViet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", nullable = false)
    private TaiKhoan taiKhoan;

    @Column(name = "NoiDung", nullable = false, length = 500)
    private String noiDung;

    @Column(name = "NgayBinhLuan")
    private LocalDateTime ngayBinhLuan;

    @Column(name = "AnDanh")
    private Boolean anDanh = false;

    @Column(name = "TrangThai")
    private Boolean trangThai = true;

    @Column(name = "SoLuongLike")
    private Integer soLuongLike = 0;

    @Column(name = "SoLuongPhanHoi")
    private Integer soLuongPhanHoi = 0;

    @PrePersist
    protected void onCreate() {
        ngayBinhLuan = LocalDateTime.now();
    }
}

