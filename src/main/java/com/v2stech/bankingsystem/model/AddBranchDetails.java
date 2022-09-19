package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class AddBranchDetails {
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	@Size(min = 6, max = 6, message = "zipcode length must be 6")
	private String zipcode;
	@NotBlank(message = "cannot be blank")
	private String branchaddress1;
	@NotBlank(message = "cannot be blank")
	private String branchaddress2;
	private String micrNo;

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getBranchaddress1() {
		return branchaddress1;
	}

	public void setBranchaddress1(String branchaddress1) {
		this.branchaddress1 = branchaddress1;
	}

	public String getBranchaddress2() {
		return branchaddress2;
	}

	public void setBranchaddress2(String branchaddress2) {
		this.branchaddress2 = branchaddress2;
	}

	public String getMicrNo() {
		return micrNo;
	}

	public void setMicrNo(String micrNo) {
		this.micrNo = micrNo;
	}

}
