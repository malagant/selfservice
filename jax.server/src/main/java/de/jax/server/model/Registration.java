package de.jax.server.model;


import javax.persistence.Entity;
import java.io.Serializable;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;
import javax.persistence.Version;
import java.lang.Override;
import javax.xml.bind.annotation.XmlRootElement;@XmlRootElement @Entity public class Registration implements java.io.Serializable {



	@Column
	@Id
	private String username;

	public String getUsername() {
		return this.username;
	}

	public void setUsername(final String username) {
		this.username = username;
	}

	@Column
	private String password;

	public String getPassword() {
		return this.password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public String toString() {
		String result = "";
		if (username != null && !username.trim().isEmpty())
			result += username;
		if (password != null && !password.trim().isEmpty())
			result += " " + password;
		return result;
	} }