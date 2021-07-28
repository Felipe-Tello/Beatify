package com.team.beatify.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Message;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.MessageService;
import com.team.beatify.services.UserService;

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
    private final BeatService beatService;
    private final MessageService messageService;

    public UserController(UserService userService, HttpSession session, BeatService beatService,
    MessageService messageService) {
        this.userService = userService;
        this.session = session;
        this.beatService = beatService;
        this.messageService = messageService;
}


    //el usuario debería tener un select de regiones, para agregarlo al model

    @GetMapping("/profile/{userid}")
    public String showProfile(@PathVariable("userid") Long userid, Principal principal, Model model){
        User userActual = userService.findByEmail(principal.getName());
        User user = userService.findThingById(userid);
        if(user == null) {
            return "redirect:/dashboard";
        }
        List<Beat> listaBeats = user.getBeatsDelCreador();
        model.addAttribute("user", user);
        model.addAttribute("userActual", userActual);
        model.addAttribute("listaBeats", listaBeats);
        return "profile.jsp";

    }
    @PostMapping("/profile/{userid}")
    public String showProfile(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @RequestParam("beatId")Long id, Principal principal){
        User user = userService.findByEmail(principal.getName());
        
        return "redirect:/profile/"+ user.getId();
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER COMENTARIOS EN EL PERFIL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/profile/{userid}/{beatid}")
    public String showMessage(Principal principal, @PathVariable("userid") Long userid, @PathVariable("beatid") Long beatid, @ModelAttribute("messageModel") Message message, Model model){
        User userActual = userService.findByEmail(principal.getName());
        User user = userService.findThingById(userid);
        Beat beat = beatService.findThingById(beatid);
        List<Beat> listaBeats = user.getBeatsDelCreador();
        List<Message> listaMessages = beat.getListaMessagesFromBeat();
        String dataString = "";
        for (Message message2 : listaMessages) {
            dataString += message2.getUser().getFirstName()+": "+message2.getComment()+ "\n"+"-------------------------------"+"\n";
        }
        model.addAttribute("userActual", userActual);
        model.addAttribute("user", user);
        model.addAttribute("listaBeats", listaBeats);
        model.addAttribute("data", dataString);
        model.addAttribute("beat", beat);
        return "profileComment.jsp";
    }

    @PostMapping("/profile/{userid}/{beatid}")
    public String showMessage(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @PathVariable("userid") Long userid, @PathVariable("beatid") Long beatid, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(beatid);
        message.setBeat(beat);
        message.setUser(userActual);
        messageService.createOrUpdateThing(message);
        return "redirect:/profile/"+userid+"/"+beatid;
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITAR PERFIL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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