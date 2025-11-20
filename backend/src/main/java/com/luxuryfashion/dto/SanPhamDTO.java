package com.luxuryfashion.dto;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SanPhamDTO {
    private Integer maSP;
    private String tenSP;
    private String moTa;
    private String anhChinh;
    private Integer gioiTinh; // 0=Nam, 1=Nữ, 2=Unisex
    private Integer trangThaiSP;
    private LocalDateTime ngayTao;
    private LocalDateTime ngayCapNhat;

    // Thông tin thương hiệu và loại
    private Integer maTH;
    private String tenTH;
    private Integer maLoai;
    private String tenLoai;

    // Giá sản phẩm (từ biến thể rẻ nhất)
    private BigDecimal giaMin;
    private BigDecimal giaMax;

    // Danh sách biến thể
    private List<SanPhamChiTietDTO> chiTietList;
}

