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
  <div><a href="/bankingsystem/add-branch">Add Branch</a></div>
  <div><a href="/bankingsystem/show-transaction-datewise">Show Transaction Date Wise</a></div>
  <div><a href="/bankingsystem/search-customer">Search Customer</a></div>
  <div><a href="/bankingsystem/branch-total-balance-page">Branch Total Balance</a></div>
   <div><a href="/bankingsystem/admin-update-page">Update Existing Account</a></div>
</div>
</body>
</html>