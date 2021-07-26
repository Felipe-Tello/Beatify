package com.team.beatify.repositories;

import java.util.List;

import com.team.beatify.models.Rol;

import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends BaseRepository<Rol> {
    
    List<Rol> findByName(String name);
    boolean existsByName(String name);
}
