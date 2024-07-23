package com.example.hackdemo.repository;

import com.example.hackdemo.enumeration.MissionStatus;
import com.example.hackdemo.enumeration.MissionType;
import com.example.hackdemo.entity.Mission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MissionRepository extends JpaRepository<Mission,Long> {
    List<Mission> findByStatus(MissionStatus status);
    List<Mission> findByType(MissionType type);
}
