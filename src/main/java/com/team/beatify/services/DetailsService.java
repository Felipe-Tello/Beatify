package com.team.beatify.services;

import com.team.beatify.models.Details;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.DetailsRepository;

import org.springframework.stereotype.Service;

@Service
public class DetailsService extends BaseService<Details> {

    private final DetailsRepository detailsRepository;

    public DetailsService(BaseRepository<Details> baseRepository, DetailsRepository detailsRepository) {
        super(baseRepository);
        this.detailsRepository = detailsRepository;
    }
}
