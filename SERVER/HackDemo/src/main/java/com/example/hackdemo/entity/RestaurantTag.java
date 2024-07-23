package com.example.hackdemo.entity;

import com.example.hackdemo.enumeration.RestaurantTagType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "restaurant_tag")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestaurantTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private RestaurantTagType type;

    @Column(nullable = false)
    private String description;
}
