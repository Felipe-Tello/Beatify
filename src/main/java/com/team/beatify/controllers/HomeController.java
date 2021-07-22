package com.team.beatify.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.team.beatify.models.Beat;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HomeController {

    private final UserService userService;
    private final BeatService beatService;

    public HomeController(UserService userService, BeatService beatService) {
        this.userService = userService;
        this.beatService = beatService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        List<Beat> listaBeats = beatService.listaDeBeatsAsc();
        model.addAttribute("Usuario", user);
        model.addAttribute("listaBeats", listaBeats);
        return "dashboard.jsp";
    }
    @GetMapping(value = "/like/{id}")
	public String like(@PathVariable("id") Long id, Model model,HttpSession session) {
		Beat beat = beatService.findThingById(id);
		User user = userService.findThingById((Long) session.getAttribute("userId"));
    	// List<User> users =ideas.getUsers();
        List<User> listaLikes = beat.getUsersLike();
    	listaLikes.add(user);
        beat.setUsersLike(beat.getUsersLike());
        user.setBeatsLike(user.getBeatsLike());
		return "redirect:/";
		}
}
