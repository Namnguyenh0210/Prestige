package com.luxuryfashion.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AddToCartRequest {
    @NotNull
    private Integer maBienThe;

    @Min(1)
    private Integer soLuong = 1;
}

