package com.team.beatify.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.User;
import com.team.beatify.services.UserService;
import com.team.beatify.validations.UserValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
    }

    //el usuario debería tener un select de regiones, para agregarlo al model

    @GetMapping("/profile/{userid}")
    public String showProfile(@PathVariable("userid") Long userid, Model model){
        //aquí lo cambié un poco uwu
        User user = userService.findThingById(userid);
        if(user == null) {
            return "redirect:/dashboard";
        }
        List<Beat> listaBeats = user.getBeatsDelCreador();
        model.addAttribute("user", user);
        model.addAttribute("listaBeats", listaBeats);
        return "profile.jsp";

    }



    //editar
    @GetMapping("/profile/{userid}/edit")
    public String editProfilePage(@PathVariable("userid") Long userId, Model model, Principal principal) {

        //solo puede acceder a editar su perfil el usuario creador
        User usuario = userService.findThingById(userId);
        User usuarioLogeado = encontrarUsuario(principal);

        if(usuario == null || usuario.getId() != usuarioLogeado.getId()) {
            return "redirect:/dashboard";
        }
        model.addAttribute("user", usuario);
        return "editProfile.jsp";
    }


    //ver lo de descripcion de usuario, falta agregarlo
    //nombre, apellido, región, descripcion.
    @PutMapping("/profile/{userid}/edit")
    public String editProfile(@Valid @ModelAttribute("user") User user, BindingResult result, @PathVariable("userid") Long userId) {

        User usuario = userService.findThingById(userId);

        if(result.hasErrors()) {
            return "editProfile.jsp";
        }

        //agregar un if que verifique si la región existe

        else {
            usuario.setFirstName(user.getFirstName());
            usuario.setLastName(user.getLastName());
            usuario.setRegion(user.getRegion());
            usuario.setLocation(user.getLocation());
            usuario.setDescripcion(user.getDescripcion());
            userService.createOrUpdateThing(usuario);
            return "redirect:/profile/" + userId;
        }

    }

    public User encontrarUsuario(Principal principal) {
        String email = principal.getName();
        User user = userService.findByEmail(email);
        return user;
    }

}