package com.v2stech.bankingsystem.controller;

import java.sql.SQLException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.v2stech.bankingsystem.exception.InvalidCredentialsException;
import com.v2stech.bankingsystem.exception.InvalidFieldException;
import com.v2stech.bankingsystem.model.AddBranchDetails;
import com.v2stech.bankingsystem.model.BranchBalanceDetails;
import com.v2stech.bankingsystem.model.BranchDetails;
import com.v2stech.bankingsystem.model.CustomerDetails;
import com.v2stech.bankingsystem.model.ShowTransaction;
import com.v2stech.bankingsystem.service.BankAdminService;

@RestController
public class AdminController {

	@Autowired
	private BankAdminService service;

	@GetMapping("/admin-dash-board-page")
	public ModelAndView adminDashBoardPage(ModelAndView modelAndView) {
		modelAndView.setViewName("adminDashBoardPage");
		return modelAndView;
	}

	@GetMapping("/show-transaction-datewise")
	public ModelAndView showTransactionDateWise(ModelAndView modelAndView) {
		modelAndView.setViewName("adminshowtransactiondatewise");
		return modelAndView;
	}

	@PostMapping("/branch-data")
	public String branchData(@Valid @RequestBody final AddBranchDetails branch, BindingResult result,
			ModelAndView modelAndView) throws InvalidFieldException, SQLException, InvalidCredentialsException {
		if (result.hasErrors()) {
			throw new InvalidFieldException(result);
		} else {
			service.addNewBranch(branch);
			return "branch added successfully";
		}
	}

	@GetMapping("/add-branch")
	public ModelAndView addBranchPage(ModelAndView modelAndView) {
		modelAndView.setViewName("addBranch");
		return modelAndView;
	}

	@PostMapping("/show-transaction-data")
	public List<ShowTransaction> getShowTransactionData(@RequestBody final ShowTransaction showtransaction,
			ModelAndView modelAndView) throws SQLException, InvalidCredentialsException {
		return service.showTransactionMonthYearWise(showtransaction);
	}

	@GetMapping("/search-customer")
	public ModelAndView searchCustomer(ModelAndView modelAndView) throws SQLException {
		modelAndView.setViewName("searchcustomer");
		return modelAndView;
	}

	@PostMapping("/customer-detail-data")
	public List<CustomerDetails> fetchCustomer(@RequestBody CustomerDetails showCustomer, ModelAndView modelAndView)
			throws SQLException, InvalidCredentialsException {
		List<CustomerDetails> customerList;
		customerList = service.getCustomer(showCustomer);
		if (customerList.isEmpty()) {
			throw new InvalidCredentialsException("wrong customer detail");
		}
		return customerList;
	}

	@GetMapping("/branch-total-balance-page")
	public ModelAndView branchTotalBalance(ModelAndView modelAndView) {
		modelAndView.setViewName("branchbalance");
		return modelAndView;
	}

	@PostMapping("/ifsccode")
	public BranchDetails getIFsccode(@RequestBody final BranchDetails branch, ModelAndView modelAndView)
			throws SQLException, InvalidCredentialsException {
		return service.getIfsc(branch);
	}

	@PostMapping("/branch-total-balance")
	public String getBranchBalance(@Valid @RequestBody BranchBalanceDetails branch, BindingResult result,
			ModelAndView modelAndView) throws InvalidFieldException, SQLException {
		if (result.hasErrors()) {
			throw new InvalidFieldException(result);
		} else {
			return service.getBranchBalance(branch);
		}
	}

	@GetMapping("/admin-update-page")
	public ModelAndView adminUpdateCustomer(ModelAndView modelAndView) {
		modelAndView.setViewName("adminUpdateDetails");
		return modelAndView;
	}

}
