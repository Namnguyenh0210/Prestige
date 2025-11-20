package com.luxuryfashion.repository;

import com.luxuryfashion.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Integer> {

    // Tìm tất cả biến thể của một sản phẩm
    List<SanPhamChiTiet> findBySanPham_MaSP(Integer maSP);
}

