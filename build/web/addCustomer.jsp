<%-- 
    Document   : addCustomer
    Created on : Feb 1, 2022, 10:08:26 AM
    Author     : CSS Chega
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
 
<html>
    <head>    
        <title>Customers Registration Form</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
    </head>
        
        <style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("lamp.jpg.jpg");    
}
</style>
        
    <body>
        
         <%  
            Connection con;    
            String msg = "";
            String color = "";
       if(request.getMethod().compareToIgnoreCase("post")==0)
   {
   try
   {
      String fname = request.getParameter("fullname");
      String tname = request.getParameter("username");
      String subject = request.getParameter("email");
      String address = request.getParameter("phone");
      String phone = request.getParameter("address");
      String password = request.getParameter("password");
     
      Class.forName("com.mysql.jdbc.Driver");
                                 con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system","root","");
      String query = "INSERT INTO customer(fname,uname,email,pnumber,address,password) VALUES (?,?,?,?,?,?)";
     
      PreparedStatement pst = con.prepareStatement(query);
     
      pst.setString(1, fname);
      pst.setString(2, tname);
      pst.setString(3, subject);
      pst.setString(4, address);
      pst.setString(5, phone);
      pst.setString(6, password);
     
      pst.executeUpdate();
     
      color = "blue";
      msg = "Customer Added Succesfully";
   }catch(Exception ex){
   ex.printStackTrace();
   color = "red";
   msg = "Error Occured";
   }
   }
    %>      
    <div class="form-group col-12 p-0">
        
<h4 style="color:<%= color %>"><%= msg %></h4>
</div>
        
        <form id="form" method="post" action="addCustomer.jsp" class="form-horizontal">
        
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Customer Details</h2>
                </div>
            </div>
            <hr/>
            
            <div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label >Full Name</label>
   <input type="text" name="fullname" class="form-control" id="fname">
                  </div>
</div>
            
            <div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label>User Name</label>
   <input type="text" name="username" class="form-control" id="uname">
                  </div>
</div>

<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label>Email</label>
                   <input type="email" name="email" class="form-control" id="email">
                  </div>
</div>
          <div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label>Phone Number</label>
                                        <input type="number" name="phone" class="form-control" id="pnumber">
                            </div>
</div>     
            
<div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label>Address:</label>
   <input type="text" name="address" class="form-control" id="address">
                            </div>
</div>
            
<div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                    <label>Password</label>
                                    <input type="password" name="password" class="form-control" id="password">
                            </div>
</div>
            
            
            <br/>
            
            <div class="form-group" align="center">
            
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
            
        </form>
        <div class="col-sm-12"  align="center">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
    </body>
</html>
