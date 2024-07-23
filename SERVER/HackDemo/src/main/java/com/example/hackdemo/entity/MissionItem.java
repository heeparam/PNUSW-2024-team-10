package com.example.hackdemo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "missionItem")
@NoArgsConstructor
@AllArgsConstructor
public class MissionItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "missionId")
    private Mission mission;

    @Column(name = "orderIndex")
    private Integer orderIndex;

    @Column(nullable = false)
    private String message;

    @ManyToOne
    @JoinColumn(name = "touristSpotId")
    private TouristSpot touristSpot;

    @ManyToOne
    @JoinColumn(name = "restaurantId")
    private Restaurant restaurant;
}
