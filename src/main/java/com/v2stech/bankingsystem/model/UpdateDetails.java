package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UpdateDetails {
	@NotBlank(message = "cannot be blank")
	private String address1;
	@NotBlank(message = "cannot be blank")
	private String address2;
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	@Size(min = 10, max = 10, message = "contact should be of 10 digits")
	private String contact;
	@NotBlank(message = "cannot be blank")
	@Size(min = 8, max = 8, message = "password should be of 8 digits")
	private String password;
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[a-z]+[a-z0-9.+]+@[A-Za-z]+[.]{1}[A-Za-z]{2,}$", message = "email is not in proper format")
	private String email;

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
