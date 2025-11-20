package com.luxuryfashion.repository;

import com.luxuryfashion.entity.DonHangCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonHangCTRepository extends JpaRepository<DonHangCT, Integer> {
}

