package com.example.hackdemo.entity;

import lombok.*;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "district")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class District {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", unique = true)
    private String name;

    @Column(nullable = false)
    private String thumb;

    @Column(nullable = false)
    private Double posX;

    @Column(nullable = false)
    private Double posY;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<TouristSpot> touristSpots;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<Restaurant> restaurants;
}