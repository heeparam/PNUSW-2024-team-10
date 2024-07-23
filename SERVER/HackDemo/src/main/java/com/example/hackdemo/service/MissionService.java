package com.example.hackdemo.service;

import com.example.hackdemo.enumeration.MissionStatus;
import com.example.hackdemo.enumeration.MissionType;
import com.example.hackdemo.repository.MissionRepository;
import com.example.hackdemo.entity.Mission;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MissionService {
    private final MissionRepository missionRepository;

    public List<Mission> getAllMissions() {
        return missionRepository.findAll();
    }
    public Mission getMissionById(Long id) {
        return missionRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Mission not found with id: " + id));
    }
    public List<Mission> getMissionsByStatus(MissionStatus status) {
        return missionRepository.findByStatus(status);
    }

    public List<Mission> getMissionsByType(MissionType type) {
        return missionRepository.findByType(type);
    }
}
