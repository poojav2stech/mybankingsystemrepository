<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>

<style>
 img
    {
        max-width: 100%;
    height: auto;
    margin-left: 515px;
    margin-top: 118px;
}
    body{
    margin: auto;
    background: rgb(134,40,65);
    }
    
    .login{
        margin-top: 50px;
        max-width: 400px;
        
        padding: 20px;
       
    }

     
    .register{
        text-decoration: none;
    }

	.form-label{
		color:white;
	}
	
	#addData{
	
	background: white;
	border: solid 2px rgb(134,40,65);
	color: rgb(134,40,65);
	}
    
</style>
</head>
<body>

<script>

function check(field, message) {
	if (field == "" || field == null) {
		$("#" + message + "Error").html(message + " Field is Required");
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




$(window).on("load", function() {
	$("#addData").on("click", function() {
		var userdetails={}
		userdetails.custId=$("#cust_id").val();
     	userdetails.password=$("#password").val();
	var custId=	 check(userdetails.custId,"custId");
	var password=   check(userdetails.password,"password"); 
	if(!custId || !password)
		{
		return;
		}
	

			var id = $("#cust_id").val();
				var name = $("#password").val(); 
			var logincreds = {
					custId: id,
					password: name
			} 
			
			var url = "http://localhost:8080/bankingsystem/login-data";
		 $('#custIdError').html("");
			$('#passwordError').html("");
			
			 	$.ajax({
					type: 'POST',
					url: url,
					data: JSON.stringify(logincreds),
					contentType: 'application/json',
					success: function(data) {
						
						if(data === "customer"){
							window.location.href = "http://localhost:8080/bankingsystem/customer-details/"+id;
						}
						else 
							{
							window.location.href = "http://localhost:8080/bankingsystem/admin-dash-board-page"
							
							}
					},
				error: function(message){
					$('#error1').html(message.responseText)
					$('#error1').show();
					$("#error1").delay(8000).fadeOut("slow");
					/* $('#custIdError').html(message.responseJSON.custId);
					$('#passwordError').html(message.responseJSON.password); */
				}

				}); 
		});
	});
</script>
	<img src="https://application.axisbank.co.in/webforms/axis-support/images/axis-bank.svg" alt="Axis Bank" class="img-fluid">
    <div class="container login">
    
    	 <div id="error1" class="col-sm-12" style="display: none;">
			<div class="alert alert-danger">
				<strong><em class="fa fa-thumbs-down"></em> &nbsp;</strong>
				<span id="error1"></span>
			</div>
		</div> 
     <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label" >Customer ID</label>
            <input  type="text" class="form-control" id="cust_id" placeholder="enter customer id" >
            </div>
            <span id="custIdError" class="error"></span>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="enter password">
          </div>
          <span id="passwordError" class="error"></span>
          <br>
          <input class="btn btn-primary" type="submit" value="Submit" id="addData"></br>
          </div>
</body>
</html>