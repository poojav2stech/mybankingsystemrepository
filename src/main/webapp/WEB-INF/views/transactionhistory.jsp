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

</head>
<style>
  table{
    
    margin: 10px 10%;
    margin-left: 0px;
    
    
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
 <jsp:include page="navigationBar.jsp" />
 <table class="table user-table">
					<thead>
						<tr>
						    <th>transaction Id</th>
						    <th>transaction Type</th>
							<th>transaction Amount</th>
							<th>transaction Date</th>
							<th>transaction From</th>
							<th>transaction To</th>
							<th>transaction Status</th>
							<th>customer_id </th>
							
						</tr>
					</thead>
					<tbody id="data"></tbody>
				</table>
<script>

$(window).on("load", function() {
	/* http://localhost:8080/bankingsystem/transfer */
	$.ajax({
		url: "http://localhost:8080/bankingsystem/transaction-show-list",
		type: "GET",
		success: function(response) {
			for (res in response) {
			$("#data").append("<tr><td>"+response[res].transactionId + "</td><td>" + response[res].transactionType + "</td><td>" + response[res].transactionAmount + "</td><td>"+response[res].transactionDate +"</td><td>" + response[res].transactionFrom +"</td><td>"+response[res].transactionTo + "</td><td>"+response[res].transactionStatus + "</td><td>"+response[res].customerId + "</td></tr>")
			}
		},
		failure: function(response) {
			$('#failure').show();
			$("#failure").delay(8000).fadeOut("slow");
		},
		error: function(response) {
			$('#error').show();
			$("#error").delay(8000).fadeOut("slow");
			}
	});
});

</script>

</body>
</html>