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
    body{
    margin: auto;
   background-color: white;;
       /* // background-repeat: no-repeat; */
    }
    
    .getbalance{
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


$(window).on("load", function() {
		$("#getbalance").on("click", function() {
			var getbalancecreds={}
		  getbalancecreds.ifsc = $("#ifsccode").val();
		var ifsc=check(getbalancecreds.ifsc,"ifsc");
		if(ifsc)
			{
			var ifscPattern=NumberPattern(getbalancecreds.ifsc,"ifsc");
			}
		if(!ifsc || !ifscPattern )
		{
			return;
			
		} 
		
		
		if(ifsc && ifscPattern )
		{
			$("#ifscError").html("");
			
		} 
		
		
	
		
		
	
		$("#ifscError").html("");
		$.ajax({
			type: 'POST',
			url: 'http://localhost:8080/bankingsystem/branch-total-balance',
			data: JSON.stringify(getbalancecreds),
			contentType: 'application/json',
			success: function(response) {
				 $("#balance").val(response);
				 },
		 error: function(message) {
			$("#ifscError").html(message.responseJSON.ifscCode);
			$("#ifscErrfsor").show();
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
	var url = "http://localhost:8080/bankingsystem/ifsccode";
	$.ajax({
		type: 'POST',
		url: url,
		data: JSON.stringify(transactioncreds),
		contentType: 'application/json',
		success: function(response) {
			$("#branch").val(response.branchAddress1+" "+response.branchAddress2);
		 },
	error: function(message) {
		$("#branch").val("");
		$('#error1').html(message.responseText)
		$('#error').show();
		$("#error").delay(8000).fadeOut("slow");
	}
	
	});
		
}
</script>
<jsp:include page="adminnavigationbar.jsp" />
 <div class="container getbalance">
  <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> IFSC Code</label>
           <input type="text" class="form-control" id="ifsccode" placeholder="ifsc code" onchange="fetchIfsc(event)">
              <span id="ifscError"></span>
<div id="error" class="col-sm-12" style="display: none;">
				<div class="alert alert-danger">
					<strong><em class="fa fa-thumbs-down"></em> &nbsp;</strong> <span
						id="error1"></span>
				</div>
               
          </div><br>
          
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label" value="${address1}">Branch Address</label>
            <input type="text" class="form-control" id="branch" placeholder="branch address" readonly>
          </div><br>
                <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Get Total Balance </label>
            <input type="text" class="form-control" id="balance" placeholder="amount" readonly>
          </div><br>
              <input class="btn btn-primary" type="submit" value="Get balance" id="getbalance">
              </div>
              </div>
</body>
</html>