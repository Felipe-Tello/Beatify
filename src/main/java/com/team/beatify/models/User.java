package com.team.beatify.models;

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
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
@NoArgsConstructor @AllArgsConstructor @Getter @Setter
public class User extends BaseModel{
	
	@NotBlank(message = "not blank")
	@Size(min = 5,max = 200,message = "size")
	private String firstName;
    @NotBlank(message = "not blank")
    @Size(min = 5,max = 200,message = "size")
    private String lastName;
    @NotNull(message = "not null")
    private String region;
	@NotBlank(message = "not blank")
	@Email(message = "mail")
	private String email;
	@NotBlank(message = "n")
	@Size( min = 8, max = 200, message = "size")
	private String password;
	@Transient
	private String passwordConfirmation;

}