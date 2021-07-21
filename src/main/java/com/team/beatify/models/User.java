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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor @AllArgsConstructor @Getter @Setter
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User extends BaseModel{
	@NotBlank(message = "El campo no puede estar en blanco")
	@Size(min = 5,max = 200,message = "size")
	private String firstName;

    @NotBlank(message = "El campo no puede estar en blanco")
    @Size(min = 5,max = 200,message = "size")
    private String lastName;

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
	private List<Beat> BeatsDelCreador;

	//----------------------------------------------------------------------------------------//
	//relacion n:m users-beats
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "respects", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "beat_id")
    )     
    private List<Beat> beats;
}