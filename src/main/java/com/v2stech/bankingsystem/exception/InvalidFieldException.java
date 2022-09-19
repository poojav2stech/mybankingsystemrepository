package com.v2stech.bankingsystem.exception;



import org.springframework.validation.*;

public class InvalidFieldException extends BindException {

	public InvalidFieldException(BindingResult result) {
		super(result);

	}
	
	

}
