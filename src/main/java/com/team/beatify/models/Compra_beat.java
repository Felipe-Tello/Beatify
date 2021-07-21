package com.team.beatify.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter @Getter @NoArgsConstructor @AllArgsConstructor
@Table(name = "compras_beats")
public class Compra_beat extends BaseModel{
    
    //este sería el precio actual del beat
    private int precio;

    //relaciones

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="compra_id")
    private Compra compra;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="beat_id")
    private Beat beat;

}
