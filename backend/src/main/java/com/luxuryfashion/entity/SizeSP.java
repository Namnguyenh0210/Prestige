package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "SizeSP")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SizeSP {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaSize")
    private Integer maSize;

    @Column(name = "TenSize", unique = true, nullable = false)
    private String tenSize;
}

