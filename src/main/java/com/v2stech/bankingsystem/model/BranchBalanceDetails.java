package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class BranchBalanceDetails {
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	private String ifsc;

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

}
