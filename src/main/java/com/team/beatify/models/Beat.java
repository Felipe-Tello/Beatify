package com.team.beatify.models;

import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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

    //relacion n:m beats-users RESPECT
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "respects", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )     
    private Set<User> usersLike;

    //relacion n:m beats-users MENSAJES
    @OneToMany(mappedBy="beat", fetch = FetchType.LAZY)
	private List<Message> listaMessagesFromBeat;
    // @ManyToMany(fetch = FetchType.LAZY)
    // @JoinTable(
    //     name = "messages", 
    //     joinColumns = @JoinColumn(name = "beat_id"), 
    //     inverseJoinColumns = @JoinColumn(name = "user_id")
    // )
    // private List<User> userMessages;

    //relacion n:m beats-users WISHLIST
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "wishlists", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> wishlistuser;

    //relacion n:m beats-users COMPRAS
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "details", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "compra_id")
    )
    private List<Compra> compras;

    //relacion n:m beats-users CATEGORIAS
    @NotNull(message = "El campo no puede ser nulo")
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "beats_category", 
        joinColumns = @JoinColumn(name = "beat_id"), 
        inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private List<Category> categories;

    //----------------------------------------------------------------------------------------//

    public Beat() {
    }

    public Beat(String title, int cost, String url, User uCreador, Set<User> usersLike, List<Message> listaMessagesFromBeat, List<User> wishlistuser, List<Compra> compras, List<Category> categories) {
        this.title = title;
        this.cost = cost;
        this.url = url;
        this.uCreador = uCreador;
        this.usersLike = usersLike;
        this.listaMessagesFromBeat = listaMessagesFromBeat;
        this.wishlistuser = wishlistuser;
        this.compras = compras;
        this.categories = categories;
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

    public Set<User> getUsersLike() {
        return usersLike;
    }

    public void setUsersLike(Set<User> usersLike) {
        this.usersLike = usersLike;
    }

    public void setUsersLike(User user) {
        this.usersLike.add(user);
    }

    public List<Message> getListaMessagesFromBeat() {
        return listaMessagesFromBeat;
    }

    public void setListaMessagesFromBeat(List<Message> listaMessagesFromBeat) {
        this.listaMessagesFromBeat = listaMessagesFromBeat;
    }

    public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }
    public List<User> getWishlistuser() {
        return wishlistuser;
    }

    public void setWishlistuser(List<User> wishlistuser) {
        this.wishlistuser = wishlistuser;
    }
    
    public void setWishlistuser(User user) {
        this.wishlistuser.add(user);
    }
}   
