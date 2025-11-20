package com.luxuryfashion.repository;

import com.luxuryfashion.entity.MauSacSP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MauSacSPRepository extends JpaRepository<MauSacSP, Integer> {
}

