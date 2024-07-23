package com.example.hackdemo.entity;

import lombok.*;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "restaurant")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(nullable = false)
    private String thumb;

    @Column(name = "address")
    private String address;

    @Column(name="menu")
    private String menu;

    @Column(nullable = false)
    private Boolean liked = false;

    @ManyToOne
    @JoinColumn(name = "district_id")
    private District district;

    @ManyToMany
    @JoinTable(
            name = "restaurant_tag",
            joinColumns = @JoinColumn(name = "restaurant_id"),
            inverseJoinColumns = @JoinColumn(name = "restaurant_tag_id")
    )
    private Set<RestaurantTag> tags = new HashSet<>();
    public void addTag(RestaurantTag restaurantTag) {
        this.tags.add(restaurantTag);
    }

    public void removeTag(RestaurantTag restaurantTag) {
        this.tags.remove(restaurantTag);
    }
}