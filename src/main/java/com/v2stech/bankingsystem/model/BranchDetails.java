package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class BranchDetails {
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	private String ifscCode;
	@NotBlank(message = "cannot be blank")
	private String branchAddress1;
	@NotBlank(message = "cannot be blank")
	private String branchAddress2;

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public String getBranchAddress1() {
		return branchAddress1;
	}

	public void setBranchAddress1(String branchAddress1) {
		this.branchAddress1 = branchAddress1;
	}

	public String getBranchAddress2() {
		return branchAddress2;
	}

	public void setBranchAddress2(String branchAddress2) {
		this.branchAddress2 = branchAddress2;
	}

}
