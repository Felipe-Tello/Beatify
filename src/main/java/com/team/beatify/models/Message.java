package com.team.beatify.models;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter @Getter @NoArgsConstructor @AllArgsConstructor
@Table (name = "messages")
public class Message extends BaseModel{
    
    //ver mensajes predeterminados
    @NotNull(message = "El campo no puede ser nulo")
    @NotBlank(message = "El campo no puede estar en blanco")
    @Size(min = 1, max = 255, message = "Debe tener entre 1 y 255 caracteres")
    private String comment;

    //relaciones etc...
}
