package com.team.beatify.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.User;
import com.team.beatify.services.CategoryService;
import com.team.beatify.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminController {
    
    private final UserService userService;
    private final CategoryService categoryService;

    public AdminController(UserService userService, CategoryService categoryService) {
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @GetMapping("/admin")
    public String addCategory(@ModelAttribute("categoryModel")Category category, Principal principal, Model model){
        User userActual = userService.findByEmail(principal.getName());
        model.addAttribute("admin", userActual);
        return "admin.jsp";
    }

    @PostMapping("/admin")
    public String addCategory(@Valid @ModelAttribute("categoryModel") Category category, BindingResult result, Principal principal){
        Category newCategory = categoryService.createOrUpdateThing(category);
        categoryService.createOrUpdateThing(newCategory);
        return "redirect:/admin";
    }
    @GetMapping("/admin/newimage")
    public String uploadImage(@ModelAttribute("categoryModel")Category category, Principal principal, Model model){
        User userActual = userService.findByEmail(principal.getName());
        model.addAttribute("admin", userActual);
        return "adminImage.jsp";
    }
    @PostMapping("/admin/newimage")
    public String uploadImage(@Valid @ModelAttribute("modelBeat")Beat beat, BindingResult result, @RequestParam("file") MultipartFile file, Principal principal){
        User user = userService.findByEmail(principal.getName());
            if (!file.isEmpty()) {
                String name = file.getOriginalFilename();
                Path directorioImg = Paths.get("src/main/resources/static/ranges");
                int number = 0;
                String ruta = directorioImg.toFile().getAbsolutePath() + (number + 1);
                File directorio = new File(ruta);
                if(directorio.exists() == false){ 
                    directorio.mkdir(); 
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath() +"/"+ name)));
                    stream.write(bytes);
                    stream.close(); 
                    return "redirect:/admin/";
                } catch (Exception e) {
                    return "You failed to upload  => " + e.getMessage();
                }
            } 
            else {
                return "You failed to upload because the file was empty.";
        }
    }
}
