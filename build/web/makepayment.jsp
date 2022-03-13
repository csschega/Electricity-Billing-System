<%-- 
    Document   : viewCustomer
    Created on : Feb 1, 2022, 12:39:51 PM
    Author     : CSS Chega
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Customer</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <style>
        body {
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url("electricity-billing.webp");
        }
    </style>

    <body>

        <div class="form-group">
            <div  class="col-sm-4"></div>
            <div  class="col-sm-4" style="color:cyan">
                <h2 style="text-align: center">Customer Details</h2>
            </div>
        </div>

                <!<!-- normal java code -->
                <%
                    
                           
            Connection con;    
            String msg = "";
            String color = "";
  
    
       if(request.getMethod().compareToIgnoreCase("post")==0)
   {
   try
   {
    
                    PreparedStatement pst;
                    ResultSet rs;
                    String id=request.getParameter("cost");
                    String pay="payed";
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system", "root", "");
                    
                    
                    String sql="select * from e_bill where cost='"+id+"'";
                    rs=con.createStatement().executeQuery(sql);
                    
                    if(rs.next()){
                        
               
                      
                      
                    String query = "update e_bill set status='"+pay+"' where cost='"+id+"'";
                    pst = con.prepareStatement(query);
                   pst.executeUpdate();
                   

     color = "blue";
      msg = "paid Successfuly";}
                    
                    else{
                      color = "cyan";
      msg = "please enter correct amount";  
                    }
                    
   }catch(Exception ex){
   ex.printStackTrace();
   color = "red";
   msg = "Error Occured";
   }
   }         %>
         
  <div class="form-group col-12 p-0">
        
<h4 style="color:<%= color %>"><%= msg %></h4>
</div>
        
        <form id="form" method="post" action="makepayment.jsp" class="form-horizontal">
                  
                       
            
<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label style="color:cyan">Amount</label>
                   <input type="number" name="cost" class="form-control" id="billno" placeholder="Enter your amount">
                  </div>
</div>
                   <div class="form-group" align="center">
            
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 90px;">pay</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
        </form>
    </body>
</html>