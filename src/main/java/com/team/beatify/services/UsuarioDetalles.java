package com.team.beatify.services;

import java.util.ArrayList;
import java.util.List;

import com.team.beatify.models.Rol;
import com.team.beatify.models.User;
import com.team.beatify.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UsuarioDetalles implements UserDetailsService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username); //email 
        
        if(user == null) {
            throw new UsernameNotFoundException("Usuario no encontrado");
        }

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), getAuthorities(user));
    }

    //obtener las autorizaciones del usuario
    private List<GrantedAuthority> getAuthorities(User user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Rol rol : user.getRoles()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(rol.getName());
            authorities.add(grantedAuthority);
        }
        return authorities;
    }
}