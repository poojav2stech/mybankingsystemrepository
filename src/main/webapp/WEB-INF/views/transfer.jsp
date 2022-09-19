<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
	integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
	integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK"
	crossorigin="anonymous"></script>

<style>
body {
	margin: auto;
	background-color: white;
	/* // background-repeat: no-repeat; */
}

.transfer {
	margin-top: 50px;
	max-width: 400px;
	border: 1px solid black;
	padding: 20px;
	background-color: wheat;
}
</style>
</head>
<body>
	<script>

function check(field, message) {
	if (field == "" || field == null) {
		$("#" + message + "Error").html(message + " field is Required");
		$("#" + message + "Error").show();
		flag = false;
	} else {
		$("#" + message + "Error").hide();
		flag = true;
	}
	return flag;
}

function NumberPattern(field,message) {
	var NumberRegex = new RegExp('^[0-9]*$');
	if (!NumberRegex.test(field)) {
		$("#" + message + "Error").html(message + " Filed is Required Only Numeric");
		$("#" + message + "Error").show();
		flag = false;
	} else {
		$("#" + message + "Error").hide();
		flag = true;
	}
	return flag;
}

function AlphaPattern(field,message) {
	var AlphaRegex = new RegExp('^[a-zA-Z]+$');
	if (!AlphaRegex.test(field)) {
		$("#" + message + "Error").html(message + " Field is Required Only Alphabets");
		$("#" + message + "Error").show();
		flag = false;
	} else {
		$("#" + message + "Error").hide();
		flag = true;
	}
	return flag;
}

$(window).on("load", function() {

	$("#transfer").on("click", function() {
		
		var transferdetails={}
		transferdetails.transactionToAccountNumber=$("#accountno").val();
		transferdetails.transactionToCustomerName=$("#name").val();
		transferdetails.ifscCode=$("#ifsccode").val();
		transferdetails.branchName=$("#branch").val();
		transferdetails.amount=$("#amount").val();
		
	var transactionToAccountNumber=check(transferdetails.transactionToAccountNumber,"accountno");
	var transactionToCustomerName=check(transferdetails.transactionToCustomerName,"name");
	var ifscCode=check(transferdetails.ifscCode,"ifsc");
	/* var branchName=check(transferdetails.branchName,"branch"); */
	var amount=check(transferdetails.amount,"amount");
	
	 if (transactionToAccountNumber ) {
		var transactionToAccountNumberPattern = NumberPattern(transferdetails.transactionToAccountNumber, "accountno");
	

	
		} 
	 if( transactionToCustomerName)
		 {
			var transactionToCustomerNamePattern = AlphaPattern(transferdetails.transactionToCustomerName, "name");
		 
		 }
	 if(ifscCode)
		 {
			var ifscCodePattern = NumberPattern(transferdetails.ifscCode, "ifsc");
		 
		 }
	 if(amount)
		 {
			var amountPattern = NumberPattern(transferdetails.amount, "amount");
		 
		 }
	 
	 if(!transactionToAccountNumber || !transactionToCustomerName || !transactionToAccountNumberPattern || !ifscCodePattern || !amountPattern || !amount)
		 
		 {
		 return;
		 }
	 
	
	 if(transactionToAccountNumber && transactionToCustomerName && ifscCode && amount && transactionToAccountNumberPattern && ifscCodePattern && amountPattern )
		 {
		 $('#accountnoError').html("");
		 $('#nameError').html("");
		 $('#ifscError').html("");
		 $('#amountError').html("");

		 } 
	   var fromAccountNo=$("#fromAccountNo").val();
	   var id = $("#accountno").val();
		var name = $("#name").val();
		var branch = $("#branch").val();
		var transactionvia = $("#transactionvia").val();
		var amount = $("#amount").val();
		var transactiontype = $("#transactiontype").val();
		var ifsccode = $("#ifsccode").val();
		var transactioncreds = {
				transactionFrom:fromAccountNo,
				transactionToAccountNumber: id,
				transactionToCustomerName: name,
				branchName:branch,
				transactionVia:transactionvia,
				amount:amount,
				transactionType:transactiontype,
				ifscCode:ifsccode
				}
		var url = "http://localhost:8080/bankingsystem/transfer-data";
		 $('#accountnoError').html("");
		 $('#nameError').html("");
		 $('#ifscError').html("");
		 $('#amountError').html("");
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(transactioncreds),
			contentType: 'application/json',
			success: function(response) {
				alert(response);
			},
		error: function(message) {
			$('#error2').html(message.responseText)
			$('#error2').show();
			$("#error2").delay(8000).fadeOut("slow");
			 
		}
			
		}); 
		 
	});
}); 

 function	fetchIfsc(event)
{
	var ifsccode = $("#ifsccode").val();
	var transactioncreds = {
			ifscCode:ifsccode
			}
	var url = "http://localhost:8080/bankingsystem/ifsc-data";
	$.ajax({
		type: 'POST',
		url: url,
		data: JSON.stringify(transactioncreds),
		contentType: 'application/json',
		success: function(response) {
		
		 $("#branch").val(response.branchAddress1+" "+response.branchAddress2);
			
		},
		error: function(message) {
			$('#error1').html(message.responseText)
			$('#error').show();
			$("#error").delay(8000).fadeOut("slow");
			 $("#branch").val("");
	
	}
	
	
	});
		
} 
</script>
	<jsp:include page="navigationBar.jsp" />
	<div class="container transfer">

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Transfer
				from account number:</label> <select class="txtbox col-md-12"
				name="accountno" id="fromAccountNo" required="required">
				<option selected disabled value="">Account Number</option>
				<c:forEach items="${accountList}" var="account">
					<option value="${account.accountNo}">${account.accountNo}</option>
				</c:forEach>
			</select>
		</div>
		<br>


		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">
				Transaction to account no:</label> <input type="text" class="form-control"
				id="accountno" placeholder="to account no"> <span
				id="accountnoError"></span>
		</div>
		<br>


		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">
				Transaction to customer name:</label> <input type="text"
				class="form-control" id="name" placeholder=" to customer name">
			<span id="nameError"></span>

		</div>
		<br>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">
				IFSC Code</label> <input type="text" class="form-control" id="ifsccode"
				placeholder="ifsc code" onchange="fetchIfsc(event)"> 
				<spanid="ifscError"></span>
			<div id="error" class="col-sm-12" style="display: none;">
				<div class="alert alert-danger">
					<strong><em class="fa fa-thumbs-down"></em> &nbsp;</strong> <span
						id="error1"></span>
				</div>
			</div>
		</div>
		<br>


		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label"
				value="${address1}">Branch Address</label> 
				<input type="text" class="form-control" id="branch" placeholder="branch address" readonly>
		</div>
		<br>




		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">amount
				:</label> <input type="text" class="form-control" id="amount"
				placeholder="amount"> <span id="amountError"></span>
			<div id="error2" class="col-sm-12" style="display: none;"></div>

		</div>
		<br> <input class="btn btn-primary" type="submit"
			value="transfer" id="transfer">
	</div>
</body>
</html>