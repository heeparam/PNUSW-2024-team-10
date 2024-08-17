package com.example.hackdemo.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class CourseItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;

    @ManyToOne
    @JoinColumn(name = "tourist_spot_id")
    private TourSpot tourSpot;

    private String description;
    private String mission;
    private Integer duration; // in minutes

    private boolean isLandmark;

    // getters and setters
}