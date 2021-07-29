package com.team.beatify.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.CategoryService;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SongController {

    private final BeatService beatService;
    private final UserService userService;
    private final CategoryService categoryService;

    public SongController(BeatService beatService, UserService userService, CategoryService categoryService) {
        this.beatService = beatService;
        this.userService = userService;
        this.categoryService = categoryService;
    }

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

    @GetMapping("/song/new")
    public String upload(@ModelAttribute("modelBeat")Beat beat, Model model){
        List<Category> listaCategories = categoryService.allThings();
        model.addAttribute("listaCategories", listaCategories);
        return "addSongs.jsp";
    }
    @PostMapping("/song/new")
    public String handleFileUpload(@Valid @ModelAttribute("modelBeat")Beat beat, BindingResult result, @RequestParam("file") MultipartFile file, Principal principal){
        User user = userService.findByEmail(principal.getName());
            if (!file.isEmpty()) {
                String name = file.getOriginalFilename();
                Path directorioImg = Paths.get("src/main/resources/static/users/user");
                String ruta = directorioImg.toFile().getAbsolutePath() +user.getId();
                File directorio = new File(ruta);
                if(directorio.exists() == false){ 
                    directorio.mkdir(); 
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath() +"/"+ name)));
                    stream.write(bytes);
                    stream.close();
                    Beat beatNew = beatService.createOrUpdateThing(beat);
                    beatNew.setuCreador(user); 
                    beatNew.setUrl("/user"+user.getId()+"/"+ name);
                    beatService.createOrUpdateThing(beatNew);
                    // Category category = categoryService.findThingById(idCategory);
                    // List<Category> categoriasBeat = beatNew.getCategories();
                    // List<Beat> beatsCategorias = category.getBeats();
                    // categoriasBeat.add(category);
                    // beatsCategorias.add(beatNew);
                    // beatService.createOrUpdateThing(beatNew);
                    // categoryService.createOrUpdateThing(category);
                    return "redirect:/profile/"+user.getId();
                } catch (Exception e) {
                    return "You failed to upload  => " + e.getMessage();
                }
            } 
            else {
                return "You failed to upload because the file was empty.";
        }
    }

}
