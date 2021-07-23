package com.team.beatify.services;

import com.team.beatify.models.Category;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.CategoryRepository;

import org.springframework.stereotype.Service;

@Service
public class CategoryService extends BaseService <Category>{
    
    private final CategoryRepository categoryRepository;

    public CategoryService(BaseRepository<Category> baseRepository, CategoryRepository categoryRepository) {
        super(baseRepository);
        this.categoryRepository = categoryRepository;
    }
}
