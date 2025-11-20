package com.luxuryfashion.controller;

import com.luxuryfashion.dto.*;
import com.luxuryfashion.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
@Slf4j
public class SanPhamController {

    private final SanPhamService sanPhamService;

    /**
     * GET /api/products/ping
     * Kiểm tra trạng thái server
     */
    @GetMapping("/ping")
    public String ping() {
        log.info("Ping sản phẩm OK");
        return "OK";
    }

    /**
     * GET /api/products
     * Lấy tất cả sản phẩm (có thể lọc)
     */
    @GetMapping
    public ResponseEntity<ApiResponse<List<SanPhamDTO>>> getAllProducts(
            @RequestParam(required = false) Integer gioiTinh,
            @RequestParam(required = false) Integer maTH,
            @RequestParam(required = false) Integer maLoai,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String keyword
    ) {
        log.info("[GET /api/products] params gioiTinh={}, maTH={}, maLoai={}, minPrice={}, maxPrice={}, keyword={}", gioiTinh, maTH, maLoai, minPrice, maxPrice, keyword);
        List<SanPhamDTO> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            // Tìm kiếm theo từ khóa
            products = sanPhamService.searchProducts(keyword);
            log.info("Search trả về {} sản phẩm", products.size());
        } else if (gioiTinh != null || maTH != null || maLoai != null || minPrice != null || maxPrice != null) {
            // Lọc theo điều kiện
            products = sanPhamService.filterProducts(gioiTinh, maTH, maLoai, minPrice, maxPrice);
            log.info("Filter trả về {} sản phẩm", products.size());
        } else {
            // Lấy tất cả
            products = sanPhamService.getAllProducts();
            log.info("All trả về {} sản phẩm", products.size());
        }
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy danh sách sản phẩm thành công", products));
    }

    /**
     * GET /api/products/gender/{gioiTinh}
     * Lấy sản phẩm theo giới tính (0=Nam, 1=Nữ, 2=Unisex)
     */
    @GetMapping("/gender/{gioiTinh}")
    public ResponseEntity<ApiResponse<List<SanPhamDTO>>> getProductsByGender(@PathVariable Integer gioiTinh) {
        log.info("[GET /api/products/gender/{}]", gioiTinh);
        List<SanPhamDTO> products = sanPhamService.getProductsByGender(gioiTinh);
        log.info("Gender {} trả về {} sản phẩm", gioiTinh, products.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy sản phẩm thành công", products));
    }

    /**
     * GET /api/products/brand/{maTH}
     * Lấy sản phẩm theo thương hiệu
     */
    @GetMapping("/brand/{maTH}")
    public ResponseEntity<ApiResponse<List<SanPhamDTO>>> getProductsByBrand(@PathVariable Integer maTH) {
        log.info("[GET /api/products/brand/{}]", maTH);
        List<SanPhamDTO> products = sanPhamService.getProductsByBrand(maTH);
        log.info("Brand {} trả về {} sản phẩm", maTH, products.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy sản phẩm thành công", products));
    }

    /**
     * GET /api/products/category/{maLoai}
     * Lấy sản phẩm theo loại
     */
    @GetMapping("/category/{maLoai}")
    public ResponseEntity<ApiResponse<List<SanPhamDTO>>> getProductsByCategory(@PathVariable Integer maLoai) {
        log.info("[GET /api/products/category/{}]", maLoai);
        List<SanPhamDTO> products = sanPhamService.getProductsByCategory(maLoai);
        log.info("Category {} trả về {} sản phẩm", maLoai, products.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy sản phẩm thành công", products));
    }

    /**
     * GET /api/products/{maSP}
     * Lấy chi tiết sản phẩm
     */
    @GetMapping("/{maSP}")
    public ResponseEntity<ApiResponse<SanPhamDTO>> getProductDetail(@PathVariable Integer maSP) {
        log.info("[GET /api/products/{}] chi tiết", maSP);
        SanPhamDTO product = sanPhamService.getProductDetail(maSP);
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy chi tiết sản phẩm thành công", product));
    }

    /**
     * GET /api/products/brands
     * Lấy tất cả thương hiệu
     */
    @GetMapping("/brands")
    public ResponseEntity<ApiResponse<List<ThuongHieuDTO>>> getAllBrands() {
        log.info("[GET /api/products/brands]");
        List<ThuongHieuDTO> brands = sanPhamService.getAllBrands();
        log.info("Brands trả về {}", brands.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy danh sách thương hiệu thành công", brands));
    }

    /**
     * GET /api/products/categories
     * Lấy tất cả loại sản phẩm
     */
    @GetMapping("/categories")
    public ResponseEntity<ApiResponse<List<LoaiSanPhamDTO>>> getAllCategories() {
        log.info("[GET /api/products/categories]");
        List<LoaiSanPhamDTO> categories = sanPhamService.getAllCategories();
        log.info("Categories trả về {}", categories.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy danh sách loại sản phẩm thành công", categories));
    }

    /**
     * GET /api/products/debug
     * Kiểm tra kết nối và thống kê số lượng sản phẩm, thương hiệu, loại sản phẩm
     */
    @GetMapping("/debug")
    public ResponseEntity<ApiResponse<Object>> debugCounts() {
        int totalProducts = sanPhamService.getAllProducts().size();
        int totalBrands = sanPhamService.getAllBrands().size();
        int totalCategories = sanPhamService.getAllCategories().size();
        log.info("[DEBUG] totalProducts={}, totalBrands={}, totalCategories={}", totalProducts, totalBrands, totalCategories);
        return ResponseEntity.ok(new ApiResponse<>(true, "Debug thống kê", java.util.Map.of(
                "totalProducts", totalProducts,
                "totalBrands", totalBrands,
                "totalCategories", totalCategories
        )));
    }
}
