package com.team.beatify.controllers;


import java.security.Principal;

import java.util.ArrayList;

import java.util.List;

import javax.validation.Valid;

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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER DASHBOARD //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        List<Beat> listaBeats = beatService.listaDeBeatsAsc();
        List<Beat> regionBeats = new ArrayList<>();
        for (Beat beat : listaBeats) {
            if(beat.getuCreador().getRegion().equals(userActual.getRegion())){
                regionBeats.add(beat);
            }
        }
        model.addAttribute("regionBeats", regionBeats);
        model.addAttribute("userActual", userActual);
        model.addAttribute("listaBeats", listaBeats);

        //esto es para ver si tiene permisos de admin (y mostrar en el jsp un link a la pag de admin)
        if(userService.hasAdmin(userActual)) {
            model.addAttribute("permiso", true);
        }
        return "dashboard.jsp";
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // DAR LIKES Y DISLIKES //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/like/{id}")
	public String like(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,Principal principal) {
		User user = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(id);
        beat.setUsersLike(user);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else if (ruta.equals("profileComment")){
            return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
        }
        else{
            return "redirect:/profile/"+ beat.getuCreador().getId();
        }
	}

    @GetMapping("/dislike/{id}")
	public String dislike(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model,Principal principal) {
		User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(id);
        beat.getUsersLike().remove(userActual);
        beatService.createOrUpdateThing(beat);
		if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else if (ruta.equals("profileComment")){
            return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
        }
        else{
            return "redirect:/profile/"+ beat.getuCreador().getId();
        }
	}

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // AÑADIR Y QUITAR DEL CARRO DE COMPRA //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/addwishlist/{id}")
    public String addwishlist(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(id);
        beat.setWishlistuser(userActual);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else if (ruta.equals("profileComment")){
            return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
        }
        else{
            return "redirect:/profile/"+ beat.getuCreador().getId();
        }
    }

    @GetMapping("/removewishlist/{id}")
    public String removewishlist(@PathVariable("id") Long id,@RequestParam("ruta") String ruta, Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(id);
        beat.getWishlistuser().remove(userActual);
        beatService.createOrUpdateThing(beat);
        if (ruta.equals("dashboard")) {
            return "redirect:/dashboard";
        }
        else if (ruta.equals("wishlist")) {
            return "redirect:/wishlist/"+ userActual.getId();
        }
        else if (ruta.equals("profileComment")){
            return "redirect:/profile/"+ beat.getuCreador().getId() +"/"+ beat.getId();
        }
        else{
            return "redirect:/profile/"+ userActual.getId();
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // ACCEDER A LA PAGINA DE ADMIN //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER CARRO DE COMPRA //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/wishlist/{id}")
    public String showWishlist(@PathVariable("id")Long id, Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        List<Beat> listadeseados = userActual.getWishlistbeats();
        model.addAttribute("wishlist", listadeseados);
        return "wishlist.jsp";
    }

    @GetMapping("/realizarcompra")
        public String showWishlist(Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        List<Beat> listaBeats = userActual.getWishlistbeats();
        Compra compra = new Compra();
        compra.setuComprador(userActual);
        compraService.createOrUpdateThing(compra);
        // compra.setBeats(listaBeats);
        int total = 0;
        List<Details> listaDetails = new ArrayList<>();
        for (Beat beat: listaBeats) {
            Details details = new Details();
            details.setCompra(compra);
            details.setBeat(beat);
            details.setPrecio(beat.getCost());
            listaDetails.add(details);
            // detailsService.createOrUpdateThing(details);
            total += beat.getCost();
        }
        detailsService.saveAll(listaDetails);
        compra.setTotal(total);
        compraService.createOrUpdateThing(compra);
        // int total = 0;
        // for (Beat beat : compra.getBeats()) {
        //     total += beat.getCost();
        // }
        // compra.setTotal(total);
        userActual.setWishlistbeats(new ArrayList<Beat>());
        return "redirect:/details";
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER CANCION//
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/song/{id}")
    public String showBeat(@ModelAttribute("messageModel") Message message, @PathVariable("id") Long id, Model model, Principal principal){
        // User user = userService.findByEmail(principal.getName());
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
    public String showBeat(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @PathVariable("idMessage") Long idmessage, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(idmessage);
        message.setBeat(beat);
        message.setUser(userActual);
        messageService.createOrUpdateThing(message);
        return "redirect:/song/"+beat.getId();
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER HISTORIAL DE COMPRA //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // @GetMapping("/details")
    // public String showDetails(Principal principal, Model model){
    //     User user = userService.findByEmail(principal.getName());
    //     List<Compra> listaCompra = user.getListaDeCompras();
    // }


}

