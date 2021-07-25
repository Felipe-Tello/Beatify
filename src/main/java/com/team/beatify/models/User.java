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
	@NotBlank(message = "El campo no puede estar en blanco")
	@Size(min = 5,max = 200,message = "size")
	private String firstName;

    @NotBlank(message = "El campo no puede estar en blanco")
    @Size(min = 5,max = 200,message = "size")
    private String lastName;

	@NotBlank(message = "El campo no puede estar en blanco")
	@Size(min = 5,max = 200,message = "size")
	private String location;

    @NotNull(message = "El campo no puede ser nulo")
    private String region;

	@NotBlank(message = "El campo no puede estar en blanco")
	@Email(message = "Debe ingresar un Email valido")
	private String email;

	@NotBlank(message = "El campo no puede estar en blanco")
	@Size( min = 8, max = 200, message = "size")
	private String password;

	@Transient
	private String passwordConfirmation;


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
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "messages", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )
    private List<Beat> beatsMessages;

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

	public User(
			String firstName, String lastName, String location, String region, String email, String password, String passwordConfirmation, List<Beat> wishlistbeats, List<Compra> listaDeCompras, List<Beat> beatsMessages,List<Beat> beatsDelCreador, List<Beat> beatsLike) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.region = region;
		this.email = email;
		this.password = password;
		this.passwordConfirmation = passwordConfirmation;
		this.listaDeCompras = listaDeCompras;
		this.beatsMessages = beatsMessages;
		this.beatsDelCreador = beatsDelCreador;
		this.beatsLike = beatsLike;
		this.location = location;
		this.wishlistbeats = wishlistbeats;
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

	public List<Beat> getBeatsMessages() {
		return beatsMessages;
	}

	public void setBeatsMessages(List<Beat> beatsMessages) {
		this.beatsMessages = beatsMessages;
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
}