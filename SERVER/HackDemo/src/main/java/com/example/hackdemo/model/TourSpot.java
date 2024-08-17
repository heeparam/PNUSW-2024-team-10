package com.example.hackdemo.model;

import com.example.hackdemo.enums.Theme;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class TourSpot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;

    @Enumerated(EnumType.STRING)
    private Theme theme;

    @ManyToOne
    @JoinColumn(name = "area_id")
    private Area area;
}

