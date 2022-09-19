package com.v2stech.bankingsystem.model;

public class TransactionDetails // extends ShowTransaction
{
	private String transactionId;
	private String transactionTypeId;
	private String transactionAmount;
	private String transactionFrom;
	private String transactionTo;
	private String transactionDate;
	private String transactionStatusId;
	private String transactionStatus;
	private String transactionType;
	private String customerId;

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionTypeId() {
		return transactionTypeId;
	}

	public void setTransactionTypeId(String transactionTypeId) {
		this.transactionTypeId = transactionTypeId;
	}

	public String getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(String transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public String getTransactionFrom() {
		return transactionFrom;
	}

	public void setTransactionFrom(String transactionFrom) {
		this.transactionFrom = transactionFrom;
	}

	public String getTransactionTo() {
		return transactionTo;
	}

	public void setTransactionTo(String transactionTo) {
		this.transactionTo = transactionTo;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getTransactionStatusId() {
		return transactionStatusId;
	}

	public void setTransactionStatusId(String transactionStatusId) {
		this.transactionStatusId = transactionStatusId;
	}

	public String getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

}
