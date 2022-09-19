package com.v2stech.bankingsystem.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v2stech.bankingsystem.dao.BankAdminImplementationDao;
import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.model.AddBranchDetails;
import com.v2stech.bankingsystem.model.BranchBalanceDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.CustomerDetails;
import com.v2stech.bankingsystem.model.ShowTransaction;

@Service
public class BankAdminService {
	@Autowired
	BankAdminImplementationDao daobj;

	public BranchDetails getIfsc(BranchDetails branch) throws SQLException, InvalidCredentialsException {
		return daobj.getIfsc(branch);
	}

	public String getBranchBalance(BranchBalanceDetails branch) throws SQLException {
		return daobj.getBranchBalance(branch);

	}

	public List<CustomerDetails> getCustomerDetailsForUpdationByAdmin(int id) throws SQLException {
		return daobj.getCustomerDetailsForUpdationByAdmin(id);
	}

	public List<ShowTransaction> showTransactionMonthYearWise(ShowTransaction showtransaction)
			throws SQLException, InvalidCredentialsException {
		return daobj.showTransactionMonthYearWise(showtransaction);
	}

	public List<CustomerDetails> getCustomer(CustomerDetails showCustomer) throws SQLException {
		return daobj.getCustomer(showCustomer);
	}

	public void addNewBranch(AddBranchDetails branch) throws SQLException, InvalidCredentialsException {
		daobj.addNewBranch(branch);
	}
}
