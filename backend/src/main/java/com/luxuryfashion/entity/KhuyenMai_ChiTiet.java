package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "KhuyenMai_ChiTiet")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KhuyenMai_ChiTiet {

    @EmbeddedId
    private KhuyenMaiChiTietId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("maKM")
    @JoinColumn(name = "MaKM")
    private KhuyenMai khuyenMai;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("maSP")
    @JoinColumn(name = "MaSP")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("maBienThe")
    @JoinColumn(name = "MaBienThe")
    private SanPhamChiTiet sanPhamChiTiet;
}
