package com.team.beatify.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User extends BaseModel{
	@NotBlank(message = "El nombre no puede estar en blanco")
	@Size(min = 2,max = 200,message = "El nombre debe tener entre 2 y 200 caracteres")
	private String firstName;

    @NotBlank(message = "El apellido no puede estar en blanco")
    @Size(min = 2,max = 200,message = "El apellido debe tener entre 2 y 200 caracteres")
    private String lastName;

	//?
	@NotBlank(message = "La ciudad no puede estar en blanco")
	@Size(min = 3,max = 200,message = "La cuidad debe tener entre 3 y 200 caracteres")
	private String location;

    @NotNull(message = "Debe seleccionar una región")
    private String region;

	@NotBlank(message = "El email no puede estar en blanco")
	@Email(message = "Debe ingresar un Email valido")
	private String email;

	@NotBlank(message = "El campo contraseña no puede estar en blanco")
	@Size( min = 8, max = 200, message = "La contraseña debe tener entre 8 y 200 caracteres")
	private String password;

	@Transient
	private String passwordConfirmation;

	//opcional
	//debería tener un tamaño máximo?
	private String descripcion;

	private String url;

	///ROLES USUARIO--------------------------------------------------------------------------------//
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "rol_id"))
    private List<Rol> roles;
  
	//----------------------------------------------------------------------------------------//
	//relacion 1:n compras//
	@OneToMany(mappedBy="uComprador", fetch = FetchType.LAZY)
	private List<Compra> listaDeCompras;

	//mensajes¿?

	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Message> listaMessagesFromUsers;

	// @ManyToMany(fetch = FetchType.LAZY)
    // @JoinTable(
    //     name = "messages", 
    //     joinColumns = @JoinColumn(name = "user_id"), 
    //     inverseJoinColumns = @JoinColumn(name = "beat_id")
    // )
    // private List<Beat> beatsMessages;

	//----------------------------------------------------------------------------------------//
	//relacion 1:n beats//
	@OneToMany(mappedBy="uCreador", fetch = FetchType.LAZY)
	private List<Beat> beatsDelCreador;

	//----------------------------------------------------------------------------------------//
	//relacion n:m users-beats
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "respects", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )     
    private List<Beat> beatsLike;

	//----------------------------------------------------------------------------------------//
	//relacion n:m users-beats
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "wishlists", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )     
    private List<Beat> wishlistbeats;

	//----------------------------------------------------------------------------------------//

	public User() {
	}

	public User(String firstName, String lastName, String location, String region, String email, String password, String passwordConfirmation, String url, List<Compra> listaDeCompras, List<Message> listaMessagesFromUsers, List<Beat> beatsDelCreador, List<Beat> beatsLike, List<Beat> wishlistbeats) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.location = location;
		this.region = region;
		this.email = email;
		this.password = password;
		this.passwordConfirmation = passwordConfirmation;
		this.listaDeCompras = listaDeCompras;
		this.listaMessagesFromUsers = listaMessagesFromUsers;
		this.beatsDelCreador = beatsDelCreador;
		this.beatsLike = beatsLike;
		this.wishlistbeats = wishlistbeats;
		this.url = url;
	}

	//----------------------------------------------------------------------------------------//

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public List<Compra> getListaDeCompras() {
		return listaDeCompras;
	}

	public void setListaDeCompras(List<Compra> listaDeCompras) {
		this.listaDeCompras = listaDeCompras;
	}

	public List<Message> getlistaMessagesFromUsers() {
		return listaMessagesFromUsers;
	}

	public void setlistaMessagesFromUsers(List<Message> listaMessagesFromUsers) {
		this.listaMessagesFromUsers = listaMessagesFromUsers;
	}

	public List<Beat> getBeatsDelCreador() {
		return beatsDelCreador;
	}

	public void setBeatsDelCreador(List<Beat> beatsDelCreador) {
		this.beatsDelCreador = beatsDelCreador;
	}

	public List<Beat> getBeatsLike() {
		return beatsLike;
	}

	public void setBeatsLike(List<Beat> beatsLike) {
		this.beatsLike = beatsLike;
	}

	public List<Rol> getRoles() {
		return roles;
	}

	public void setRoles(List<Rol> roles) {
		this.roles = roles;
	}	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Beat> getWishlistbeats() {
		return wishlistbeats;
	}

	public void setWishlistbeats(List<Beat> wishlistbeats) {
		this.wishlistbeats = wishlistbeats;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Message> getListaMessagesFromUsers() {
		return listaMessagesFromUsers;
	}

	public void setListaMessagesFromUsers(List<Message> listaMessagesFromUsers) {
		this.listaMessagesFromUsers = listaMessagesFromUsers;
	}	
	
}