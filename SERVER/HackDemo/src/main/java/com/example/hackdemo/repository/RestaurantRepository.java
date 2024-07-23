package com.example.hackdemo.repository;

import com.example.hackdemo.entity.District;
import com.example.hackdemo.entity.Restaurant;
import com.example.hackdemo.enumeration.RestaurantTagType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant,Long> {
    List<Restaurant> findByDistrict(District district);
    List<Restaurant> findByNameContaining(String name);
    List<Restaurant> findByTagsType(RestaurantTagType tagType);
}
