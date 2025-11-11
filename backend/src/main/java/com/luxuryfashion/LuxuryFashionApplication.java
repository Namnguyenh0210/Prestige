package com.luxuryfashion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main Application Class cho Luxury Fashion E-commerce
 *
 * Dự án: Website bán quần áo cao cấp với Spring Boot + Vue 3
 * Kiến trúc: Frontend-Backend tách biệt, giao tiếp qua REST API
 *
 * @author Luxury Fashion Team
 * @version 1.0.0
 */
@SpringBootApplication
public class LuxuryFashionApplication {

    public static void main(String[] args) {
        SpringApplication.run(LuxuryFashionApplication.class, args);
        System.out.println("\n" +
                "╔══════════════════════════════════════════════════════════╗\n" +
                "║   LUXURY FASHION BACKEND API - STARTED SUCCESSFULLY      ║\n" +
                "║   Backend đang chạy tại: http://localhost:8080/api      ║\n" +
                "║   Swagger UI: http://localhost:8080/api/swagger-ui.html ║\n" +
                "╚══════════════════════════════════════════════════════════╝\n");
    }
}

