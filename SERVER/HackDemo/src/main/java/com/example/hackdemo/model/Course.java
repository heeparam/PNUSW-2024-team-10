package com.example.hackdemo.model;

import com.example.hackdemo.enums.CourseDuration;
import com.example.hackdemo.enums.Theme;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Enumerated(EnumType.STRING)
    private Theme theme;

    @Enumerated(EnumType.STRING)
    private CourseDuration duration;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL)
    private List<CourseItem> courseItems;

    @ManyToMany
    @JoinTable(
            name = "course_area",
            joinColumns = @JoinColumn(name = "course_id"),
            inverseJoinColumns = @JoinColumn(name = "area_id")
    )
    private List<Area> areas;

}