package com.team.beatify.controllers;

// import java.security.Principal;

// import com.team.beatify.models.Beat;
// import com.team.beatify.models.User;
// import com.team.beatify.services.BeatService;
// import com.team.beatify.services.UserService;

// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {

    // private final UserService userService;
    // private final BeatService beatService;

    // public CommentController(UserService userService, BeatService beatService) {
    //     this.userService = userService;
    //     this.beatService = beatService;
    // }

    // @GetMapping("/like/{id}")
	// public String like(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,Principal principal) {
	// 	User user = userService.findByEmail(principal.getName());
    //     Beat beat = beatService.findThingById(id);
    //     beat.setUsersLike(user);
    //     beatService.createOrUpdateThing(beat);
        
    //     if (ruta.equals("dashboard")) {
    //         return "redirect:/dashboard";
    //     }
    //     else if (ruta.equals("profileComment")){
    //         return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
    //     }
    //     else{
    //         return "redirect:/profile/"+ beat.getuCreador().getId();
    //     }
	// }

    // @GetMapping("/dislike/{id}")
	// public String dislike(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,Principal principal) {
	// 	User userActual = userService.findByEmail(principal.getName());
    //     Beat beat = beatService.findThingById(id);
    //     beat.getUsersLike().remove(userActual);
    //     beatService.createOrUpdateThing(beat);

	// 	if (ruta.equals("dashboard")) {
    //         return "redirect:/dashboard";
    //     }
    //     else if (ruta.equals("profileComment")){
    //         return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
    //     }
    //     else{
    //         return "redirect:/profile/"+ beat.getuCreador().getId();
    //     }
	// }
}
