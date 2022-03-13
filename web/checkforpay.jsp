<%-- 
    Document   : checkforpay
    Created on : Feb 14, 2022, 10:38:46 AM
    Author     : CSS Chega
--%>

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
  background-image: url("electricity-billing.webp");    
}
</style>
    <body>
        <form id="form" method="post" action="paymenttbl.jsp" class="form-horizontal">
            <!<!-- to get the table values -->  
              
        
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4" style="color:cyan">
                    <h2 style="text-align: center">Payment Checking</h2>
                </div>
            </div>


<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                   <label style="color:cyan">Bill Number</label>
                   <input type="number" name="billno" class="form-control" id="billno" placeholder="Enter your Bill_no">
                  </div>
</div>
    
            
            <div class="form-group" align="center">
            
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 90px;">GO</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>  
        </form>
        <div class="form-group"  align="center">
            <a href="user.jsp"><Button class="btn btn-success" style="width: 90px;">Back</Button></a>
        </div>
    </body>
</html>

