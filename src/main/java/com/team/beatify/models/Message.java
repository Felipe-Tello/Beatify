package com.team.beatify.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table (name = "messages")
public class Message extends BaseModel{
    
    //ver mensajes predeterminados
    @NotNull(message = "El campo no puede ser nulo")
    @NotBlank(message = "El campo no puede estar en blanco")
    @Size(min = 1, max = 255, message = "Debe tener entre 1 y 255 caracteres")
    private String comment;

    //----------------------------------------------------------------------------------------//
    //relaciones

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="beat_id")
    private Beat beat;

    public Message() {
    }

    public Message(String comment, User user, Beat beat) {
        this.comment = comment;
        this.user = user;
        this.beat = beat;
    }

    //----------------------------------------------------------------------------------------//

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Beat getBeat() {
        return beat;
    }

    public void setBeat(Beat beat) {
        this.beat = beat;
    }
}
