package com.example.hackdemo.entity;

import lombok.*;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "touristSpot")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TouristSpot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(nullable = false)
    private String thumb;

    @Column(name = "address")
    private String address;

    @Column(nullable = false)
    private Boolean liked = false;

    @ManyToOne
    @JoinColumn(name = "district_id")
    private District district;

    @ManyToMany
    @JoinTable(
            name = "tourist_spot_tag",
            joinColumns = @JoinColumn(name = "tourist_spot_id"),
            inverseJoinColumns = @JoinColumn(name = "tourist_spot_tag_id")
    )
    private Set<TouristSpotTag> tags = new HashSet<>();
    public void addTag(TouristSpotTag touristSpotTag) {
        this.tags.add(touristSpotTag);
    }

    public void removeTag(TouristSpotTag touristSpotTag) {
        this.tags.remove(touristSpotTag);
    }

}
