<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{

}
 	div a{
 	text-decoration:none;
 	color: white;
 	}
 	
 	div a:hover{
 	color: white;
 	}
 	
 	.nav-bar{
 	display:flex;
 	justify-content:space-around;
 	background:#992600;
 	}
 	
 	.nav-bar div{
 	padding:10px;
 	}
 	
 	.nav-bar div:hover{
 	background:#DC506A;
 	}
 	
 	
</style>
</head>
<body>
<div class="nav-bar">
   <div><a href="/bankingsystem/customer-details">AccountDetails</a></div>
  <div><a href="/bankingsystem/transfer">Transfer</a></div>
  <div><a href="/bankingsystem/transactional-history">Transactional History</a></div>
  <div><a href="/bankingsystem/update">Update Existing Account</a></div>
</div>
</body>
</body>
</html>