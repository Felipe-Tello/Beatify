package com.team.beatify.services;

import com.team.beatify.models.Compra;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.CompraRepository;

import org.springframework.stereotype.Service;

@Service
public class CompraService extends BaseService <Compra> {

    private final CompraRepository compraRepository;

    public CompraService(BaseRepository<Compra> baseRepository, CompraRepository compraRepository) {
        super(baseRepository);
        this.compraRepository = compraRepository;
    }
    
}
