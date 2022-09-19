<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
       <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>account details </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>

    <style>
        body{
        margin: auto;
          background-color: white;
           /* // background-repeat: no-repeat; */
        }
        
        .updateexistingaccount{
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

function phonelength(field) {
	if (field.length != 10) {
		$("#contactError").html("Phone Number should be of  10 digits");
		$("#contactError").show();
		flag = false;
	} else {
		$("#contactError").hide();
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

function emailPattern(field) {
	var EmailRegex = new RegExp('^[a-z]+[a-z0-9.+]+@[A-Za-z]+[.]{1}[A-Za-z]{2,}$');
	if (!EmailRegex.test(field)) {
		$("#emailError").html("Email Formate is not matching");
		$("#emailError").show();
		flag = false;
	} else {
		$("#emailError").hide();
		flag = true;
	}
	return flag;
}

function passwordPattern(field) {
	if (field.length !=  8) {
		$("#passwordError").html("password should be 8 digits");
		$("#passwordError").show();
		flag = false;
	} 
	
	else {
		$("#passwordError").hide();
		flag = true;
	}
	return flag;
}


$(window).on("load", function() {
	 $("#update").on("click", function() {
	 var updatedetails={}
		updatedetails.address1=$("#address1").val();
		updatedetails.address2=$("#address2").val();
		updatedetails.contact=$("#contact").val();
		updatedetails.password=$("#password").val();
		updatedetails.email=$("#email").val();
		
	var address1=check(updatedetails.address1,"address1");
	var address2=check(updatedetails.address2,"address2");
	var contact=check(updatedetails.contact,"contact");
	var password=check(updatedetails.password,"password");
	var email=check(updatedetails.email,"email");
	
	if(contact)
		{
		var contactPattern = NumberPattern(updatedetails.contact, "contact");
		}
	 if(contactPattern)
		{
		var phoneLength1=phonelength(updatedetails.contact);
		}
	
	 if(email)
		{
		var emailPattern1= emailPattern(updatedetails.email);
		}
	 if(password)
		{
		var passwordPattern1= passwordPattern(updatedetails.password);
		}
	 
	 if(!address1 || !address2 || !contact ||  !password ||  !email ||   !contactPattern ||  !emailPattern1 ||  !passwordPattern1  ||  !phoneLength1)
		{
			return;
		}  
	if(address1 && address2 && contact && password && email &&  contactPattern && emailPattern1 &&  passwordPattern1  && phoneLength1)
	{
		 $('#address1Error').html("");
		 $('#address2Error').html("");
		 $('#passwordError').html("");
		 $('#emailError').html("");
		 $('#contactError').html("");
	}  
		 
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		var contact = $("#contact").val();
		var password = $("#password").val();
		var email = $("#email").val();
		/* var updatecreds = {
				address1: address1,
				address2: address2,
				contact: contact,
				password: password,
				email: email
		} */
		var url = "http://localhost:8080/bankingsystem/update-data";
		 $('#address1Error').html("");
		 $('#address2Error').html("");
		 $('#passwordError').html("");
		 $('#emailError').html("");
		 $('#contactError').html("");
		$.ajax({
			type: 'PUT',
			url: url,
			data: JSON.stringify(updatedetails),
			contentType: 'application/json',
success: function(response) {
	alert(response);
			},
		
		error: function(message) {
			$('#address1Error').html(message.responseJSON.address1);
			$('#address1Error').show();
			
	    	$('#address2Error').html(message.responseJSON.address2);
			$('#address2Error').show();
			
			$('#contactError').html(message.responseJSON.contact);
			$('#contactError').show();
			
			$('#passwordError').html(message.responseJSON.password);
			$('#passwordError').show();
			
			$('#emailError').html(message.responseJSON.email);
			$('#emailError').show();
			
		}
		
		});  	
	});
});

</script>
   <jsp:include page="navigationBar.jsp" />
    <div class="container updateexistingaccount">
         
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Address1</label>
            <input type="text" class="form-control" id="address1" placeholder="address1"  value="${customer.address1}">
               <span id="address1Error"></span>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Address2</label>
            <input type="text" class="form-control" id="address2" placeholder="address2"  value="${customer.address2}">
               <span id="address2Error"></span>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Password</label>
            <input type="text" class="form-control" id="password" placeholder=" password"  value="${customer.password}">
               <span id="passwordError"></span>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Email Address</label>
            <input type="text" class="form-control" id="email" placeholder="email"  value="${customer.email}">
               <span id="emailError"></span>
          </div><br>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Contact</label>
            <input type="text" class="form-control" id="contact" placeholder="contact"  value="${customer.contact}">
               <span id="contactError"></span>
          </div><br>
          <input class="btn btn-primary" type="submit"  id="update" value="save changes"></br>
</div>
</body>
</html>