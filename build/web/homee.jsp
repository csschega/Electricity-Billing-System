<%-- 
    Document   : index
    Created on : Feb 1, 2022, 1:44:57 AM
    Author     : CSS Chega
--%>


<html> 
    <head>    
        <title>Login PAGE</title>
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

                <fieldset style="width: 400px; margin:0 auto; padding: 20px; margin-top: 50px; border-bottom-color:red; ">
                    <p id="msg">
                    <% String msg = (String) request.getAttribute("msg");%>
                    <%= msg != null ? msg : ""%><br>
                </p>	
                <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">User Name</label>
                    
                </div>
                <div class="form-group">
                    <label for="pass" class="col-sm-3 control-label">Password</label>
               
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-10">
                        <button type="submit" class="btn-success">Login</button>
                    </div>
                </div>
                </fieldset>
                    	                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
                    <script src="./bootstrap/js/jquery.js"></script>
                    <script src="./bootstrap/js/bootstrap.min.js"></script>
                    </body>
                    </html>