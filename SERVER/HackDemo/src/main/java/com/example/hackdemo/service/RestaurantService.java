package com.example.hackdemo.service;

import com.example.hackdemo.entity.District;
import com.example.hackdemo.entity.Restaurant;
import com.example.hackdemo.enumeration.RestaurantTagType;
import com.example.hackdemo.repository.RestaurantRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RestaurantService {
    private final RestaurantRepository restaurantRepository;

    public List<Restaurant> getAllRestaurants() {
        return restaurantRepository.findAll();
    }

    public Restaurant getRestaurantById(Long id) {
        return restaurantRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Restaurant not found with id: " + id));
    }

    public List<Restaurant> getRestaurantsByDistrict(District district) {
        return restaurantRepository.findByDistrict(district);
    }

    public List<Restaurant> getRestaurantsByName(String name) {
        return restaurantRepository.findByNameContaining(name);
    }

    public List<Restaurant> getRestaurantsByTag(RestaurantTagType restaurantTagType) {
        return restaurantRepository.findByTagsType(restaurantTagType);
    }
}
