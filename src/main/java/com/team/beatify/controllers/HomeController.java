package com.team.beatify.controllers;


import java.security.Principal;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final UserService userService;
    private final BeatService beatService;
    private final CategoryService categoryService;

    public HomeController(UserService userService, BeatService beatService, CategoryService categoryService) {
        this.userService = userService;
        this.beatService = beatService;
        this.categoryService = categoryService;
    }
    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal){
        String email = principal.getName();
        User user = userService.findByEmail(email);
        List<Beat> listaBeats = beatService.listaDeBeatsAsc();
        List<Beat> regionBeats = new ArrayList<>();
        for (Beat beat : listaBeats) {
            if(beat.getuCreador().getRegion().equals(user.getRegion())){
                regionBeats.add(beat);
            }
        }
        model.addAttribute("regionBeats", regionBeats);
        model.addAttribute("Usuario", user);
        model.addAttribute("listaBeats", listaBeats);

        //esto es para ver si tiene permisos de admin (y mostrar en el jsp un link a la pag de admin)
        if(userService.hasAdmin(user)) {
            model.addAttribute("permiso", true);
        }
        return "dashboard.jsp";
    }
    
    @GetMapping("/like/{id}")
	public String like(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,HttpSession session) {
		Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
        beat.setUsersLike(user);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else{
            return "redirect:/profile/"+ user.getId();
        }
	}
    @GetMapping("/dislike/{id}")
	public String dislike(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,HttpSession session) {
		Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
        beat.getUsersLike().remove(user);
        beatService.createOrUpdateThing(beat);
		if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else{
            return "redirect:/profile/"+ user.getId();
        }
	}
    @GetMapping("/addwishlist/{id}")
    public String addwishlist(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model, HttpSession session){
        Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
        beat.setWishlistuser(user);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else{
            return "redirect:/profile/"+ user.getId();
        }
    }
    @GetMapping("/removewishlist/{id}")
    public String removewishlist(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model, HttpSession session){
        Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
        beat.getWishlistuser().remove(user);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else if (ruta.equals("wishlist")) {
            return "redirect:/wishlist/"+ user.getId();
        }
        else{
            return "redirect:/profile/"+ user.getId();
        }
    }
    @GetMapping("/admin")
    public String addCategory(@ModelAttribute("categoryModel")Category category, Principal principal, Model model){
        String email = principal.getName();
        User usuario = userService.findByEmail(email);
        model.addAttribute("admin", usuario);
        return "admin.jsp";
    }
    @PostMapping("/admin")
    public String addCategory(@Valid @ModelAttribute("categoryModel") Category category, BindingResult result, HttpSession session){
        Category newCategory = categoryService.createOrUpdateThing(category);
        categoryService.createOrUpdateThing(newCategory);
        return "redirect:/admin";
    }
    @GetMapping("/wishlist/{id}")
    public String showWishlist(@PathVariable("id")Long id, HttpSession session, Model model){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        List<Beat> listadeseados = user.getWishlistbeats();
        model.addAttribute("wishlist", listadeseados);
        return "wishlist.jsp";
    }    
}
