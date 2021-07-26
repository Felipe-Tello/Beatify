package com.team.beatify.repositories;

import java.util.List;

import com.team.beatify.models.Beat;

import org.springframework.stereotype.Repository;

@Repository
public interface BeatRepository extends BaseRepository<Beat> {
    List<Beat> findAllByOrderByIdDesc();
    // List<Beat> findByCategoriesNotContaining(Category category);
}
