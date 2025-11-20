package com.luxuryfashion.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class CheckoutRequest {
    @NotNull
    private Integer maDiaChiGiao; // Đơn giản: dùng địa chỉ đã có

    @NotNull
    private Integer maHinhThucTT; // COD / VNPay
}

