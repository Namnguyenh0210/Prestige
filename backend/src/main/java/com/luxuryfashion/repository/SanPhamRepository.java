package com.luxuryfashion.repository;

import com.luxuryfashion.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer>, JpaSpecificationExecutor<SanPham> {

    // Tìm sản phẩm theo giới tính (chỉ đúng giới tính)
    List<SanPham> findByGioiTinhAndTrangThaiSP(Integer gioiTinh, Integer trangThaiSP);

    // Tìm sản phẩm theo thương hiệu
    List<SanPham> findByThuongHieu_MaTHAndTrangThaiSP(Integer maTH, Integer trangThaiSP);

    // Tìm sản phẩm theo loại
    List<SanPham> findByLoaiSanPham_MaLoaiAndTrangThaiSP(Integer maLoai, Integer trangThaiSP);

    // Tìm tất cả sản phẩm đang bán
    List<SanPham> findByTrangThaiSP(Integer trangThaiSP);

    // Tìm kiếm theo tên
    @Query("SELECT sp FROM SanPham sp WHERE sp.tenSP LIKE %:keyword% AND sp.trangThaiSP = 1")
    List<SanPham> searchByName(@Param("keyword") String keyword);

    // Lấy sản phẩm theo giới tính, bao gồm cả Unisex (gioiTinh = 2)
    @Query("SELECT sp FROM SanPham sp WHERE (sp.gioiTinh = :gioiTinh OR sp.gioiTinh = 2) AND sp.trangThaiSP = 1")
    List<SanPham> findByGenderIncludeUnisex(@Param("gioiTinh") Integer gioiTinh);
}
