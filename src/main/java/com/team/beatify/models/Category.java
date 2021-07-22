package com.team.beatify.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "categories")
public class Category extends BaseModel{

    @NotNull
    private String genero;

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

    public Category(@NotNull String genero, List<Beat> beats) {
        this.genero = genero;
        this.beats = beats;
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
}
