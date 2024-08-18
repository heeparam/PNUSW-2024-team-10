package com.example.hackdemo.service;

import com.example.hackdemo.model.*;
import com.example.hackdemo.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FavoriteRepository favoriteRepository;
    @Autowired
    private RestaurantRepository restaurantRepository;
    @Autowired
    private TourSpotRepository tourSpotRepository;
    @Autowired
    private CourseRepository courseRepository;

    public User findOrCreateUser(String email, String name) {
        return userRepository.findByEmail(email)
                .orElseGet(() -> {
                    User newUser = new User();
                    newUser.setEmail(email);
                    newUser.setName(name);
                    return userRepository.save(newUser);
                });
    }

    public void toggleFavorite(Long userId, Long itemId, Favorite.ItemType itemType) {
        User user = userRepository.findById(userId).orElseThrow();
        Optional<Favorite> existingFavorite = favoriteRepository.findByUserIdAndItemIdAndItemType(userId, itemId, itemType);

        if (existingFavorite.isPresent()) {
            favoriteRepository.delete(existingFavorite.get());
        } else {
            Favorite newFavorite = new Favorite();
            newFavorite.setUser(user);
            newFavorite.setItemId(itemId);
            newFavorite.setItemType(itemType);
            newFavorite.setCreatedAt(LocalDateTime.now());
            favoriteRepository.save(newFavorite);
        }
    }

    public List<Restaurant> getFavoriteRestaurants(Long userId) {
        List<Favorite> favorites = favoriteRepository.findByUserIdAndItemType(userId, Favorite.ItemType.RESTAURANT);
        return favorites.stream()
                .map(f -> restaurantRepository.findById(f.getItemId()).orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    public List<TourSpot> getFavoriteTourSpots(Long userId) {
        List<Favorite> favorites = favoriteRepository.findByUserIdAndItemType(userId, Favorite.ItemType.TOUR_SPOT);
        return favorites.stream()
                .map(f -> tourSpotRepository.findById(f.getItemId()).orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    public List<Course> getFavoriteCourses(Long userId) {
        List<Favorite> favorites = favoriteRepository.findByUserIdAndItemType(userId, Favorite.ItemType.COURSE);
        return favorites.stream()
                .map(f -> courseRepository.findById(f.getItemId()).orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }
}