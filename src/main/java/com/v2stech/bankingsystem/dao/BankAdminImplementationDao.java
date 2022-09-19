package com.v2stech.bankingsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.model.AddBranchDetails;
import com.v2stech.bankingsystem.model.BranchBalanceDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.CustomerDetails;
import com.v2stech.bankingsystem.model.ShowTransaction;

@Repository
public class BankAdminImplementationDao {

	@Autowired
	private Connection connection;

	public BranchDetails getIfsc(BranchDetails branch) throws SQLException, InvalidCredentialsException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		preparedStatement = connection.prepareStatement("select *from branch where ifsc_code=?");
		preparedStatement.setString(1, branch.getIfscCode());
		resultSet = preparedStatement.executeQuery();
		if (!resultSet.isBeforeFirst()) {
			throw new InvalidCredentialsException("ifsc code doesnt exist");
		}
		while (resultSet.next()) {
			branch.setBranchAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			branch.setBranchAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
		}
		return branch;
	}

	public String getBranchBalance(BranchBalanceDetails branch) throws SQLException {
		PreparedStatement preparedStatement = null;
		ResultSet resultSet;
		String balance = null;
		preparedStatement = connection.prepareStatement(
				"select sum(act.account_balance) as sum from  account act inner join branch branch on act.ifsc_code=branch.ifsc_code where act.ifsc_code=?;");
		preparedStatement.setString(1, branch.getIfsc());
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			balance = resultSet.getString("sum");
		}
		return balance;
	}

	public List<CustomerDetails> getCustomerDetailsForUpdationByAdmin(int id) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<CustomerDetails> customerList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("select *from customer where customer_id=?");
		preparedStatement.setInt(1, id);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			CustomerDetails customer = new CustomerDetails();
			customer.setName(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			customer.setAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			customer.setAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			customer.setContact(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			customer.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			customer.setEmail(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
			customerList.add(customer);
		}
		return customerList;
	}

	public List<ShowTransaction> showTransactionMonthYearWise(ShowTransaction showtransaction)
			throws SQLException, InvalidCredentialsException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		boolean status = false;
		List<CustomerDetails> customerList;
		List<ShowTransaction> showTransactionList = new ArrayList<>();
		customerList = getCustomerForTransactionDate();
		for (CustomerDetails customer : customerList) {
			System.out.println("custid" + customer.getCustId());
			if (customer.getCustId().equals(showtransaction.getCustId())) {
				status = true;
			}
		}
		if (!status) {
			throw new InvalidCredentialsException("cust id doesnt exist");
		}
		preparedStatement = connection.prepareStatement(
				"select  *from transaction where month(transction_date)=? and year(transction_date)=? and customer_id=?;");
		preparedStatement.setString(1, showtransaction.getMonth());
		preparedStatement.setString(2, showtransaction.getYear());
		preparedStatement.setString(3, showtransaction.getCustId());
		resultSet = preparedStatement.executeQuery();
		if (!resultSet.isBeforeFirst()) {
			throw new InvalidCredentialsException("data not found");
		}
		while (resultSet.next()) {
			showtransaction.setTransactionId(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			showtransaction.setTransactionAmount(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			showtransaction.setTransactionDate(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			showTransactionList.add(showtransaction);
		}
		return showTransactionList;
	}

	private List<CustomerDetails> getCustomerForTransactionDate() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<CustomerDetails> customerList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("SELECT *FROM customer where role=?");
		preparedStatement.setString(1, "c");
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			CustomerDetails customer = new CustomerDetails();
			customer.setCustId(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			customerList.add(customer);
		}
		return customerList;
	}

	public List<CustomerDetails> getCustomer(CustomerDetails showCustomer) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet = null;
		CustomerDetails showCustomer1 = new CustomerDetails();
		List<CustomerDetails> customerList = new ArrayList<>();
		if (showCustomer.getSearchBy().equals("customer_name")) {
			preparedStatement = connection.prepareStatement("SELECT * FROM customer where customer_name=?");
			preparedStatement.setString(1, showCustomer.getCustomerDetail());
			resultSet = preparedStatement.executeQuery();
		} else if (showCustomer.getSearchBy().equals("customer_contact")) {
			preparedStatement = connection.prepareStatement("SELECT * FROM customer where customer_contact=?");
			preparedStatement.setString(1, showCustomer.getCustomerDetail());
			resultSet = preparedStatement.executeQuery();
		} else if (showCustomer.getSearchBy().equals("customer_email")) {
			preparedStatement = connection.prepareStatement("SELECT * FROM customer where customer_email=?");
			preparedStatement.setString(1, showCustomer.getCustomerDetail());
			resultSet = preparedStatement.executeQuery();
		}
		while (resultSet.next()) {
			showCustomer1.setCustId(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			showCustomer1.setName(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			showCustomer1.setAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			showCustomer1.setAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			showCustomer1.setContact(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			showCustomer1.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			showCustomer1.setEmail(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
			customerList.add(showCustomer1);
		}
		return customerList;
	}

	public void addNewBranch(AddBranchDetails branch) throws SQLException, InvalidCredentialsException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		boolean status = false;
		List<AddBranchDetails> branchList = new ArrayList<>();
		branchList = getZipCode();
		for (AddBranchDetails branch1 : branchList) {
			if (branch1.getZipcode().equals(branch.getZipcode())) {
				status = true;
				preparedStatement = connection.prepareStatement(
						"INSERT INTO branch(micr_no,branch_address1,branch_address2,zipcode) VALUES(?,?,?,?);");
				Random randomNum = new Random();
				int max = 10000;
				int min = 1000;
				int micrNo = min + randomNum.nextInt(max);
				preparedStatement.setInt(1, micrNo);
				preparedStatement.setString(2, branch.getBranchaddress1());
				preparedStatement.setString(3, branch.getBranchaddress2());
				preparedStatement.setString(4, branch.getZipcode());
				preparedStatement.executeUpdate();
			}
		}
		if (!status) {
			throw new InvalidCredentialsException("zipcode doesnt exist");
		}
	}

	private List<AddBranchDetails> getZipCode() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<AddBranchDetails> branchList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("select *from city;");
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			AddBranchDetails branch = new AddBranchDetails();
			branch.setZipcode(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			branchList.add(branch);
		}
		return branchList;
	}
}
