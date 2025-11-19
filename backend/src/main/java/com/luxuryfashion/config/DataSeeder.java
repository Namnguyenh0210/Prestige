package com.luxuryfashion.config;

import com.luxuryfashion.entity.Role;
import com.luxuryfashion.entity.TaiKhoan;
import com.luxuryfashion.repository.RoleRepository;
import com.luxuryfashion.repository.TaiKhoanRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
@RequiredArgsConstructor
public class DataSeeder implements CommandLineRunner {

    private final RoleRepository roleRepository;
    private final TaiKhoanRepository taiKhoanRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {

        // 1. Tạo roles nếu chưa có
        Role khachHangRole = roleRepository.findByName("KHACHHANG")
                .orElseGet(() -> roleRepository.save(Role.builder().name("KHACHHANG").build()));
        Role adminRole = roleRepository.findByName("ADMIN")
                .orElseGet(() -> roleRepository.save(Role.builder().name("ADMIN").build()));
        Role nhanVienRole = roleRepository.findByName("NHANVIEN")
                .orElseGet(() -> roleRepository.save(Role.builder().name("NHANVIEN").build()));

        // 2. Tạo user khách hàng
        if (taiKhoanRepository.findByEmail("user@luxury.com").isEmpty()) {
            TaiKhoan user = TaiKhoan.builder()
                    .email("user@luxury.com")
                    .password(passwordEncoder.encode("123456"))
                    .fullName("Khách Hàng Thường")
                    .roles(Set.of(khachHangRole))
                    .enabled(true)
                    .build();
            taiKhoanRepository.save(user);
        }

        // 3. Tạo user admin
        if (taiKhoanRepository.findByEmail("admin@luxury.com").isEmpty()) {
            TaiKhoan admin = TaiKhoan.builder()
                    .email("admin@luxury.com")
                    .password(passwordEncoder.encode("123456"))
                    .fullName("Quản Trị Viên")
                    .roles(Set.of(adminRole))
                    .enabled(true)
                    .build();
            taiKhoanRepository.save(admin);
        }

        // 4. Tạo user nhân viên
        if (taiKhoanRepository.findByEmail("staff@luxury.com").isEmpty()) {
            TaiKhoan staff = TaiKhoan.builder()
                    .email("staff@luxury.com")
                    .password(passwordEncoder.encode("123456"))
                    .fullName("Nhân Viên Bán Hàng")
                    .roles(Set.of(nhanVienRole))
                    .enabled(true)
                    .build();
            taiKhoanRepository.save(staff);
        }

        System.out.println("✅ DataSeeder: Roles & Users initialized!");
    }
}
