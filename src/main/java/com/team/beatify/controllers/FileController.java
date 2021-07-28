package com.team.beatify.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


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

@Controller
public class FileController {

    private final UserService userService;
    private final BeatService beatService;
    private final CategoryService categoryService;
    
    public FileController(UserService userService, BeatService beatService, CategoryService categoryService) {
        this.userService = userService;
        this.beatService = beatService;
        this.categoryService = categoryService;
    }

    //----------------------------------------------------------------------------------------//

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
                Path directorioImg = Paths.get("src/main/resources/static/user");
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
