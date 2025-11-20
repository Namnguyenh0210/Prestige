package com.luxuryfashion.dto;

import lombok.*;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SanPhamChiTietDTO {
    private Integer maBienThe;
    private Integer maSP;
    private Integer maSize;
    private String tenSize;
    private Integer maMau;
    private String tenMau;
    private String maHex;
    private BigDecimal giaBan;
    private BigDecimal giaNhap;
    private Integer soLuongTon;
    private String anhBienThe;
}

