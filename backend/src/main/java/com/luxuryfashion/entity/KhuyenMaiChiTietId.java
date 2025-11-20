package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class KhuyenMaiChiTietId implements Serializable {

    @Column(name = "MaKM")
    private Integer maKM;

    @Column(name = "MaSP")
    private Integer maSP;

    @Column(name = "MaBienThe")
    private Integer maBienThe;
}
