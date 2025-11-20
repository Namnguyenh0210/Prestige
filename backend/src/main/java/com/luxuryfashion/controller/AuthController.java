package com.luxuryfashion.controller;

import com.luxuryfashion.dto.*;
import com.luxuryfashion.entity.TaiKhoan;
import com.luxuryfashion.security.JwtService;
import com.luxuryfashion.service.TaiKhoanService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping({"/api/auth","/auth"})
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final TaiKhoanService taiKhoanService;
    private static final Logger log = LoggerFactory.getLogger(AuthController.class);

    /**
     * POST /api/auth/register
     * Đăng ký tài khoản mới
     */
    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest request) {
        try {
            // Register user
            TaiKhoan user = taiKhoanService.register(request);
            UserDTO userDTO = taiKhoanService.toDTO(user);

            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(new ApiResponse<>(true, "Đăng ký thành công", userDTO));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest()
                    .body(new ApiResponse<>(false, e.getMessage(), null));
        }
    }

    /**
     * POST /api/auth/login
     * Đăng nhập và lấy JWT token
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody AuthRequest request) {
        log.info("[LOGIN] Nhận yêu cầu đăng nhập email={}", request.getEmail());
        try {
            // Authenticate
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
            );

            // Lấy user details
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();

            // Generate JWT token
            String token = jwtService.generateToken(userDetails);

            // Lấy user info từ database
            TaiKhoan user = taiKhoanService.findByEmail(request.getEmail());
            UserDTO userDTO = taiKhoanService.toDTO(user);

            // Tạo response
            AuthResponse authResponse = AuthResponse.builder()
                    .success(true)
                    .message("Đăng nhập thành công")
                    .token(token)
                    .user(userDTO)
                    .build();

            return ResponseEntity.ok(authResponse);

        } catch (AuthenticationException e) {
            log.warn("[LOGIN] Sai thông tin đăng nhập cho email={}: {}", request.getEmail(), e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new ApiResponse<>(false, "Email hoặc password không đúng", null));
        } catch (Exception e) {
            log.error("[LOGIN] Lỗi server khi đăng nhập email={}: {}", request.getEmail(), e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ApiResponse<>(false, "Lỗi server: " + e.getMessage(), null));
        }
    }
    
    /**
     * POST /api/auth/logout
     * Đăng xuất
     */
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {
        return ResponseEntity.ok(new ApiResponse<>(true, "Đăng xuất thành công", null));
    }
}
