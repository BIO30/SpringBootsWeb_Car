package com.poly.entity;

import java.io.Serializable;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "Verifyaccounts")
public class Verifyaccounts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idverify")
    private Integer idVerify;

    @Column(name = "email")
    private String email;

    @Column(name = "Verifycode")
    private String verifycode;

    @OneToOne
    @JoinColumn(name = "email", referencedColumnName = "email", insertable = false, updatable = false)
    private Users user;

	public Verifyaccounts(Integer idVerify, String email, String verifycode, Users user) {
		super();
		this.idVerify = idVerify;
		this.email = email;
		this.verifycode = verifycode;
		this.user = user;
	}

	public Verifyaccounts() {
		super();
	}

	public Integer getIdVerify() {
		return idVerify;
	}

	public void setIdVerify(Integer idVerify) {
		this.idVerify = idVerify;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVerifycode() {
		return verifycode;
	}

	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

    // Constructors, getters, setters, and other methods
    
}
