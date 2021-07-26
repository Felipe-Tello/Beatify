package com.team.beatify.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.Compra;
import com.team.beatify.models.Details;
import com.team.beatify.models.Message;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.CategoryService;
import com.team.beatify.services.CompraService;
import com.team.beatify.services.DetailsService;
import com.team.beatify.services.MessageService;
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
    private final CompraService compraService;
    private final DetailsService detailsService;
    private final MessageService messageService;

    public HomeController(UserService userService, BeatService beatService, CategoryService categoryService,
            CompraService compraService, DetailsService detailsService, MessageService messageService) {
        this.userService = userService;
        this.beatService = beatService;
        this.categoryService = categoryService;
        this.compraService = compraService;
        this.detailsService = detailsService;
        this.messageService = messageService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
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
    public String addCategory(@ModelAttribute("categoryModel")Category category){
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

    @GetMapping("/realizarcompra")
        public String showWishlist(HttpSession session, Model model){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        List<Beat> listaBeats = user.getWishlistbeats();
        Compra compra = new Compra();
        compra.setuComprador(user);
        compra.setBeats(listaBeats);
        for (Beat beat: compra.getBeats()) {
            Details details = new Details();
            details.setCompra(compra);
            details.setBeat(beat);
            detailsService.createOrUpdateThing(details);
        }
        int total = 0;
        for (Beat beat : compra.getBeats()) {
            total += beat.getCost();
        }
        compra.setTotal(total);
        compraService.createOrUpdateThing(compra);
        
        user.setWishlistbeats(new ArrayList<Beat>());
        return "redirect:/details";
    }
    @GetMapping("/song/{id}")
    public String showBeat(@ModelAttribute("messageModel") Message message, @PathVariable("id") Long id, HttpSession session, Model model){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        Beat beat = beatService.findThingById(id);
        List<Message> listaMessages = beat.getListaMessagesFromBeat();
        String dataString = "";
        for (Message message2 : listaMessages) {
            dataString += message2.getUser().getFirstName()+": "+message2.getComment()+ "\n"+"-------------------------------"+"\n";
        }
        model.addAttribute("data", dataString);
        model.addAttribute("beat", beat);
        return "showSong.jsp";
    }
    @PostMapping("/song/{idMessage}")
    public String showBeat(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @PathVariable("idMessage") Long idmessage, HttpSession session){
        User user = userService.findThingById((Long) session.getAttribute("userId"));
        Beat beat = beatService.findThingById(idmessage);
        message.setBeat(beat);
        message.setUser(user);
        messageService.createOrUpdateThing(message);
        return "redirect:/song/"+beat.getId();
    }

}
