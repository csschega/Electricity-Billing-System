<%-- 
    Document   : checkforedit
    Created on : Feb 13, 2022, 2:33:18 AM
    Author     : CSS Chega
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  background-image: url("lamp.jpg.jpg");    
}
</style>
    <body>
        <form id="form" method="post" action="check" class="form-horizontal">
            <!<!-- to get the table values -->  
              
        
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">User Checking</h2>
                </div>
            </div>


<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label>Email</label>
                   <input type="email" name="email" class="form-control" id="email" placeholder="Enter your Email">
                  </div>
</div>
    
            
            <div class="form-group" align="right">
            
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 90px;">GO</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>  
        </form>
        <div class="form-group"  align="right">
            <a href="user.jsp"><Button class="btn btn-success" style="width: 90px;">Back</Button></a>
        </div>
    </body>
</html>
