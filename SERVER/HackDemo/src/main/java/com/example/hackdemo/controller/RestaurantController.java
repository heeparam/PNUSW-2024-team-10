package com.example.hackdemo.controller;


import com.example.hackdemo.entity.District;
import com.example.hackdemo.entity.Restaurant;
import com.example.hackdemo.enumeration.RestaurantTagType;
import com.example.hackdemo.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/restaurants")
@RequiredArgsConstructor
public class RestaurantController {
    private final RestaurantService restaurantService;

    @GetMapping
    public ResponseEntity<List<Restaurant>> getAllRestaurants() {
        return ResponseEntity.ok(restaurantService.getAllRestaurants());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Restaurant> getRestaurantById(@PathVariable Long id) {
        return ResponseEntity.ok(restaurantService.getRestaurantById(id));
    }

    @GetMapping("/district/{districtId}")
    public ResponseEntity<List<Restaurant>> getRestaurantsByDistrict(@PathVariable Long districtId) {
        District district = new District();
        district.setId(districtId);
        return ResponseEntity.ok(restaurantService.getRestaurantsByDistrict(district));
    }

    @GetMapping("/search")
    public ResponseEntity<List<Restaurant>> getRestaurantsByName(@RequestParam String name) {
        return ResponseEntity.ok(restaurantService.getRestaurantsByName(name));
    }

    @GetMapping("/tag/{tagType}")
    public ResponseEntity<List<Restaurant>> getRestaurantsByTag(@PathVariable RestaurantTagType restaurantTagType) {
        return ResponseEntity.ok(restaurantService.getRestaurantsByTag(restaurantTagType));
    }
}