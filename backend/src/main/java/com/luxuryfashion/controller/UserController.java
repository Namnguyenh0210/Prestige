package com.luxuryfashion.controller;

import com.luxuryfashion.dto.ApiResponse;
import com.luxuryfashion.dto.UserDTO;
import com.luxuryfashion.entity.TaiKhoan;
import com.luxuryfashion.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final TaiKhoanService taiKhoanService;

    /**
     * GET /api/users/me
     * Lấy thông tin user hiện tại
     */
    @GetMapping("/me")
    public ResponseEntity<?> getCurrentUser(@AuthenticationPrincipal UserDetails userDetails) {
        try {
            if (userDetails == null) {
                return ResponseEntity.badRequest()
                        .body(new ApiResponse<>(false, "User không được xác thực", null));
            }

            TaiKhoan user = taiKhoanService.findByEmail(userDetails.getUsername());
            UserDTO userDTO = taiKhoanService.toDTO(user);

            return ResponseEntity.ok(new ApiResponse<>(true, "Lấy thông tin user thành công", userDTO));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest()
                    .body(new ApiResponse<>(false, e.getMessage(), null));
        }
    }
}
