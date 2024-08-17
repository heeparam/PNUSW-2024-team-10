package com.example.hackdemo.model;

import com.example.hackdemo.enums.EatingAlone;
import com.example.hackdemo.enums.FoodType;
import com.example.hackdemo.enums.HalalOrVegan;
import com.example.hackdemo.enums.MichelinGuide;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;
    private String mainMenu;

    @Enumerated(EnumType.STRING)
    private FoodType foodType;

    @Enumerated(EnumType.STRING)
    private EatingAlone eatingAlone;

    @Enumerated(EnumType.STRING)
    private HalalOrVegan halalOrVegan;

    @Enumerated(EnumType.STRING)
    private MichelinGuide michelinGuide;

    @ManyToOne
    @JoinColumn(name = "area_id")
    private Area area;

}