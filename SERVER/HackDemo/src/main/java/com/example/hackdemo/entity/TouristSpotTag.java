package com.example.hackdemo.entity;

import com.example.hackdemo.enumeration.RestaurantTagType;
import com.example.hackdemo.enumeration.TouristSpotTagType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tourist_spot_tag")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TouristSpotTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TouristSpotTagType type;

    @Column(nullable = false)
    private String description;
}
