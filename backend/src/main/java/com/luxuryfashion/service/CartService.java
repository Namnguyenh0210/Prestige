package com.luxuryfashion.service;

import com.luxuryfashion.dto.AddToCartRequest;
import com.luxuryfashion.dto.CartItemDTO;
import com.luxuryfashion.dto.CheckoutRequest;
import com.luxuryfashion.entity.*;
import com.luxuryfashion.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.core.userdetails.UserDetails;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class CartService {

    private final GioHangRepository gioHangRepository;
    private final GioHangChiTietRepository gioHangChiTietRepository;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    private final TaiKhoanRepository taiKhoanRepository;
    private final DonHangRepository donHangRepository;
    private final DonHangCTRepository donHangCTRepository;

    private GioHang getOrCreateCart(Long userId) {
        return gioHangRepository.findByTaiKhoan_Id(userId).orElseGet(() -> {
            TaiKhoan tk = taiKhoanRepository.findById(userId)
                    .orElseThrow(() -> new RuntimeException("User không tồn tại"));
            GioHang cart = GioHang.builder().taiKhoan(tk).build();
            return gioHangRepository.save(cart);
        });
    }

    public List<CartItemDTO> getCart(UserDetails userDetails) {
        TaiKhoan tk = taiKhoanRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
        GioHang cart = getOrCreateCart(tk.getId());
        return gioHangChiTietRepository.findByGioHang_MaGioHang(cart.getMaGioHang())
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    public List<CartItemDTO> addToCart(UserDetails userDetails, AddToCartRequest request) {
        TaiKhoan tk = taiKhoanRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
        GioHang cart = getOrCreateCart(tk.getId());
        SanPhamChiTiet variant = sanPhamChiTietRepository.findById(request.getMaBienThe())
                .orElseThrow(() -> new RuntimeException("Biến thể không tồn tại"));
        GioHangChiTiet item = gioHangChiTietRepository
                .findByGioHang_MaGioHangAndSanPhamChiTiet_MaBienThe(cart.getMaGioHang(), request.getMaBienThe())
                .orElseGet(() -> GioHangChiTiet.builder()
                        .gioHang(cart)
                        .sanPhamChiTiet(variant)
                        .soLuong(0)
                        .build());
        item.setSoLuong(item.getSoLuong() + request.getSoLuong());
        gioHangChiTietRepository.save(item);
        return getCart(userDetails);
    }

    public List<CartItemDTO> updateQuantity(UserDetails userDetails, Integer maBienThe, Integer soLuong) {
        if (soLuong < 1) throw new RuntimeException("Số lượng phải >=1");
        TaiKhoan tk = taiKhoanRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
        GioHang cart = getOrCreateCart(tk.getId());
        GioHangChiTiet item = gioHangChiTietRepository
                .findByGioHang_MaGioHangAndSanPhamChiTiet_MaBienThe(cart.getMaGioHang(), maBienThe)
                .orElseThrow(() -> new RuntimeException("Sản phẩm không có trong giỏ"));
        item.setSoLuong(soLuong);
        gioHangChiTietRepository.save(item);
        return getCart(userDetails);
    }

    public List<CartItemDTO> removeItem(UserDetails userDetails, Integer maBienThe) {
        TaiKhoan tk = taiKhoanRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
        GioHang cart = getOrCreateCart(tk.getId());
        gioHangChiTietRepository.findByGioHang_MaGioHangAndSanPhamChiTiet_MaBienThe(cart.getMaGioHang(), maBienThe)
                .ifPresent(gioHangChiTietRepository::delete);
        return getCart(userDetails);
    }

    public Integer checkout(UserDetails userDetails, CheckoutRequest request) {
        TaiKhoan tk = taiKhoanRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
        GioHang cart = getOrCreateCart(tk.getId());
        List<GioHangChiTiet> cartItems = gioHangChiTietRepository.findByGioHang_MaGioHang(cart.getMaGioHang());
        if (cartItems.isEmpty()) throw new RuntimeException("Giỏ hàng trống");

        BigDecimal tongTien = cartItems.stream()
                .map(i -> i.getSanPhamChiTiet().getGiaBan().multiply(BigDecimal.valueOf(i.getSoLuong())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        DonHang order = DonHang.builder()
                .taiKhoan(tk)
                .tongTien(tongTien)
                .phiShip(BigDecimal.ZERO)
                .trangThaiDH(0)
                .trangThaiThanhToan(0)
                .build();
        DonHang saved = donHangRepository.save(order);

        cartItems.forEach(ci -> {
            DonHangCT ct = DonHangCT.builder()
                    .donHang(saved)
                    .sanPhamChiTiet(ci.getSanPhamChiTiet())
                    .soLuong(ci.getSoLuong())
                    .donGia(ci.getSanPhamChiTiet().getGiaBan())
                    .build();
            donHangCTRepository.save(ct);
        });
        // Clear cart
        cartItems.forEach(gioHangChiTietRepository::delete);
        return saved.getMaDH();
    }

    private CartItemDTO toDTO(GioHangChiTiet item) {
        SanPhamChiTiet v = item.getSanPhamChiTiet();
        SanPham sp = v.getSanPham();
        return CartItemDTO.builder()
                .maBienThe(v.getMaBienThe())
                .maSP(sp.getMaSP())
                .tenSP(sp.getTenSP())
                .tenSize(v.getSizeSP() != null ? v.getSizeSP().getTenSize() : null)
                .tenMau(v.getMauSacSP() != null ? v.getMauSacSP().getTenMau() : null)
                .giaBan(v.getGiaBan())
                .soLuong(item.getSoLuong())
                .anhBienThe(v.getAnhBienThe())
                .build();
    }
}

