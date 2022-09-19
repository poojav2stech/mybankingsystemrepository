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
        
        .createaccount{
            margin-top: 50px;
            max-width: 400px;
            border: 1px solid black;accountno
            padding: 20px;
            background-color: wheat;
        }
        
    
        
    </style>
</head>
<body>
<script>
function fetchBalance(event)
{
	var accountno = $("#accountno").val();
	var accountcreds = {
			accountNo:accountno
			}
	var url = "http://localhost:8080/bankingsystem/balance-data";
	$.ajax({
		type: 'POST',
		url: url,
		data: JSON.stringify(accountcreds),
		contentType: 'application/json',
		success: function(response) {
			 $("#balance").val(response.balance);
			 $("#branch").val(response.branchAddress1+" "+response.branchAddress2);
			
		}
	
	});
		
}
</script>

   <jsp:include page="navigationBar.jsp" />

    <div class="container createaccount">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">account number:</label>
        <select class="txtbox col-md-12" name="accountno"  id="accountno"	onchange="fetchBalance(event)" required="required">
					<option selected disabled value="">Account Number</option>
					<c:forEach items="${accountList}" var="account">
						<option value="${account.accountNo}">${account.accountNo}</option>
					
					</c:forEach>
					
				</select>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">branch  name</label>
            <input type="text" class="form-control" id="branch" placeholder="branchname" readonly>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">customer name</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="customer name"  value="${customer.name}" readonly>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> customer address1</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="customer address1" value="${customer.address1}" readonly>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> customer address2:</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="customer name"  value="${customer.address2}" readonly>
          </div><br>
          <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label"> customer contact:</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="customer contact"  value="${customer.contact}" readonly>
          </div><br>
          <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label"> customer current balance:</label>
            <input type="text" class="form-control" id="balance" placeholder="customer current balance"  readonly>
          </div><br>
          
          <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label"> customer email :</label>
          <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="customer email"  value="${customer.email}" readonly>
        </div><br>
</div>
</body>
</html>