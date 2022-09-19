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

$(window).on("load", function() {
	$("#update").on("click", function() {
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		var contact = $("#contact").val();
		var password = $("#password").val();
		var email = $("#email").val();
		var updatecreds = {
				address1: address1,
				address2: address2,
				contact: contact,
				password: password,
				email: email
		}
		var url = "http://localhost:8080/bankingsystem/adminupdatedata";
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(updatecreds),
			contentType: 'application/json',
success: function(response) {
	alert(response);
			}
		});
		
	});
});

</script>
   <jsp:include page="adminnavigationbar.jsp" />
    <div class="container updateexistingaccount">
         
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Address1</label>
            <input type="text" class="form-control" id="address1" placeholder="address1"  value="${customerAddress1}">
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Address2</label>
            <input type="text" class="form-control" id="address2" placeholder="address2"  value="${customerAddress2}">
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Password</label>
            <input type="text" class="form-control" id="password" placeholder=" password"  value="${customerPassword}">
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Email Address</label>
            <input type="text" class="form-control" id="email" placeholder="email"  value="${customerEmail}">
          </div><br>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Contact</label>
            <input type="text" class="form-control" id="contact" placeholder="contact"  value="${customerContact}">
          </div><br>
          <input class="btn btn-primary" type="submit"  id="update" value="save changes"></br>
</div>
</body>
</html>