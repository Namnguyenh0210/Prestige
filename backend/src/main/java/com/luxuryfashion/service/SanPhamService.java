package com.luxuryfashion.service;

import com.luxuryfashion.dto.*;
import com.luxuryfashion.entity.*;
import com.luxuryfashion.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SanPhamService {

    private final SanPhamRepository sanPhamRepository;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    private final ThuongHieuRepository thuongHieuRepository;
    private final LoaiSanPhamRepository loaiSanPhamRepository;
    private final SizeSPRepository sizeSPRepository;
    private final MauSacSPRepository mauSacSPRepository;

    /**
     * Lấy tất cả sản phẩm đang bán
     */
    public List<SanPhamDTO> getAllProducts() {
        List<SanPham> products = sanPhamRepository.findByTrangThaiSP(1);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Lấy sản phẩm theo giới tính (bao gồm cả Unisex)
     * @param gioiTinh 0=Nam, 1=Nữ, 2=Unisex
     */
    public List<SanPhamDTO> getProductsByGender(Integer gioiTinh) {
        List<SanPham> products = sanPhamRepository.findByGenderIncludeUnisex(gioiTinh);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Lấy sản phẩm theo thương hiệu
     */
    public List<SanPhamDTO> getProductsByBrand(Integer maTH) {
        List<SanPham> products = sanPhamRepository.findByThuongHieu_MaTHAndTrangThaiSP(maTH, 1);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Lấy sản phẩm theo loại
     */
    public List<SanPhamDTO> getProductsByCategory(Integer maLoai) {
        List<SanPham> products = sanPhamRepository.findByLoaiSanPham_MaLoaiAndTrangThaiSP(maLoai, 1);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Tìm kiếm sản phẩm
     */
    public List<SanPhamDTO> searchProducts(String keyword) {
        List<SanPham> products = sanPhamRepository.searchByName(keyword);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Lọc sản phẩm với nhiều điều kiện
     */
    public List<SanPhamDTO> filterProducts(Integer gioiTinh, Integer maTH, Integer maLoai,
                                           BigDecimal minPrice, BigDecimal maxPrice) {
        Specification<SanPham> spec = Specification.where(null);
        // Lọc theo trạng thái đang bán
        spec = spec.and((root, query, cb) -> cb.equal(root.get("trangThaiSP"), 1));

        // Lọc theo giới tính
        if (gioiTinh != null) {
            spec = spec.and((root, query, cb) -> cb.or(
                    cb.equal(root.get("gioiTinh"), gioiTinh),
                    cb.equal(root.get("gioiTinh"), 2) // luôn bao gồm Unisex
            ));
        }

        // Lọc theo thương hiệu
        if (maTH != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("thuongHieu").get("maTH"), maTH));
        }

        // Lọc theo loại
        if (maLoai != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("loaiSanPham").get("maLoai"), maLoai));
        }

        List<SanPham> products = sanPhamRepository.findAll(spec);
        List<SanPhamDTO> productDTOs = products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        // Lọc theo giá (sau khi chuyển sang DTO vì giá nằm trong biến thể)
        if (minPrice != null || maxPrice != null) {
            productDTOs = productDTOs.stream()
                    .filter(dto -> {
                        if (minPrice != null && dto.getGiaMin().compareTo(minPrice) < 0) {
                            return false;
                        }
                        if (maxPrice != null && dto.getGiaMin().compareTo(maxPrice) > 0) {
                            return false;
                        }
                        return true;
                    })
                    .collect(Collectors.toList());
        }

        return productDTOs;
    }

    /**
     * Lấy chi tiết sản phẩm
     */
    public SanPhamDTO getProductDetail(Integer maSP) {
        SanPham product = sanPhamRepository.findById(maSP)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm"));
        return convertToDTO(product);
    }

    /**
     * Lấy tất cả thương hiệu
     */
    public List<ThuongHieuDTO> getAllBrands() {
        return thuongHieuRepository.findAll().stream()
                .map(this::convertBrandToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Lấy tất cả loại sản phẩm
     */
    public List<LoaiSanPhamDTO> getAllCategories() {
        return loaiSanPhamRepository.findAll().stream()
                .map(this::convertCategoryToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Convert Entity sang DTO
     */
    private SanPhamDTO convertToDTO(SanPham sanPham) {
        List<SanPhamChiTiet> chiTietList = sanPhamChiTietRepository.findBySanPham_MaSP(sanPham.getMaSP());

        // Tính giá min/max từ các biến thể
        BigDecimal giaMin = chiTietList.stream()
                .map(SanPhamChiTiet::getGiaBan)
                .min(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);

        BigDecimal giaMax = chiTietList.stream()
                .map(SanPhamChiTiet::getGiaBan)
                .max(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);

        return SanPhamDTO.builder()
                .maSP(sanPham.getMaSP())
                .tenSP(sanPham.getTenSP())
                .moTa(sanPham.getMoTa())
                .anhChinh(sanPham.getAnhChinh())
                .gioiTinh(sanPham.getGioiTinh())
                .trangThaiSP(sanPham.getTrangThaiSP())
                .ngayTao(sanPham.getNgayTao())
                .ngayCapNhat(sanPham.getNgayCapNhat())
                .maTH(sanPham.getThuongHieu() != null ? sanPham.getThuongHieu().getMaTH() : null)
                .tenTH(sanPham.getThuongHieu() != null ? sanPham.getThuongHieu().getTenTH() : null)
                .maLoai(sanPham.getLoaiSanPham() != null ? sanPham.getLoaiSanPham().getMaLoai() : null)
                .tenLoai(sanPham.getLoaiSanPham() != null ? sanPham.getLoaiSanPham().getTenLoai() : null)
                .giaMin(giaMin)
                .giaMax(giaMax)
                .chiTietList(chiTietList.stream()
                        .map(this::convertChiTietToDTO)
                        .collect(Collectors.toList()))
                .build();
    }

    private SanPhamChiTietDTO convertChiTietToDTO(SanPhamChiTiet chiTiet) {
        return SanPhamChiTietDTO.builder()
                .maBienThe(chiTiet.getMaBienThe())
                .maSP(chiTiet.getSanPham().getMaSP())
                .maSize(chiTiet.getSizeSP() != null ? chiTiet.getSizeSP().getMaSize() : null)
                .tenSize(chiTiet.getSizeSP() != null ? chiTiet.getSizeSP().getTenSize() : null)
                .maMau(chiTiet.getMauSacSP() != null ? chiTiet.getMauSacSP().getMaMau() : null)
                .tenMau(chiTiet.getMauSacSP() != null ? chiTiet.getMauSacSP().getTenMau() : null)
                .maHex(chiTiet.getMauSacSP() != null ? chiTiet.getMauSacSP().getMaHex() : null)
                .giaBan(chiTiet.getGiaBan())
                .giaNhap(chiTiet.getGiaNhap())
                .soLuongTon(chiTiet.getSoLuongTon())
                .anhBienThe(chiTiet.getAnhBienThe())
                .build();
    }

    private ThuongHieuDTO convertBrandToDTO(ThuongHieu thuongHieu) {
        return ThuongHieuDTO.builder()
                .maTH(thuongHieu.getMaTH())
                .tenTH(thuongHieu.getTenTH())
                .moTa(thuongHieu.getMoTa())
                .build();
    }

    private LoaiSanPhamDTO convertCategoryToDTO(LoaiSanPham loaiSanPham) {
        return LoaiSanPhamDTO.builder()
                .maLoai(loaiSanPham.getMaLoai())
                .tenLoai(loaiSanPham.getTenLoai())
                .moTa(loaiSanPham.getMoTa())
                .build();
    }
}
