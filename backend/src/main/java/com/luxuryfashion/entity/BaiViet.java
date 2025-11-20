package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "BaiViet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BaiViet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBV")
    private Integer maBV;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiBV")
    private LoaiBaiViet loaiBaiViet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK")
    private TaiKhoan taiKhoan;

    @Column(name = "TieuDe", length = 255)
    private String tieuDe;

    @Column(name = "NoiDung", columnDefinition = "NVARCHAR(MAX)")
    private String noiDung;

    @Column(name = "HinhAnh", length = 255)
    private String hinhAnh;

    @Column(name = "LuotXem")
    private Integer luotXem = 0;

    @Column(name = "TrangThai")
    private Boolean trangThai = true;

    @Column(name = "Slug", unique = true, length = 255)
    private String slug;

    @Column(name = "NgayDang")
    private LocalDateTime ngayDang;

    @PrePersist
    protected void onCreate() {
        ngayDang = LocalDateTime.now();
    }
}

