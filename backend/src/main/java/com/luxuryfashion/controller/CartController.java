package com.luxuryfashion.controller;

import com.luxuryfashion.dto.*;
import com.luxuryfashion.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<CartItemDTO>>> getCart(@AuthenticationPrincipal UserDetails userDetails) {
        List<CartItemDTO> items = cartService.getCart(userDetails);
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy giỏ hàng thành công", items));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<List<CartItemDTO>>> add(@AuthenticationPrincipal UserDetails userDetails,
                                                              @RequestBody AddToCartRequest request) {
        List<CartItemDTO> items = cartService.addToCart(userDetails, request);
        return ResponseEntity.ok(new ApiResponse<>(true, "Thêm giỏ hàng thành công", items));
    }

    @PutMapping("/{maBienThe}")
    public ResponseEntity<ApiResponse<List<CartItemDTO>>> update(@AuthenticationPrincipal UserDetails userDetails,
                                                                 @PathVariable Integer maBienThe,
                                                                 @RequestBody AddToCartRequest body) {
        List<CartItemDTO> items = cartService.updateQuantity(userDetails, maBienThe, body.getSoLuong());
        return ResponseEntity.ok(new ApiResponse<>(true, "Cập nhật số lượng thành công", items));
    }

    @DeleteMapping("/{maBienThe}")
    public ResponseEntity<ApiResponse<List<CartItemDTO>>> remove(@AuthenticationPrincipal UserDetails userDetails,
                                                                 @PathVariable Integer maBienThe) {
        List<CartItemDTO> items = cartService.removeItem(userDetails, maBienThe);
        return ResponseEntity.ok(new ApiResponse<>(true, "Xóa sản phẩm khỏi giỏ thành công", items));
    }

    @PostMapping("/checkout")
    public ResponseEntity<ApiResponse<Integer>> checkout(@AuthenticationPrincipal UserDetails userDetails,
                                                         @RequestBody CheckoutRequest request) {
        Integer maDH = cartService.checkout(userDetails, request);
        return ResponseEntity.ok(new ApiResponse<>(true, "Tạo đơn hàng thành công", maDH));
    }
}

