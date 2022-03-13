<%-- 
    Document   : editCustomer
    Created on : Feb 3, 2022, 5:04:58 AM
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
        <title>Customer Editing form</title>
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
        
         <%
            
            Connection con;    
            String msg = "";
            String color = "";
  
    
       if(request.getMethod().compareToIgnoreCase("post")==0)
   {
   try
   {
            
      String fname = request.getParameter("fname");
      String uname = request.getParameter("uname");
      String email = request.getParameter("email");
      String pnumber = request.getParameter("pnumber");
      String address = request.getParameter("address");
     
     
      Class.forName("com.mysql.jdbc.Driver");
                                 con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system","root","");
      String query = "update customer set fname= ?, email= ?, 	pnumber =? ,address= ? where uname = ?";
     
      PreparedStatement pst = con.prepareStatement(query);
      
      
       pst.setString(1, fname);
      pst.setString(2, email);
      pst.setString(3, pnumber);
      pst.setString(4, address);
      pst.setString(5, uname);
      
      pst.executeUpdate();
     
      color = "blue";
      msg = "Customer Updated Succesfully";
     
     
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
        
        <form id="form" method="post" action="editCustomer.jsp" class="form-horizontal">
            <!<!-- to get the table values -->  
             <%
                          
                            PreparedStatement pst;
                            ResultSet rs;
 
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system","root","");
                            
                           String id = request.getParameter("id");
                          
                            pst = con.prepareStatement("SELECT fname,uname,email,pnumber,address  FROM  customer where uname = ?");
                            pst.setString(1, id);
                            rs = pst.executeQuery();
                            
                            while(rs.next())
                            {
                    
                    %>  
        
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4" style="color:cyan">
                    <h2 style="text-align: center">Customer Details</h2>
                </div>
            </div>
            <hr/>
                        <div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label style="color:cyan">Full Name</label>
   <input type="text" name="fname" class="form-control" id="fname" value="<%= rs.getString("fname")%>">
                  </div>
</div>
            
            <div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label style="color:cyan">User Name</label>
                   <input type="text" name="uname" class="form-control" id="uname" value="<%= rs.getString("uname")%>">
                  </div>
</div>

<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label style="color:cyan">Email</label>
                   <input type="email" name="email" class="form-control" id="email" value="<%= rs.getString("email")%>">
                  </div>
</div>
          <div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label style="color:cyan">Phone Number</label>
                                        <input type="number" name="pnumber" class="form-control" id="pnumber" value="<%= rs.getString("pnumber")%>">
                            </div>
</div>     
            
<div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label style="color:cyan">Address:</label>
                                         <input type="text" name="address" class="form-control" id="address" value="<%= rs.getString("address")%>">
                            </div>
</div>
            
                                                   
            <br/>
            
            <div class="form-group" align="right">
            
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 90px;">Confirm</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
            
             <% } %>
        </form>
        <div class="form-group"  align="right">
            <a href="viewCustomer.jsp"><Button class="btn btn-success" style="width: 90px;">Back</Button></a>
        </div>
    </body>
</html>