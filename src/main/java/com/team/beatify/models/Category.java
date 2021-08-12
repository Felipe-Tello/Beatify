package com.team.beatify.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "categories")
public class Category extends BaseModel{

    @NotNull(message = "El campo no puede ser nulo")
    @NotBlank(message = "Este campo es obligatorio")
	@Size(max = 200,message = "Debe tener máximo 200 caracteres")
    private String genero;

    private String url;

    //----------------------------------------------------------------------------------------//

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "beats_category", 
        joinColumns = @JoinColumn(name = "category_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )
    private List<Beat> beats;

    //----------------------------------------------------------------------------------------//

    public Category() {
    }

    public Category(@NotNull String genero, String url, List<Beat> beats) {
        this.genero = genero;
        this.beats = beats;
        this.url = url;
    }

    //----------------------------------------------------------------------------------------//

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public List<Beat> getBeats() {
        return beats;
    }

    public void setBeats(List<Beat> beats) {
        this.beats = beats;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
}
