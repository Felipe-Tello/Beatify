package com.team.beatify.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.team.beatify.models.Category;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.CategoryRepository;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CategoryService extends BaseService <Category>{
    
    private final CategoryRepository categoryRepository;

    public CategoryService(BaseRepository<Category> baseRepository, CategoryRepository categoryRepository) {
        super(baseRepository);
        this.categoryRepository = categoryRepository;
    }
    public void uploadCategoryImage(MultipartFile file, String url){
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
