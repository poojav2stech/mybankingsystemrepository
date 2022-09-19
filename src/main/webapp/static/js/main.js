$(window).on("load", function() {
	$("#addData").on("click", function() {
		var id = $("#cust_id").val();
		var name = $("#password").val();
		var logincreds = {
				custId: id,
				password: name
		}
		var url = "http://localhost:8080/bankingsystem/logindata";
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(logincreds),
			contentType: 'application/json',
				success: function() {
					alert("Credential Successfully");
				}
		});
		
		
	});
	
	
});