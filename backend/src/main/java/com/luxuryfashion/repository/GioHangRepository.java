package com.luxuryfashion.repository;

import com.luxuryfashion.entity.GioHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Integer> {
    Optional<GioHang> findByTaiKhoan_Id(Long taiKhoanId);
}

