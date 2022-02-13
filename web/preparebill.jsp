<%-- 
    Document   : preparebill
    Created on : Feb 11, 2022, 5:32:01 AM
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
        <title>Bill Preparing Form</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
    </head>
        
        <style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("bill.jpg");    
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
      
      String uname = request.getParameter("username");
      String c_metter = request.getParameter("c_meter");
      String p_metter = request.getParameter("p_meter");
      String month = request.getParameter("month");
      
      
      double val1=Double.parseDouble(c_metter);
      double val2=Double.parseDouble(p_metter);
      double count=val1-val2; 
      double charge=0;
      
      if(count>0 && count<300)
      {
          charge=1.0;
      }
      else if(count>300 && count<500)
      {
          charge=1.8;
      }
      else if(count>500 && count<700)
      {
          charge=2.5;
      }
      else
      {
          charge=3.0;
      }
      
      double cost=charge*count;
      
      if(cost<0)
      {
          color = "red";
        msg = "please enter previous and current meter correctly";
      }
      else{
      Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system","root","");
      String query = "INSERT INTO E_bill(uname,c_metter,p_metter,month,cost) VALUES (?,?,?,?,?)";
     
      PreparedStatement pst = con.prepareStatement(query);
     
      pst.setString(1, uname);
      pst.setString(2, c_metter);
      pst.setString(3, p_metter);
      pst.setString(4, month);
      pst.setDouble(5,cost);
     
     
      pst.executeUpdate();
     
      color = "blue";
      msg = "price Added Succesfully";}
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
        
        <form id="form" method="post" action="preparebill.jsp" class="form-horizontal">
        
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Bill Calculation</h2>
                </div>
            </div>
            <hr/>
            
            <div class="form-group" align="center">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label>User Name</label>
   <input type="text" name="username" class="form-control" id="uname">
                  </div>
</div>

<div class="form-group" align="center">
                 <div  class="col-sm-4" ></div>
                  <div  class="col-sm-4 mx-auto">
                   <label>Current Meter</label>
                   <input type="number" name="c_meter" class="form-control" id="cmetter">
                  </div>
</div>
          <div class="form-group" align="center">
                            <div  class="col-sm-4" ></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label>Previous Meter</label>
                                        <input type="number" name="p_meter" class="form-control" id="pmetter">
                            </div>
</div>     
            
<div class="form-group" align="center">
                            <div  class="col-sm-4" ></div >
                            <div  class="col-sm-4 mx-auto">
                                        <label>Month</label>
                                        <input type="month" name="month" class="form-control" id="address">
                            </div>
</div>
          
            <br/>
            
            <div class="form-group" align="center">
            
                <div class="col-sm-6">
                    <div class="col-sm-2" >
                        <Button class="btn btn-success" style="width: 80px;">Done</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
            
        </form>
        <div class="col-sm-12"  align="center">
            <a href="admin.jsp"><Button class="btn btn-success" style="width: 80px;">Back</Button></a>
        </div>
    </body>
</html>