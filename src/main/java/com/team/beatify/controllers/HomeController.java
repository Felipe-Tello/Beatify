package com.team.beatify.controllers;


import java.security.Principal;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.Compra;
import com.team.beatify.models.Details;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.CategoryService;
import com.team.beatify.services.CompraService;
import com.team.beatify.services.DetailsService;
import com.team.beatify.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final UserService userService;
    private final BeatService beatService;
    private final CategoryService categoryService;
    private final CompraService compraService;
    private final DetailsService detailsService;

    public HomeController(UserService userService, BeatService beatService, CategoryService categoryService,
            CompraService compraService, DetailsService detailsService) {
        this.userService = userService;
        this.beatService = beatService;
        this.categoryService = categoryService;
        this.compraService = compraService;
        this.detailsService = detailsService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/dashboard";
    }

    //si es q no hay nada en la wishlist, un id nulo, entonces redireccionar(modificar)

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER DASHBOARD //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal){
        User userActual = userService.findByEmail(principal.getName());
        List<Beat> listaBeats = beatService.listaDeBeatsAsc();
        List<Beat> regionBeats = new ArrayList<>();
        Category category = categoryService.findThingById(2L); 
        List<Category> listaCategories = categoryService.allThings();
        for (Beat beat : listaBeats) {
            if(beat.getuCreador().getRegion().equals(userActual.getRegion())){
                regionBeats.add(beat);
            }
        }
        model.addAttribute("listaCategories", listaCategories);
        model.addAttribute("category", category);
        model.addAttribute("regionBeats", regionBeats);
        model.addAttribute("userActual", userActual);
        model.addAttribute("listaBeats", listaBeats);

        //esto es para ver si tiene permisos de admin (y mostrar en el jsp un link a la pag de admin)
        if(userService.hasAdmin(userActual)) {
            model.addAttribute("permiso", true);
        }
        return "dashboard.jsp";
    }

    @GetMapping("/categories/{id}")
    public String showCategory(@PathVariable("id")Long id, Principal principal, Model model){
        User userActual = userService.findByEmail(principal.getName());
        Category category = categoryService.findThingById(id);
        model.addAttribute("userActual", userActual);
        model.addAttribute("category", category);
        return "categories.jsp";
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
        else if (ruta.equals("category")){
            return "redirect:/category/"+ beat.getuCreador().getId() +"/"+ beat.getId();
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
        Format formatofecha = new SimpleDateFormat("MMMM/dd HH:mm a");
	    String fecha = formatofecha.format(new Date());
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
        compra.setFecha(fecha);
        compra.setTotal(total);
        compraService.createOrUpdateThing(compra);
        // int total = 0;
        // for (Beat beat : compra.getBeats()) {
        //     total += beat.getCost();
        // }
        // compra.setTotal(total);
        userActual.setWishlistbeats(new ArrayList<Beat>());
        return "redirect:/details/"+compra.getId();
    }


    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER HISTORIAL DE COMPRA //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/details/{idCompra}")
    public String showDetails(@PathVariable("idCompra") Long id, Principal principal, Model model){
        User userActual = userService.findByEmail(principal.getName());
        List<Compra> listaCompra = userActual.getListaDeCompras();
        model.addAttribute("userActual", userActual);
        model.addAttribute("listaCompra", listaCompra);
        return "details.jsp";
    }
    @GetMapping("/search")
	public String search(Model model, @RequestParam("busqueda")String busqueda) {
		List<Beat> searchword = beatService.busqueda(busqueda); 
		model.addAttribute("searchword", searchword);
		model.addAttribute("artist", busqueda);
		return "search.jsp";
	}
}

