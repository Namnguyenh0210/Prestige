package com.luxuryfashion.repository;

import com.luxuryfashion.entity.SizeSP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SizeSPRepository extends JpaRepository<SizeSP, Integer> {
}

