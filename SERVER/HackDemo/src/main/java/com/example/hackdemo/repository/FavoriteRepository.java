package com.example.hackdemo.repository;

import com.example.hackdemo.model.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    Optional<Favorite> findByUserIdAndItemIdAndItemType(Long userId, Long itemId, Favorite.ItemType itemType);
    List<Favorite> findByUserIdAndItemType(Long userId, Favorite.ItemType itemType);
}

