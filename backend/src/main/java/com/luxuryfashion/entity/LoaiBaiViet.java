package com.luxuryfashion.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "LoaiBaiViet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoaiBaiViet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLoaiBV")
    private Integer maLoaiBV;

    @Column(name = "TenLoaiBV", length = 100)
    private String tenLoaiBV;
}

