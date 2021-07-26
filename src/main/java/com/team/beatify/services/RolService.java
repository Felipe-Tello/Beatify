package com.team.beatify.services;

import com.team.beatify.models.Rol;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.RolRepository;

import org.springframework.stereotype.Service;

@Service
public class RolService extends BaseService<Rol>{
    private RolRepository rolRepository;

    public RolService(BaseRepository<Rol> baseRepository, RolRepository rolRepository) {
        super(baseRepository);
        this.rolRepository = rolRepository;
        if (consultaRol("ROLE_USER") == false) {
			Rol rol = new Rol();
			rol.setName("ROLE_USER");
            createOrUpdateThing(rol);
		}
		if (consultaRol("ROLE_ADMIN") == false) {
			Rol rol = new Rol();
			rol.setName("ROLE_ADMIN");
            createOrUpdateThing(rol);
		}
    }
    public boolean consultaRol(String rol){
        return rolRepository.existsByName(rol);
    }
}
