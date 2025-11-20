package com.luxuryfashion.dto;

import lombok.Builder;
import lombok.Data;
import java.math.BigDecimal;

@Data
@Builder
public class CartItemDTO {
    private Integer maBienThe;
    private Integer maSP;
    private String tenSP;
    private String tenSize;
    private String tenMau;
    private BigDecimal giaBan;
    private Integer soLuong;
    private String anhBienThe;
}

