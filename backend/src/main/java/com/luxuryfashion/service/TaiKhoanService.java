package com.luxuryfashion.service;

import com.luxuryfashion.dto.RegisterRequest;
import com.luxuryfashion.dto.UserDTO;
import com.luxuryfashion.entity.TaiKhoan;
import com.luxuryfashion.entity.Role;
import com.luxuryfashion.repository.TaiKhoanRepository;
import com.luxuryfashion.repository.RoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TaiKhoanService {

    private final TaiKhoanRepository taiKhoanRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public TaiKhoan register(RegisterRequest request) {
        // Kiểm tra duplicate email
        if (taiKhoanRepository.existsByEmail(request.getEmail())) {
            throw new RuntimeException("Email đã tồn tại");
        }

        // Tạo user mới
        TaiKhoan user = TaiKhoan.builder()
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .fullName(request.getFullName())
                .enabled(true)
                .build();

        // Assign default role: KHACHHANG
        Role customerRole = roleRepository.findByName("KHACHHANG")
                .orElseThrow(() -> new RuntimeException("Role KHACHHANG không tồn tại"));

        Set<Role> roles = new HashSet<>();
        roles.add(customerRole);
        user.setRoles(roles);

        return taiKhoanRepository.save(user);
    }

    public TaiKhoan findByEmail(String email) {
        return taiKhoanRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User không tồn tại"));
    }

    public UserDTO toDTO(TaiKhoan user) {
        return UserDTO.builder()
                .id(user.getId())
                .email(user.getEmail())
                .fullName(user.getFullName())
                .roles(user.getRoles().stream().map(Role::getName).collect(Collectors.toSet()))
                .build();
    }
}
