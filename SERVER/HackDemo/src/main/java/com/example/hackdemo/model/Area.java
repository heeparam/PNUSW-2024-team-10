package com.example.hackdemo.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private Double xCoordinate;
    private Double yCoordinate;

    @OneToMany(mappedBy = "area")
    private List<Restaurant> restaurants;

    @OneToMany(mappedBy = "area")
    private List<TourSpot> touristSpots;

}