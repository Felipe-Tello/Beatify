package com.team.beatify.services;

import java.util.List;
import java.util.Optional;

import com.team.beatify.models.Rol;
import com.team.beatify.models.User;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.RolRepository;
import com.team.beatify.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseService<User>{

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private RolRepository rolRepository;
    
    private final UserRepository userRepository;

    public UserService(BaseRepository<User> baseRepository, UserRepository userRepository) {
        super(baseRepository);
        this.userRepository = userRepository;
    }
   
    // encontrar un usuario por su email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    public boolean emailExist(String email) {
        return userRepository.existsByEmail(email);
    }

    //metodos para guardar segun ROL
    public void rolUsuario(User user) {
        String contraseña = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(contraseña);
        user.setRoles(rolRepository.findByName("ROLE_USER"));
    }

    public void rolAdmin(User user) {
        String contraseña = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(contraseña);
        user.setRoles(rolRepository.findByName("ROLE_ADMIN"));
    }

    public boolean isEmpty() {
        Long count = userRepository.count();
        return count == 0;
    }
    
    public boolean hasAdmin(User user) {
        List <Rol> userRol = user.getRoles();
        
        for (int i = 0; i < userRol.size(); i++) {
            if(userRol.get(i).getName().equals("ROLE_ADMIN")) {
                return true;
            }
        }

        return false;
    }
}
