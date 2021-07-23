package com.team.beatify.repositories;

import java.util.List;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;

import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends BaseRepository<Category>{
    // List<Category> findByBeatsNotContaining(Beat beat);
}
