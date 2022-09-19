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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
</head>
<style>
    body{
    margin: auto;
    background-color: white;
       /* // background-repeat: no-repeat; */
    }
    
    .searchcustomer{
        margin-top: 50px;
        max-width: 400px;
        border: 1px solid black;
        padding: 20px;
        background-color: wheat;
    }
    
    table{
    
    margin: 10px 10%;
    
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
<jsp:include page="adminnavigationbar.jsp" />

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


 function	editData(id)
{
	var url = "http://localhost:8080/bankingsystem/adminupdatepage;
	$.ajax({
		type: 'GET',
		url: url,
		success: function(response) {
			window.location.href = "http://localhost:8080/bankingsystem/getCustId/"+id;
			},
			error:function(response)
			{
				alert(response);
			}
	
	});
		
}
 
$(window).on("load", function() {
	document.querySelector("#table-data").style.display="none";
	$("#search").on("click", function() {
		
		var searchcustomerdetails={}
		searchcustomerdetails.searchBy= $("#searchby").val();
		searchcustomerdetails.customerDetail= $("#customerdetail").val();
		var searchBy=check(searchcustomerdetails.searchBy,"searchby");
		var customerDetail=check(searchcustomerdetails.customerDetail,"customerdetail");
		if(searchBy && customerDetail)
			{
			$('#searchbyError').html("");
			 $('#customerdetailError').html("");
			}
		
		var searchby = $("#searchby").val();
		var customerdetail = $("#customerdetail").val();
		var customercreds = {
				customerDetail: customerdetail,
				searchBy: searchby
				}
		var url = "http://localhost:8080/bankingsystem/customer-detail-data";
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(customercreds),
			contentType: 'application/json',
			success: function(response) {
				$("#data").html("");
				response.length >0 ?document.querySelector("#table-data").style.display="block" : document.querySelector("#table-data").style.display="none";
				for (res in response) {
					$("#data").append("<tr><td>"+response[res].custId + "</td><td>" + response[res].name + "</td><td>" + response[res].address1 + "</td><td>"+response[res].address2 +"</td><td>" + response[res].contact +"</td><td>"+response[res].password + "</td><td>"+response[res].email + "</td><td> <button type='button' onclick='editData(" + response[res].custId + ")'> <i class='fa fa-edit'></i></button></td></tr>")
					}
				},
				error: function(message){
					$("#data").html("");
					document.querySelector("#table-data").style.display="none";
			//	message.length >0 ?document.querySelector("#table-data").style.display="block" : document.querySelector("#table-data").style.display="none"; 
				 	$('#error1').html(message.responseText)
					$('#error').show();
					$("#error").delay(8000).fadeOut("slow"); 
				}
			
		});
		
	});
});

 
</script>

 <div class="container searchcustomer">
 <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Search Customer</label>
        <select class="txtbox col-md-12" name="month"  id="searchby"  required="required">
					<option selected disabled value="">Search Customer By</option>
											<option>customer_name</option>
											<option>customer_contact</option>
											<option>customer_email</option>
				</select>
				 <span id="searchbyError"></span>
          </div><br>
           <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Enter Customer Detail </label>
            <input type="text" class="form-control" id="customerdetail" placeholder="">
             <span id="customerdetailError"></span>
            		<div id="error" class="col-sm-12" style="display: none;">
			<div class="alert alert-danger">
				<strong><em class="fa fa-thumbs-down"></em> &nbsp;</strong>
				<span id="error1"></span>
			</div>
		</div>
		  </div>
		    <input class="btn btn-primary" type="submit" value="Search" id="search"></br>
           </div>
 <table id="table-data" class="table user-table">
					<thead>
						<tr>
							<th>customer Id</th>
							<th>customer name</th>
							<th>customer address1</th>
							<th>customer address2</th>
							<th>customer contact</th>
							<th>customer password</th>
							<th>customer email </th>
							<th>Edit </th>
							</tr>
					</thead>
					<tbody id="data"></tbody>
				</table>
</body>
</html>