package com.team.beatify.services;

import java.util.List;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.BeatRepository;

import org.springframework.stereotype.Service;


@Service
public class BeatService extends BaseService <Beat> {

    private final BeatRepository beatRepository;
    
    public BeatService(BaseRepository<Beat> baseRepository, BeatRepository beatRepository) {
        super(baseRepository);
        this.beatRepository = beatRepository;
    }

    public List<Beat> listaDeBeatsAsc(){
		return beatRepository.findAllByOrderByIdDesc();
	}
    public List<Beat> beatsCategorias(Category category){
        return beatRepository.findByCategoriesContaining(category);
    }
}
