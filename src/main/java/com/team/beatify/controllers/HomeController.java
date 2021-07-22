package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;

import com.team.beatify.models.User;
import com.team.beatify.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        model.addAttribute("nombreUsuario", user.getFirstName());
        return "dashboard.jsp";
    }
}
