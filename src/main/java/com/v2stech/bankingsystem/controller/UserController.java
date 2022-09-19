package com.v2stech.bankingsystem.controller;

import java.sql.SQLException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.exception.InvalidFieldException;
import com.v2stech.bankingsystem.model.AccountDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.LoginCredentials;
import com.v2stech.bankingsystem.model.TransactionDetails;
import com.v2stech.bankingsystem.model.TransferTo;
import com.v2stech.bankingsystem.model.UpdateDetails;
import com.v2stech.bankingsystem.service.BankUserService;

@RestController
public class UserController {

	@Autowired
	private BankUserService service;

	@GetMapping("/")
	public ModelAndView loginPageDisplay(ModelAndView modelAndView) {
		System.out.print("in  login page display method");
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@PostMapping("/login-data")
	public String addData(@Valid @RequestBody LoginCredentials login, BindingResult result, ModelAndView modelAndView)
			throws InvalidFieldException, SQLException, InvalidCredentialsException {
		boolean value = false;
		LoginCredentials userDataFromTable = null;
		System.out.println("cust id=" + login.getCustId());
		System.out.println("password=" + login.getPassword());
		if (result.hasErrors()) {
			throw new InvalidFieldException(result);
		} else {
			value = service.login(login);
			if (value) {
				userDataFromTable = service.getDataAfterLogin(login);
				if (userDataFromTable.getCustId().equals(login.getCustId())
						&& userDataFromTable.getPassword().equals(login.getPassword())) {
					if (userDataFromTable.getRole().equalsIgnoreCase("c")) {
						return "customer";
					} else {
						return "admin";
					}
				}
			} else {
				throw new InvalidCredentialsException("invalid credentials");
			}
		}
		return null;
	}

	@GetMapping(value = "/customer-details/{id}")
	public ModelAndView customerDetailsPage(@PathVariable String id, ModelAndView modelAndView) throws Exception {
		modelAndView.addObject("accountList", service.getAccountNo(id));
		modelAndView.addObject("customer", service.getCustomerDetails(id));
		modelAndView.setViewName("customerdetails");
		return modelAndView;
	}

	@GetMapping("/customer-details")
	public ModelAndView customerDetailsPage(ModelAndView modelAndView) throws SQLException {
		modelAndView.addObject("customer", service.getCustomerDetails());
		modelAndView.addObject("accountList", service.getAccountNo());
		modelAndView.setViewName("customerdetails");
		return modelAndView;
	}

	@GetMapping("/update")
	public ModelAndView updatePage(ModelAndView modelAndView) throws SQLException {
		modelAndView.addObject("customer", service.getCustomerDetailsForUpdate());
		modelAndView.setViewName("updateexistingaccount");
		return modelAndView;
	}

	@PutMapping("/update-data")
	public String updateData(@Valid @RequestBody final UpdateDetails update, BindingResult result,
			ModelAndView modelAndView) throws InvalidFieldException, SQLException {
		if (result.hasErrors()) {
			throw new InvalidFieldException(result);
		} else {
			service.updateChanges(update);
		}
		return "updated successfully";
	}

	@GetMapping("/transfer")
	public ModelAndView transferPage(ModelAndView modelAndView) throws SQLException {
		modelAndView.addObject("accountList", service.getAccountNo());
		modelAndView.setViewName("transfer");
		return modelAndView;
	}

	@PostMapping("/transfer-data")
	public String transferData(@Valid @RequestBody final TransferTo transfer, BindingResult result,
			ModelAndView modelAndView) throws InvalidFieldException, SQLException, InvalidCredentialsException {
		System.out.println("passwordupdated" + transfer.getAmount());
		if (result.hasErrors()) {
			throw new InvalidFieldException(result);
		} else {
			service.transfer(transfer);
			return "transfered successfully";
		}
	}

	@PostMapping("/balance-data")
	public AccountDetails getBalanceFromAccountNumber(@RequestBody final AccountDetails account,
			ModelAndView modelAndView) throws SQLException {
		return service.getBalance(account);
	}

	@PostMapping("/ifsc-data")
	public BranchDetails getIFsc(@RequestBody final TransferTo transfer, ModelAndView modelAndView)
			throws SQLException, InvalidCredentialsException {
		return service.getIfscCode(transfer);
	}

	@GetMapping("/transactional-history")
	public ModelAndView transactionalHistoryPage(ModelAndView modelAndView) {
		modelAndView.setViewName("transactionhistory");
		return modelAndView;
	}

	@GetMapping("/transaction-show-list")
	public List<TransactionDetails> transactionalHistory(ModelAndView modelAndView) throws SQLException {
		List<TransactionDetails> transactionList;
		transactionList = service.getTransactionalHistory();
		return transactionList;
	}

}
