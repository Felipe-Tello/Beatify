package com.team.beatify.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter @Getter @NoArgsConstructor @AllArgsConstructor
@Table(name = "compras")
public class Compra extends BaseModel {
    
    //precio minimo pa pagar?
    @NotNull(message = "El campo no puede ser nulo")
    private int total;

    
	//----------------------------------------------------------------------------------------//

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="uComprador_id")
    private User uComprador;

    //relacion compras_beats
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "compras_beats", 
        joinColumns = @JoinColumn(name = "compra_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )
    private List<Beat> beats;



    //----------------------------------------------------------------------------------------//

    
}

