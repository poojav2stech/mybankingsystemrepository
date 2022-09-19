package com.v2stech.bankingsystem.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class TransferTo {

	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	private String transactionToAccountNumber;
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[a-zA-Z]+$", message = "only alphabets are allowed")
	private String transactionToCustomerName;
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	private String ifscCode;
	private String branchName;
	private String transactionVia;
	private String transactionType;
	private String transactionFrom;
	@NotBlank(message = "cannot be blank")
	@Pattern(regexp = "^[0-9]*$", message = "only digits are allowed")
	private String amount;

	public String getTransactionToAccountNumber() {
		return transactionToAccountNumber;
	}

	public void setTransactionToAccountNumber(String transactionToAccountNumber) {
		this.transactionToAccountNumber = transactionToAccountNumber;
	}

	public String getTransactionToCustomerName() {
		return transactionToCustomerName;
	}

	public void setTransactionToCustomerName(String transactionToCustomerName) {
		this.transactionToCustomerName = transactionToCustomerName;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getTransactionVia() {
		return transactionVia;
	}

	public void setTransactionVia(String transactionVia) {
		this.transactionVia = transactionVia;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getTransactionFrom() {
		return transactionFrom;
	}

	public void setTransactionFrom(String transactionFrom) {
		this.transactionFrom = transactionFrom;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

}
