package com.luxuryfashion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoaiSanPhamDTO {
    private Integer maLoai;
    private String tenLoai;
    private String moTa;
}

