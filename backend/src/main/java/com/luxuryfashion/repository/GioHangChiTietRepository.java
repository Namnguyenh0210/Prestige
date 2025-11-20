package com.luxuryfashion.repository;

import com.luxuryfashion.entity.GioHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, Integer> {
    List<GioHangChiTiet> findByGioHang_MaGioHang(Integer maGioHang);
    Optional<GioHangChiTiet> findByGioHang_MaGioHangAndSanPhamChiTiet_MaBienThe(Integer maGioHang, Integer maBienThe);
}

