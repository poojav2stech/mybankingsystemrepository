package com.v2stech.bankingsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.model.AccountDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.CustomerDetails;
import com.v2stech.bankingsystem.model.LoginCredentials;
import com.v2stech.bankingsystem.model.TransactionDetails;
import com.v2stech.bankingsystem.model.TransferTo;
import com.v2stech.bankingsystem.model.UpdateDetails;

@Repository
public class BankUserImplementationDao {
	@Autowired
	private Connection connection;
	private String customerId;
	private String accountNo;
	private String accountBalance;

	public boolean login(LoginCredentials loginCredentials) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		preparedStatement = connection
				.prepareStatement("select * from customer where customer_id=? and customer_password=?;");
		preparedStatement.setString(1, loginCredentials.getCustId());
		preparedStatement.setString(2, loginCredentials.getPassword());
		resultSet = preparedStatement.executeQuery();
		if (!resultSet.isBeforeFirst()) {
			return false;
		} else {
			this.customerId = loginCredentials.getCustId();
			return true;
		}
	}

	public LoginCredentials getDataAfterLogin(LoginCredentials userCreds) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		preparedStatement = connection.prepareStatement("select * from customer where customer_id=?");
		preparedStatement.setString(1, customerId);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			userCreds.setCustId(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			userCreds.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			userCreds.setRole(resultSet.getString(resultSet.getMetaData().getColumnName(8)));
		}
		return userCreds;
	}

	public List<AccountDetails> getAccountNo(String id) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<AccountDetails> accountList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("select *from account where customer_id=?");
		preparedStatement.setString(1, id);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			AccountDetails account = new AccountDetails();
			account.setAccountNo(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			account.setBalance(resultSet.getString(resultSet.getMetaData().getColumnName(8)));
			System.out.println("inside get account no");
			accountList.add(account);
		}
		return accountList;
	}

	public CustomerDetails getCustomerDetails(String id) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		CustomerDetails customer = new CustomerDetails();
		preparedStatement = connection.prepareStatement("select *from customer where customer_id=?");
		preparedStatement.setString(1, id);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			customer.setName(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			customer.setAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			customer.setAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			customer.setContact(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			customer.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			customer.setEmail(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
		}
		return customer;
	}

	public List<AccountDetails> getAccountNo() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<AccountDetails> accountList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("select *from account where customer_id=?");
		preparedStatement.setString(1, customerId);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			AccountDetails account = new AccountDetails();
			account.setAccountNo(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			account.setBalance(resultSet.getString(resultSet.getMetaData().getColumnName(8)));
			System.out.println("inside get account no");
			accountList.add(account);
		}
		return accountList;
	}

	public CustomerDetails getCustomerDetails() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		CustomerDetails customer = new CustomerDetails();
		preparedStatement = connection.prepareStatement("select *from customer where customer_id=?");
		preparedStatement.setString(1, customerId);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			customer.setName(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			customer.setAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			customer.setAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			customer.setContact(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			customer.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			customer.setEmail(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
		}
		return customer;
	}

	public CustomerDetails getCustomerDetailsForUpdate() throws SQLException {
		CustomerDetails customer = new CustomerDetails();
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		preparedStatement = connection.prepareStatement("select *from customer where customer_id=?");
		preparedStatement.setString(1, customerId);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			customer.setName(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			customer.setAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			customer.setAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			customer.setContact(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			customer.setPassword(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			customer.setEmail(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
		}
		return customer;
	}

	public void updateChanges(UpdateDetails update) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		preparedStatement = connection.prepareStatement(
				"update  customer set customer_address1=?, customer_address2=?, customer_contact=?, customer_password=?,customer_email=? where customer_id=?");
		preparedStatement.setString(1, update.getAddress1());
		preparedStatement.setString(2, update.getAddress2());
		preparedStatement.setString(3, update.getContact());
		preparedStatement.setString(4, update.getPassword());
		preparedStatement.setString(5, update.getEmail());
		preparedStatement.setString(6, customerId);
		preparedStatement.executeUpdate();

	}

	public List<BranchDetails> getBranchName(TransferTo transfer) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<BranchDetails> branchList = new ArrayList<BranchDetails>();
		preparedStatement = connection.prepareStatement("select *from branch where ifsc_code=?");
		preparedStatement.setString(1, transfer.getIfscCode());
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			BranchDetails branch = new BranchDetails();
			branch.setBranchAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			branch.setBranchAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			branchList.add(branch);
		}
		return branchList;
	}

	public List<TransferTo> getTransactionType() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<TransferTo> transferList = new ArrayList<>();
		preparedStatement = connection.prepareStatement("select *from transactiontype");
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			TransferTo transfer = new TransferTo();
			transfer.setTransactionType(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			transferList.add(transfer);
		}
		return transferList;
	}

	public List<TransactionDetails> getTransactionalHistory() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<TransactionDetails> transactionList = new ArrayList<>();

		preparedStatement = connection.prepareStatement(
				"select tsc.transaction_id,ttype.transaction_type,tsc.transaction_amount,tsc.transction_date,tsc.transaction_from,tsc.transaction_to,tstatus.transactionstatus, tsc.customer_id FROM  transactionstatus tstatus inner JOIN transaction tsc ON tstatus.transactionstatusid = tsc.transactionstatusid inner JOIN transactiontype ttype ON tsc.transaction_type_id = ttype.transaction_type_id where customer_id=?;");
		preparedStatement.setString(1, customerId);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			TransactionDetails transaction = new TransactionDetails();
			transaction.setTransactionId(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			transaction.setTransactionType(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			transaction.setTransactionAmount(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
			transaction.setTransactionDate(resultSet.getString(resultSet.getMetaData().getColumnName(4)));
			transaction.setTransactionFrom(resultSet.getString(resultSet.getMetaData().getColumnName(5)));
			transaction.setTransactionTo(resultSet.getString(resultSet.getMetaData().getColumnName(6)));
			transaction.setTransactionStatus(resultSet.getString(resultSet.getMetaData().getColumnName(7)));
			transaction.setCustomerId(resultSet.getString(resultSet.getMetaData().getColumnName(8)));
			transactionList.add(transaction);
		}
		return transactionList;

	}

	public BranchDetails getIfscCode(TransferTo transfer) throws SQLException, InvalidCredentialsException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		BranchDetails branch = new BranchDetails();
		preparedStatement = connection.prepareStatement("select *from branch where ifsc_code=?");
		preparedStatement.setString(1, transfer.getIfscCode());
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

	public AccountDetails getBalance(AccountDetails account) throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		AccountDetails account1 = new AccountDetails();
		this.accountNo = account.getAccountNo();
		preparedStatement = connection.prepareStatement(
				"select branch.branch_address1,branch.branch_address2,act.account_balance from account act inner join branch branch on act.ifsc_code=branch.ifsc_code where account_no=?");
		preparedStatement.setString(1, account.getAccountNo());

		this.accountBalance = account.getBalance();
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			account1.setBranchAddress1(resultSet.getString(resultSet.getMetaData().getColumnName(1)));
			account1.setBranchAddress2(resultSet.getString(resultSet.getMetaData().getColumnName(2)));
			account1.setBalance(resultSet.getString(resultSet.getMetaData().getColumnName(3)));
		}
		return account1;
	}

	public void transfer(TransferTo transfer) throws SQLException, InvalidCredentialsException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		String amount = transfer.getAmount();
		String balance = getCustomerBalance();
		if (Integer.parseInt(amount) > Integer.parseInt(balance)) {
			throw new InvalidCredentialsException("insufficient balance");
		} else if (Integer.parseInt(amount) <= 0) {
			throw new InvalidCredentialsException("amount cannot be zero or less than zero");
		} else {
			preparedStatement = connection.prepareStatement(
					"INSERT INTO transaction(transaction_type_id,transaction_amount,transction_date,transaction_from,transaction_to,transactionstatusid,customer_id) VALUES(?,?,?,?,?,?,?);");
			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, transfer.getAmount());
			java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
			preparedStatement.setDate(3, date);
			preparedStatement.setString(4, transfer.getTransactionFrom());
			preparedStatement.setString(5, transfer.getTransactionToAccountNumber());
			preparedStatement.setInt(6, 1);
			preparedStatement.setString(7, customerId);
			preparedStatement.executeUpdate();
			preparedStatement = connection
					.prepareStatement("update account set account_balance=account_balance-? where account_no=?;");
			preparedStatement.setInt(1, Integer.parseInt(transfer.getAmount()));
			preparedStatement.setString(2, accountNo);
			preparedStatement.executeUpdate();
		}
	}

	public String getCustomerBalance() throws SQLException {
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		String balance = null;
		preparedStatement = connection.prepareStatement("select account_balance from account where account_no=?;");
		preparedStatement.setString(1, accountNo);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			balance = resultSet.getString("account_balance");
		}
		return balance;
	}

}
