package com.example.hackdemo.repository;

import com.example.hackdemo.model.Area;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AreaRepository extends JpaRepository<Area, Long> {}