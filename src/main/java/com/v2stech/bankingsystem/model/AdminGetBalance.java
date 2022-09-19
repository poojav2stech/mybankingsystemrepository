package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class AdminGetBalance {
	@NotBlank(message="cannot be blank")
	@Pattern(regexp="^[0-9]*$",message="only digits are allowed")  
	private String ifscCode;

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	
}
