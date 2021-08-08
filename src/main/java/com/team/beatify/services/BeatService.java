package com.team.beatify.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;
import com.team.beatify.models.User;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.BeatRepository;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class BeatService extends BaseService <Beat> {

    private final BeatRepository beatRepository;
    
    public BeatService(BaseRepository<Beat> baseRepository, BeatRepository beatRepository) {
        super(baseRepository);
        this.beatRepository = beatRepository;
    }
    public List<Beat> busqueda(String busqueda) {
        return beatRepository.findByTitleOrUCreatorContaining(busqueda);
    }
    public List<Beat> listaDeBeatsAsc(){
		return beatRepository.findAllByOrderByIdDesc();
	}
    public List<Beat> beatsCategorias(Category category){
        return beatRepository.findByCategoriesContaining(category);
    }
    public void uploadBeat(User user, MultipartFile file, String url){
        File folder = new File(url);
        System.out.println(url);
        if (folder.exists() == false) {
            folder.mkdirs();
            System.out.println("directorios creados");
        }
        byte[] bytes;
        try {
            bytes = file.getBytes();
            // Path path = Paths.get(folder.getAbsolutePath()+"/"+file.getOriginalFilename());
            // Files.write(path, bytes); 
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(folder.getAbsolutePath() + "/" + file.getOriginalFilename())));                    
            stream.write(bytes);                     
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
            
        }
    }
    public void uploadBeatImage(MultipartFile file, String url){
        File folder = new File(url);
        System.out.println(url);
        if (folder.exists() == false) {
            folder.mkdirs();
            System.out.println("directorios creados");
        }
        byte[] bytes;
        try {
            bytes = file.getBytes();
            // Path path = Paths.get(folder.getAbsolutePath()+"/"+file.getOriginalFilename());
            // Files.write(path, bytes); 
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(folder.getAbsolutePath() + "/" + file.getOriginalFilename())));                    
            stream.write(bytes);                     
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
