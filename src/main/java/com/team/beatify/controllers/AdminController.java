package com.team.beatify.controllers;

import java.security.Principal;

import javax.validation.Valid;

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
    public String addCategory(@Valid @ModelAttribute("categoryModel") Category category, BindingResult result, @RequestParam("file") MultipartFile file, Principal principal){
        Category newCategory = categoryService.createOrUpdateThing(category);
        String url = "categoryImage/";
        categoryService.createOrUpdateThing(newCategory);
        categoryService.uploadCategoryImage(file, url);
        newCategory.setUrl(url+file.getOriginalFilename());
        categoryService.createOrUpdateThing(newCategory);
        return "redirect:/admin";
    }
}
