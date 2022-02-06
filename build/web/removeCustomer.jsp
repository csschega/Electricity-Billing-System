<%-- 
    Document   : removeCustomer
    Created on : Feb 3, 2022, 11:25:33 AM
    Author     : CSS Chega
--%>

   <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("lamp.jpg.jpg");    
}
</style>

<%
            
            Connection con;    
    
     
                                String uname = request.getParameter("id");
  
     
      Class.forName("com.mysql.jdbc.Driver");
                                 con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system","root","");
      String query = "delete from  customer where uname = ?";
     
      PreparedStatement pst = con.prepareStatement(query);
     
     
      pst.setString(1, uname);
      pst.executeUpdate();
    %>  
    
    <script>
        
          window.location.replace("viewCustomer.jsp");      
        
    </script>