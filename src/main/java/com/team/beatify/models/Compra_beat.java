package com.team.beatify.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "compras_beats")
public class Compra_beat extends BaseModel{
    
    //este sería el precio actual del beat
    private int precio;

    //----------------------------------------------------------------------------------------//
    //relaciones
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="compra_id")
    private Compra compra;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="beat_id")
    private Beat beat;

    //----------------------------------------------------------------------------------------//

    public Compra_beat() {
    }

    public Compra_beat(int precio, Compra compra, Beat beat) {
        this.precio = precio;
        this.compra = compra;
        this.beat = beat;
    }

    //----------------------------------------------------------------------------------------//

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Beat getBeat() {
        return beat;
    }

    public void setBeat(Beat beat) {
        this.beat = beat;
    }
}
