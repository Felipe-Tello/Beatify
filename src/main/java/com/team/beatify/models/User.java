package com.team.beatify.models;

import java.util.List;

import javax.persistence.*;
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

	@OneToMany(mappedBy="uComprador", fetch = FetchType.LAZY)
	private List<Compra> listaDeCompras;

	//----------------------------------------------------------------------------------------//

}