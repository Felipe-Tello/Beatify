package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;

import com.team.beatify.services.UserService;
import com.team.beatify.validations.UserValidator;

import org.springframework.stereotype.Controller;

@Controller
public class UserController {

    private final UserService userService;
    private final HttpSession session;

    public UserController(UserService userService, UserValidator userValidator, HttpSession session) {
        this.userService = userService;
        this.session = session;
    }



}