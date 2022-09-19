package com.v2stech.bankingsystem.model;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginCredentials {
	@NotEmpty(message = "Cust id Can not be empty")
	// @Pattern(regexp="^[0-9]*$",message="only numeric are allowed")
	private String custId;
	@NotEmpty(message = "Password Can not be empty")
	private String password;
	private String role;

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
