package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "taikhoan_role")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@IdClass(TaiKhoanRoleId.class)
public class TaiKhoan_Role {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "taikhoan_id")
    private TaiKhoan taiKhoan;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id")
    private Role role;
}

