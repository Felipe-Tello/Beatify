package com.team.beatify.services;

import com.team.beatify.models.Compra_beat;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.CompraBeatRepository;

import org.springframework.stereotype.Service;

@Service
public class CompraBeatService extends BaseService<Compra_beat> {

    private final CompraBeatRepository compraBeatRepository;

    public CompraBeatService(BaseRepository<Compra_beat> baseRepository, CompraBeatRepository compraBeatRepository) {
        super(baseRepository);
        this.compraBeatRepository = compraBeatRepository;
    }
    
}
