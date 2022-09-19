	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
</head>
<style>
    body{
    margin: auto;
 background-color: white;
       /* // background-repeat: no-repeat; */
    }
    
    .showtransactiomdatewise{
          margin-top: 50px;
        max-width: 400px;
        border: 1px solid black;
        padding: 20px;
        background-color: wheat;
    }
      table{
    
       margin: 17px 28%;
    
    }
    
    th, td{
    border: solid 3px black;
    
    }

thead{
background:black;
color:white;
}

</style>

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

function yearValidation(field) {
	var currentYear=new Date().getFullYear(); 
	console.log(currentYear);
	if (field>currentYear) {
		$("#yearError").html("year should be in past");
		$("#yearError").show();
		flag = false;
	} else {
		$("#yearError").hide();
		flag = true;
	}
	return flag;
}


$(window).on("load", function() {
	document.querySelector("#table-data").style.display="none";
	$("#search").on("click", function() {
		var searchcustomerdetails={}
		searchcustomerdetails.custid= $("#custid").val();
		searchcustomerdetails.month= $("#month").val();
		searchcustomerdetails.year= $("#year").val();
		var custid=check(searchcustomerdetails.custid,"id");
		var month=check(searchcustomerdetails.month,"month");
		var year=check(searchcustomerdetails.year,"year");
		if(year)
			{
			yearValidation(searchcustomerdetails.year);
			
			}
		
		if(custid && month && year && yearValidation)
			{
			$('#custidError').html("");
			 $('#monthError').html("");
			 $('#yearError').html("");
			}
		if(!custid || !month  || !year || !yearValidation)
			{
			return;
			
			}
	
	
		var custid = $("#custid").val();
		var month = $("#month").val();
		var year = $("#year").val();
		var showtransactioncreds = {
				custId: custid,
				month: month,
				year:year
		
		}
		var url = "http://localhost:8080/bankingsystem/show-transaction-data";
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(showtransactioncreds),
			contentType: 'application/json',
			success: function(response) {
				console.log(response);
				$("#data").html("");
			response.length >0 ? document.querySelector("#table-data").style.display="block":document.querySelector("#table-data").style.display="none";
				for (res in response) {
					$("#data").append("<tr><td>"+response[res].custId + "</td><td>" + response[res].transactionId + "</td><td>" + response[res].transactionAmount + "</td><td>"+response[res].transactionDate + "</td></tr>")
					}
				},
			error: function(message) {
				$("#data").html("");
				document.querySelector("#table-data").style.display="none";
					$('#error1').html(message.responseText)
					$('#error1').show();
					$("#error1").delay(8000).fadeOut("slow"); 
							 
						}
		});
		
	});
});


</script>
 <jsp:include page="adminnavigationbar.jsp" />
 <div class="container showtransactiomdatewise">
  <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> customer  id</label>
            <input type="text" class="form-control" id="custid" placeholder="customer id"  value="" >
            	 <span id="idError"></span>
             
          </div><br>
           <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Month</label>
            
        <select class="txtbox col-md-12" name="month"  id="month"  required="required">
					<option selected disabled value="">Month</option>
											<option value="1">January</option>
											<option value="2">February</option>
											<option value="3">March</option>
											<option value="4">April</option>
											<option value="5">May</option>
											<option value="6">June</option>
											<option value="7">July</option>
											<option value="8">August</option>
											<option value="9">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
				</select>
					 <span id="monthError"></span>
          </div><br>
          
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> year</label>
            <input type="text" class="form-control" id="year" placeholder="year"  value="">
            	 <span id="yearError"></span>
          </div><br>
          <input class="btn btn-primary" type="submit" value="search" id="search">
          <br>
         
          </div>
             <div id="error1" class="col-sm-12" style="color:black;text-align: center">
          </div>
       	     <table id="table-data" class="table user-table">
					<thead>
						<tr>
							<th>customer Id</th>
							<th> transaction Id</th>
							<th>transaction amount</th>
							<th>transaction date</th>
							
						</tr>
					</thead>
					<tbody id="data"></tbody>
				</table>
		
		</body>
</html>