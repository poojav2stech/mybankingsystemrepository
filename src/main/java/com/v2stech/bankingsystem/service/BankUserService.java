package com.v2stech.bankingsystem.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v2stech.bankingsystem.dao.BankUserImplementationDao;
import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.model.AccountDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.CustomerDetails;
import com.v2stech.bankingsystem.model.LoginCredentials;
import com.v2stech.bankingsystem.model.TransactionDetails;
import com.v2stech.bankingsystem.model.TransferTo;
import com.v2stech.bankingsystem.model.UpdateDetails;

@Service
public class BankUserService {
	@Autowired
	BankUserImplementationDao daobj;

	public boolean login(LoginCredentials loginCredentials) throws SQLException {
		return daobj.login(loginCredentials);
	}

	public LoginCredentials getDataAfterLogin(LoginCredentials userCreds) throws SQLException {
		return daobj.getDataAfterLogin(userCreds);
	}

	public List<AccountDetails> getAccountNo(String id) throws SQLException {
		return daobj.getAccountNo(id);
	}

	public CustomerDetails getCustomerDetails(String id) throws SQLException {
		return daobj.getCustomerDetails(id);
	}

	public CustomerDetails getCustomerDetails() throws SQLException {
		return daobj.getCustomerDetails();
	}

	public List<AccountDetails> getAccountNo() throws SQLException {
		return daobj.getAccountNo();
	}

	public CustomerDetails getCustomerDetailsForUpdate() throws SQLException {
		return daobj.getCustomerDetailsForUpdate();
	}

	public void updateChanges(UpdateDetails update) throws SQLException {
		daobj.updateChanges(update);
	}

	public List<TransferTo> getTransactionType() throws SQLException {
		return daobj.getTransactionType();
	}

	public List<TransactionDetails> getTransactionalHistory() throws SQLException {
		return daobj.getTransactionalHistory();
	}

	public BranchDetails getIfscCode(TransferTo transfer) throws SQLException, InvalidCredentialsException {
		return daobj.getIfscCode(transfer);
	}

	public AccountDetails getBalance(AccountDetails account) throws SQLException {
		return daobj.getBalance(account);
	}

	public void transfer(TransferTo transfer) throws SQLException, InvalidCredentialsException {
		daobj.transfer(transfer);
	}

	public List<BranchDetails> getBranchName(TransferTo transfer) throws SQLException {
		return daobj.getBranchName(transfer);
	}

}
