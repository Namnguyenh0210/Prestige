package com.luxuryfashion.entity;

import lombok.*;

import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaiKhoanRoleId implements Serializable {
    private Long taiKhoan;
    private Long role;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaiKhoanRoleId that = (TaiKhoanRoleId) o;
        return Objects.equals(taiKhoan, that.taiKhoan) &&
               Objects.equals(role, that.role);
    }

    @Override
    public int hashCode() {
        return Objects.hash(taiKhoan, role);
    }
}

