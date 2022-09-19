<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
       <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
        
        .addbranch{
            margin-top: 50px;
            max-width: 400px;
            border: 1px solid black;
            padding: 20px;
            background-color: wheat;
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

function zipcodeLength(field) {
	if (field.length != 6) {
		$("#zipcodeError").html("Zip code should be of  6 digits");
		$("#zipcodeError").show();
		flag = false;
	} else {
		$("#zipcodeError").hide();
		flag = true;
	}
	return flag;
}



	$(window).on("load", function() {

	$("#addbranch").on("click", function() {
		 var addbranchdetails={}
		 addbranchdetails.zipcode=$("#zipcode").val();
		 addbranchdetails.branchaddress1=$("#branchaddress1").val();
		 addbranchdetails.branchaddress2=$("#branchaddress2").val();
		 
	    var zipcode=check(addbranchdetails.zipcode,"zipcode");	
		var branchaddress1=check(addbranchdetails.branchaddress1,"branchaddress1");
		var branchaddress2=check(addbranchdetails.branchaddress2,"branchaddress2");
		if(zipcode)
			{
			var zipcodePattern = NumberPattern(addbranchdetails.zipcode, "zipcode");
			}
		
		if(zipcodePattern)
			{
			var zipcodeLengthCheck=zipcodeLength(addbranchdetails.zipcode);
			}
	
		if(!zipcode || !branchaddress1 || !branchaddress2 || !zipcodePattern || !zipcodeLengthCheck)
		{
		 return;
		}
		if(zipcode && branchaddress1 && branchaddress2 && zipcodePattern && zipcodeLengthCheck)
		{
		 $('#zipcodeError').html("");
		 $('#branchaddress1Error').html("");
		 $('#branchaddress2Error').html("");
		 
		}
	
	    var zipcode = $("#zipcode").val();
		var branchaddress1 = $("#branchaddress1").val();
		var branchaddress2 = $("#branchaddress2").val();
		var branchcreds = {
				zipcode: zipcode,
				branchaddress1: branchaddress1,
				branchaddress2:branchaddress2
				}
		var url = "http://localhost:8080/bankingsystem/branchdata";
		 $('#zipcodeError').html("");
		 $('#branchaddress1Error').html("");
		 $('#branchaddress2Error').html("");
		
		$.ajax({
			type: 'POST',
			url: url,
			data: JSON.stringify(branchcreds),
			contentType: 'application/json',
			success: function(response) {
				alert(response);
			},
		
		error: function(message) {
			$('#error1').html(message.responseText)
			$('#error').show();
			$("#error").delay(8000).fadeOut("slow");
	
	}
		/* error: function(message) {
		    $('#zipcodeError').html(message.responseJSON.zipcode);
			$('#zipcodeError').show(); 
			
	    	$('#branchaddress1Error').html(message.responseJSON.branchaddress1);
			$('#branchaddress1Error').show();
			
			$('#branchaddress2Error').html(message.responseJSON.branchaddress2);
			$('#branchaddress2Error').show();
			
		} */
			
		});
		
	});
});
</script>
 <jsp:include page="adminnavigationbar.jsp" />
<div class="container addbranch">
             <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Zip Code </label>
            <input type="text" class="form-control" id="zipcode" placeholder="zipcode" >
                 <span id="zipcodeError"></span>
                    <div id="error" class="col-sm-12" style="display: none;">
			<div class="alert alert-danger">
				<strong><em class="fa fa-thumbs-down"></em> &nbsp;</strong>
				<span id="error1"></span>
			</div>
		</div>
          </div><br>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label"> Branch Address1</label>
            <input type="text" class="form-control" id="branchaddress1" placeholder="address1">
              <span id="branchaddress1Error"></span>
          </div><br>
          <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">Branch Address2</label>
            <input type="text" class="form-control" id="branchaddress2" placeholder="address2" >
               <span id="branchaddress2Error"></span>
          </div><br>
           <input class="btn btn-primary" type="submit" value="Add Branch" id="addbranch"></br>
</div>

</body>
</html>