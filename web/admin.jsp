<%-- 
    Document   : admin
    Created on : Feb 11, 2022, 2:25:15 AM
    Author     : CSS Chega
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
 
<style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("electricity-billing.webp");    
}
</style>
</head>


<body style="padding:30px" >
        
        <div>
<a href="addCustomer.jsp"  class="btn btn-success">Add Customer</a>
<a href="viewCustomer.jsp" class="btn btn-success">View Customer</a>
<a href="preparebill.jsp" class="btn btn-success">Prepare Bill</a>
<a href="billinfo.jsp" class="btn btn-success">Bill_info</a>
<a href="index.jsp" class="btn btn-primary">Logout</a>
</div>
</body>
</html>




