package com.team.beatify.models;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter @Getter @NoArgsConstructor @AllArgsConstructor
@Table(name = "beats")
public class Beat extends BaseModel{

    //ver qué tipo de mensajes predeterminados tendremos
    
    @NotNull(message = "El campo no puede ser nulo")
    @NotBlank(message = "El campo no puede estar en blanco")
    private String title;

    @NotNull(message = "El campo no puede ser nulo")
    @Min(5000)
    private int cost;

    //es un campo que se asigna desde el usuario? o en el servidor por interno? 
    @NotNull(message = "El campo no puede ser nulo")
    private String url;

    //relaciones etc..
}
