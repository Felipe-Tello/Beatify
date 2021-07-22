package com.team.beatify.services;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.team.beatify.repositories.BaseRepository;


@Service
public abstract class BaseService<T> {
    BaseRepository<T> baseRepository;

    public BaseService(BaseRepository<T> baseRepository) {
        this.baseRepository = baseRepository;
    }

    public List<T> allThings() {
        return baseRepository.findAll();
    }
    public T createOrUpdateThing(T entity) {
        return baseRepository.save(entity);
    }
    public T findThingById(Long id) {
        Optional<T> tOptional = baseRepository.findById(id);
        if(tOptional.isPresent()) {
            return tOptional.get();
        } else {
            return null;
        }
    }
    public void deleteThing(Long id) {
        baseRepository.deleteById(id);
    }
}
