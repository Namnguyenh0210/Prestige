package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "TaiKhoan_Role")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@IdClass(TaiKhoanRoleId.class)
public class TaiKhoan_Role {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK")
    private TaiKhoan taiKhoan;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaRole")
    private Role role;
}
