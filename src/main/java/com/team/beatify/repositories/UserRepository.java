package com.team.beatify.repositories;

import com.team.beatify.models.User;

import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends BaseRepository<User>{
	User findByEmail(String email);
	boolean existsByEmail(String email);
}
