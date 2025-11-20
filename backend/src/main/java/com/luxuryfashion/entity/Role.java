package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Role")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaRole")
    private Long id; // Khớp với JpaRepository<Role, Long>

    @Column(name = "TenRole", unique = true, nullable = false)
    private String name; // Khớp với findByName, getName() được Lombok sinh ra
}
