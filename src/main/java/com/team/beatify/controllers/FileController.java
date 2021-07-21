package com.team.beatify.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FileController {
    
    @GetMapping("/uploadFile")
    public String upload(){
        return "addSongs.jsp";
    }
    @PostMapping("/uploadFile")
    public @ResponseBody String handleFileUpload(@RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            String name = file.getOriginalFilename();
            Path directorioImg = Paths.get("src//main//resources//static/images");
            String ruta = directorioImg.toFile().getAbsolutePath() + " 2";
            // String name = file.getOriginalFilename();
            // File directorio1 = new File("/beats/" + "1");  //1 es el id del usuario 
            File directorio = new File(ruta);
            if(directorio.exists() == false){ 
                directorio.mkdir(); 
            }
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio +"/"+ name)));
                // BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(name)));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded  !";
            } catch (Exception e) {
                return "You failed to upload  => " + e.getMessage();
            }
        } else {
            return "You failed to upload because the file was empty.";
        }
    }
}
