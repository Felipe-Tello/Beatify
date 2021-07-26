package com.team.beatify.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Message;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private final UserService userService;
    private final HttpSession session;

    public UserController(UserService userService, UserValidator userValidator, HttpSession session) {
        this.userService = userService;
        this.session = session;
    }

    //el usuario debería tener un select de regiones, para agregarlo al model

    @GetMapping("/profile/{userid}")
    public String showProfile(@PathVariable("userid") Long userid, Principal principal, Model model){
        User user = userService.findByEmail(principal.getName());
        List<Beat> listaBeats = user.getBeatsDelCreador();
        model.addAttribute("user", user);
        model.addAttribute("listaBeats", listaBeats);
        return "profile.jsp";
    }
    @PostMapping("/profile/{userid}")
    public String showProfile(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @RequestParam("beatId")Long id, Principal principal){
        User user = userService.findByEmail(principal.getName());
        
        return "redirect:/profile/"+ user.getId();
    }



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