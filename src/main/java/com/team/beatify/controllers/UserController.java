package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.team.beatify.models.User;
import com.team.beatify.services.UserService;
import com.team.beatify.validations.UserValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final HttpSession session;

    public UserController(UserService userService, UserValidator userValidator, HttpSession session) {
        this.userService = userService;
        this.session = session;
    }

    //el usuario debería tener un select de regiones, para agregarlo al model

    //editar
    @GetMapping("/profile/{userid}/edit")
    public String editProfilePage(@PathVariable("userid") Long userId, Model model) {

        //verifica si la sesión es nula
        if(validarUsuario(session)) {
            return "redirect:/";
        }

        //solo puede acceder a editar su perfil el usuario creador
        Long sessionId = (Long) session.getAttribute("userId");
        User usuario = userService.findThingById(userId);

        if(usuario.getId() == null || usuario.getId() != sessionId) {
            return "redirect:/dashboard";
        }
        model.addAttribute("user", usuario);
        //agregar lista de regiones
        // model.addAttribute("regiones", regiones);
        return "editProfile.jsp";
    }


    //ver lo de descripcion de usuario, falta agregarlo
    //Los campos editables serían todos? o solo algunos?
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
            // setDescripcion
            //no hace falta agregar los otros setters, pq no hace falta actualizarlos (se mantienen igual)
            userService.createOrUpdateThing(usuario);
            return "redirect:/profile/" + userId;
        }
    }

    public boolean validarUsuario(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        return userId == null;
    }

}