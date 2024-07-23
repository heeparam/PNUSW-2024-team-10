package com.example.hackdemo.controller;

import com.example.hackdemo.entity.Mission;
import com.example.hackdemo.service.MissionService;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.http.ResponseEntity;
import lombok.RequiredArgsConstructor;

import java.util.List;

import com.example.hackdemo.enumeration.MissionStatus;
import com.example.hackdemo.enumeration.MissionType;

@RestController
@RequestMapping("/api/missions")
@RequiredArgsConstructor
public class MissionController {
    private final MissionService missionService;

    @GetMapping
    public ResponseEntity<List<Mission>> getAllMissions() {
        return ResponseEntity.ok(missionService.getAllMissions());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Mission> getMissionById(@PathVariable Long id) {
        return ResponseEntity.ok(missionService.getMissionById(id));
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<Mission>> getMissionsByStatus(@PathVariable MissionStatus status) {
        return ResponseEntity.ok(missionService.getMissionsByStatus(status));
    }

    @GetMapping("/type/{type}")
    public ResponseEntity<List<Mission>> getMissionsByType(@PathVariable MissionType type) {
        return ResponseEntity.ok(missionService.getMissionsByType(type));
    }
}
