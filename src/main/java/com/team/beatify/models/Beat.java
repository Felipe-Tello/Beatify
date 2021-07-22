package com.team.beatify.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


@Entity
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
    private String url;

    //----------------------------------------------------------------------------------------//
    //relacion n:1 users
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="uCreador_id")
    private User uCreador;

    //----------------------------------------------------------------------------------------//
    //relacion n:m beats-users
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "respects", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )     
    private List<User> users;

    //----------------------------------------------------------------------------------------//
    //mensajes
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "messages", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userMessages;

    //compras
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "compras_beats", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "compra_id")
    )
    private List<Compra> compras;

    //----------------------------------------------------------------------------------------//

    public Beat() {
    }

    public Beat(String title, int cost, String url, User uCreador, List<User> users, List<User> userMessages, List<Compra> compras) {
        this.title = title;
        this.cost = cost;
        this.url = url;
        this.uCreador = uCreador;
        this.users = users;
        this.userMessages = userMessages;
        this.compras = compras;
    }

    //----------------------------------------------------------------------------------------//    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public User getuCreador() {
        return uCreador;
    }

    public void setuCreador(User uCreador) {
        this.uCreador = uCreador;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<User> getUserMessages() {
        return userMessages;
    }

    public void setUserMessages(List<User> userMessages) {
        this.userMessages = userMessages;
    }

    public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }    
}   
