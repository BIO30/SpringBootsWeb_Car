package com.poly.entity;

import java.io.Serializable;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "Users")
@Data
public class Users implements Serializable {
	@Id
	@Column(name = "email", length = 100)
	private String email;

	@Column(name = "username", nullable = false, length = 100)
	private String username;

	@Column(name = "password", nullable = false, length = 100)
	private String password;

	@Column(name = "role")
	private Boolean role;

	@Column(name = "activated")
	private Boolean activated;

	// Constructors, getters, setters
}
