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
            background-image: url("lamp.jpg.jpg");
        }
    </style>

    <body>

        <div class="form-group">
            <div  class="col-sm-4"></div>
            <div  class="col-sm-4">
                <h2 style="text-align: center">Customer Details</h2>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Main</Button></a>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Full_Name</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone_Number</th>
                    <th scope="col">Address</th>

                </tr>
            </thead>
            <tbody>
                <!<!-- normal java code -->
                <%
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/billing_system", "root", "");
                    String query = "SELECT fname,uname,email,pnumber,address  FROM  customer";
                    pst = con.prepareStatement(query);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <th scope="row"><%= rs.getString("fname")%></th>
                    <td><%=rs.getString("uname")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("pnumber")%></td>
                    <td><%=rs.getString("address")%></td>

                    <td>
                        <a class="btn btn-success" href="editCustomer.jsp?id=<%=rs.getString("uname")%>" role="button">Edit</a>
                        <a class="btn btn-danger" href="removeCustomer.jsp?id=<%=rs.getString("uname")%>" role="button"onclick="return confirm('Are you sure you want to delete?')">Remove</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>