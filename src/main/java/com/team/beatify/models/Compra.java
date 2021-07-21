package com.team.beatify.models;

import javax.persistence.Entity;
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

    
    
}
