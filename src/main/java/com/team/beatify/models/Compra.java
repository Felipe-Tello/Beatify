package com.team.beatify.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "compras")
public class Compra extends BaseModel {
    
    //precio minimo pa pagar?
    @NotNull(message = "El campo no puede ser nulo")
    private int total;

    private String fecha;

    
	//----------------------------------------------------------------------------------------//
    //relacion n:1 users
    @ManyToOne(fetch = FetchType.LAZY )
    @JoinColumn(name="uComprador_id")
    private User uComprador;

    //relacion compras_beats
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
        name = "details", 
        joinColumns = @JoinColumn(name = "compra_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )
    private List<Beat> beats;

    //----------------------------------------------------------------------------------------//

    public Compra() {
    }

    public Compra(@NotNull(message = "El campo no puede ser nulo") int total, String fecha, User uComprador, List<Beat> beats) {
        this.total = total;
        this.uComprador = uComprador;
        this.beats = beats;
        this.fecha = fecha;
    }

    //----------------------------------------------------------------------------------------//

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public User getuComprador() {
        return uComprador;
    }

    public void setuComprador(User uComprador) {
        this.uComprador = uComprador;
    }

    public List<Beat> getBeats() {
        return beats;
    }

    public void setBeats(List<Beat> beats) {
        this.beats = beats;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}

