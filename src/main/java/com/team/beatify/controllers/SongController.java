package com.team.beatify.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.CategoryService;
import com.team.beatify.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class SongController {
    
    @Autowired
    private BeatService beatService;

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    //editar cancion
    @GetMapping("/song/{songid}/edit")
    public String editSongPage(Principal principal, Model model, @PathVariable("songid") Long songId) {

        Beat beat = beatService.findThingById(songId);
        User usuarioLogeado = encontrarUsuario(principal);

        if(beat == null || beat.getuCreador().getId() != usuarioLogeado.getId()) {
            return "redirect:/dashboard";
        }

        model.addAttribute("beat", beat);
        List<Category> listaCategories = categoryService.allThings();
        model.addAttribute("listaCategories", listaCategories);
        return "editSong.jsp";
    }

    //campos editables: titulo, costo, añadir categorias?
    @PutMapping("/song/{songid}/edit")
    public String editSong(@Valid @ModelAttribute("beat") Beat beat, BindingResult result, @PathVariable("songid") Long songId, Model model) {

        Beat beatUpdated = beatService.findThingById(songId);
        List<Category> listaCategories = categoryService.allThings();

        if(result.hasErrors()) {
            model.addAttribute("listaCategories", listaCategories);
            return "editSong.jsp";
        }
        else if(beat.getCategories().size() <= 0) {
            model.addAttribute("error", "Debe agregar al menos una categoría");
            model.addAttribute("listaCategories", listaCategories);
            return "editSong.jsp";
        }
        else {
            beatUpdated.setTitle(beat.getTitle());
            beatUpdated.setCost(beat.getCost());
            beatUpdated.setCategories(beat.getCategories());
            beatService.createOrUpdateThing(beatUpdated);
            return "redirect:/song/" + songId;
        }
    }

    public User encontrarUsuario(Principal principal) {
        String email = principal.getName();
        User user = userService.findByEmail(email);
        return user;
    }

}
