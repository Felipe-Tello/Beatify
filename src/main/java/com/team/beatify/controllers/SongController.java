package com.team.beatify.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.Message;
import com.team.beatify.models.User;
import com.team.beatify.services.BeatService;
import com.team.beatify.services.CategoryService;
import com.team.beatify.services.MessageService;
import com.team.beatify.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SongController {

    private final BeatService beatService;
    private final UserService userService;
    private final CategoryService categoryService;
    private final MessageService messageService;

    public SongController(BeatService beatService, UserService userService, CategoryService categoryService, MessageService messageService) {
        this.beatService = beatService;
        this.userService = userService;
        this.categoryService = categoryService;
        this.messageService = messageService;
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // VER CANCION//
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/song/{idSong}")
    public String showBeat(@ModelAttribute("messageModel") Message message, @PathVariable("idSong") Long idSong, Model model, Principal principal, RedirectAttributes flash){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(idSong);
        if(beat == null) {
            flash.addFlashAttribute("errorSong", "Beat no encontrado");
            return "redirect:/dashboard";
        }
        List<Message> listaMessages = beat.getListaMessagesFromBeat();
        String dataString = "";
        for (Message message2 : listaMessages) {
            dataString += message2.getUser().getFirstName()+": "+message2.getComment()+ "\n";
        }
        model.addAttribute("data", dataString);
        model.addAttribute("beat", beat);
        setUserActualYCategoriasYPermiso(userActual, model);
        return "showSong.jsp";
    }
    @PostMapping("/song/{idSong}")
    public String showBeat(@Valid @ModelAttribute("messageModel") Message message, BindingResult result, @PathVariable("idSong") Long idSong, Principal principal, RedirectAttributes flash){
        User userActual = userService.findByEmail(principal.getName());
        Beat beat = beatService.findThingById(idSong);

            if(result.hasErrors()) {
                flash.addFlashAttribute("errorMensaje", "Error al enviar el mensaje");
                return "redirect:/song/"+beat.getId();
            }
        message.setBeat(beat);
        message.setUser(userActual);
        messageService.createOrUpdateThing(message);
        return "redirect:/song/"+beat.getId();
    }

    //editar cancion
    @GetMapping("/song/{songid}/edit")
    public String editSongPage(Principal principal, Model model, @PathVariable("songid") Long songId, HttpSession session) {

        Beat beat = beatService.findThingById(songId);
        User usuarioLogeado = encontrarUsuario(principal);

        if(beat == null || beat.getuCreador().getId() != usuarioLogeado.getId()) {
            return "redirect:/dashboard";
        }
        session.setAttribute("beatCategories", beat.getCategories());
        model.addAttribute("beat", beat);
        model.addAttribute("idBeat", beat.getId()); //para el boton de volver atras
        setUserActualYCategoriasYPermiso(usuarioLogeado, model);
        return "editSong.jsp";
    }

    //campos editables: titulo, costo, añadir categorias?
    @PutMapping("/song/{songid}/edit")
    public String editSong(@Valid @ModelAttribute("beat") Beat beat, BindingResult result, @PathVariable("songid") Long songId, Model model, Principal principal, HttpSession session) {

        Beat beatUpdated = beatService.findThingById(songId);
        User usuarioLogeado = encontrarUsuario(principal);

        if(result.hasErrors() || beat.getCategories().size() <= 0) {
            setUserActualYCategoriasYPermiso(usuarioLogeado, model);
            model.addAttribute("error", "Por favor, verifique los campos");
            model.addAttribute("idBeat", beatUpdated.getId());
            return "editSong.jsp";
        }

        else {
            beatUpdated.setTitle(beat.getTitle());
            beatUpdated.setCost(beat.getCost());
            beatUpdated.setCategories(beat.getCategories());
            beatService.createOrUpdateThing(beatUpdated);
            return "redirect:/song/" + songId;
        }
    }

    @GetMapping("/song/new")
    public String upload(@ModelAttribute("modelBeat") Beat beat, Model model, Principal principal){
        User usuario = encontrarUsuario(principal);
        User userActual = userService.findByEmail(principal.getName());
        setUserActualYCategoriasYPermiso(userActual, model);
        setUserYCategorias(model, usuario);
        setUserActualYCategoriasYPermiso(userActual, model);
        return "addSongs.jsp";
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @PostMapping("/song/new")
    public String uploadBeat(@Valid @ModelAttribute("modelBeat")Beat beat, BindingResult result, @RequestParam("file") MultipartFile file, @RequestParam("fileImage") MultipartFile fileImage, Principal principal, Model model, RedirectAttributes flash){
        User user = userService.findByEmail(principal.getName());

        if(result.hasErrors() || file.isEmpty() || beat.getCategories().size() <= 0) {
            model.addAttribute("error", "Por favor, verifique los campos");
            setUserYCategorias(model, user);
            setUserActualYCategoriasYPermiso(user, model);
            return "addSongs.jsp";

        }
      
        else {
            // subir cancion
            String url = "beats/"+user.getId()+"/";
            beatService.uploadBeat(user, file, url);
            Beat beatNew = beatService.createOrUpdateThing(beat);
            beatNew.setuCreador(user); 
            beatNew.setUrl(url+file.getOriginalFilename());
            // subir imagen

            if(fileImage.isEmpty() == false) {
                String urlImage = "beatsImage/"+user.getId()+"/";
                beatService.uploadBeatImage(fileImage, urlImage);
                beatNew.setImageUrl(urlImage+fileImage.getOriginalFilename());
            }
            // guardar beat
            beatService.createOrUpdateThing(beatNew);
            flash.addFlashAttribute("subido", "¡Beat subido exitosamente!");
            return "redirect:/profile/"+user.getId();
        } 
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

    public User encontrarUsuario(Principal principal) {
        String email = principal.getName();
        User user = userService.findByEmail(email);
        return user;
    }

    public void setUserYCategorias(Model model, User user) {
        List<Category> listaCategories = categoryService.allThings();
        model.addAttribute("listaCategories", listaCategories);
        model.addAttribute("usuario", user);
    }

    public void setUserActualYCategoriasYPermiso(User usuario, Model model) {
        List<Category> listaCategories = categoryService.allThings();
        model.addAttribute("listaCategories", listaCategories);
        model.addAttribute("userActual", usuario);

        if(userService.hasAdmin(usuario)) {
            model.addAttribute("permiso", true);
        }
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

    // @PostMapping("/song/new")
    // public String handleFileUpload(@Valid @ModelAttribute("modelBeat")Beat beat, BindingResult result, @RequestParam("file") MultipartFile file, Principal principal, Model model){
    //     User user = userService.findByEmail(principal.getName());

    //     if(result.hasErrors() || file.isEmpty() || beat.getCategories().size() <= 0) {
    //         model.addAttribute("error", "Por favor, verifique los campos");
    //         setUserYCategorias(model, user);
    //         return "addSongs.jsp";
    //     }

    //     else {
    //         String name = file.getOriginalFilename();
    //         Path directorioImg = Paths.get("src/main/resources/static/users/user");
    //         String ruta = directorioImg.toFile().getAbsolutePath() +user.getId();
    //         File directorio = new File(ruta);
    //         if(directorio.exists() == false){ 
    //             directorio.mkdirs(); 
    //         }
    //         try {
    //             byte[] bytes = file.getBytes();
    //             BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath() +"/"+ name)));
    //             stream.write(bytes);
    //             stream.close();
    //             Beat beatNew = beatService.createOrUpdateThing(beat);
    //             beatNew.setuCreador(user); 
    //             beatNew.setUrl("/users/user"+user.getId()+"/"+ name);
    //             beatService.createOrUpdateThing(beatNew);
    //             return "redirect:/profile/"+user.getId();
    //         } catch (Exception e) {
    //             return "You failed to upload  => " + e.getMessage();
    //             // model.addAttribute("listaCategories", listaCategories);
    //             // model.addAttribute("error", e.getMessage());
    //             // return "addSongs.jsp";
    //         }
    //     } 
    // }
