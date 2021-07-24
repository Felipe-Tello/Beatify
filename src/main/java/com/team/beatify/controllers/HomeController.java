package com.team.beatify.controllers;

import java.security.Principal;
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
        model.addAttribute("Usuario", user);
        model.addAttribute("listaBeats", listaBeats);

        //esto es para ver si tiene permisos de admin (y mostrar en el jsp un link a la pag de admin)
        if(userService.hasAdmin(user)) {
            model.addAttribute("permiso", true);
        }
        return "dashboard.jsp";
    }
    @GetMapping(value = "/like/{id}")
	public String like(@PathVariable("id") Long id, Model model,HttpSession session) {
		Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
    	// List<User> users =ideas.getUsers();
        List<User> listaLikes = beat.getUsersLike();
        List<Beat> listaBeats = user.getBeatsLike();
    	listaLikes.add(user);
        listaBeats.add(beat);
        // beat.setUsersLike(beat.getUsersLike());
        // user.setBeatsLike(user.getBeatsLike());
        beatService.createOrUpdateThing(beat);
        userService.createOrUpdateThing(user);
        model.addAttribute("likes", listaLikes.size());
		return "redirect:/dashboard";
	}
    @GetMapping(value = "/dislike/{id}")
	public String dislike(@PathVariable("id") Long id, Model model,HttpSession session) {
		Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
    	// List<User> users =ideas.getUsers();
        List<User> listaLikes = beat.getUsersLike();
        List<Beat> listaBeats = user.getBeatsLike();
    	listaLikes.remove(user);
        listaBeats.remove(beat);
        // beat.setUsersLike(beat.getUsersLike());
        // user.setBeatsLike(user.getBeatsLike());
        beatService.createOrUpdateThing(beat);
        userService.createOrUpdateThing(user);
        model.addAttribute("likes", listaLikes.size());
		return "redirect:/dashboard";
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
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        Category newCategory = categoryService.createOrUpdateThing(category);
        categoryService.createOrUpdateThing(newCategory);
        return "admin.jsp";
    }
}
