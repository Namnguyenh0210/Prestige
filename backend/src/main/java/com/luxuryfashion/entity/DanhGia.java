package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "DanhGia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DanhGia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDG")
    private Integer maDG;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCT", unique = true, nullable = false)
    private DonHangCT donHangCT;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", nullable = false)
    private TaiKhoan taiKhoan;

    @Column(name = "NoiDung", length = 500)
    private String noiDung;

    @Column(name = "Diem", nullable = false)
    private Integer diem;

    @Column(name = "HinhAnh", length = 255)
    private String hinhAnh;

    @Column(name = "NgayDanhGia")
    private LocalDateTime ngayDanhGia;

    @Column(name = "SoLuongLike")
    private Integer soLuongLike = 0;

    @Column(name = "SoLuongPhanHoi")
    private Integer soLuongPhanHoi = 0;

    @PrePersist
    protected void onCreate() {
        ngayDanhGia = LocalDateTime.now();
    }
}

