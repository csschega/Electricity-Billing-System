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
                <h2 style="text-align: center">Bill Details</h2>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="admin.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col" style="color:cyan">Username</th>
                    <th scope="col" style="color:cyan">Current_Meter</th>
                    <th scope="col" style="color:cyan">Previous_Meter</th>
                    <th scope="col" style="color:cyan">Month</th>
                    <th scope="col" style="color:cyan">Cost</th>
                    <th scope="col" style="color:cyan">Bill_no</th>
                    <th scope="col" style="color:cyan">Status</th>

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
                    String query = "SELECT *FROM  e_bill";
                    pst = con.prepareStatement(query);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <th style="color:cyan" scope="row"><%= rs.getString("uname")%></th>-
                    <th style="color:cyan" scope="row"><%= rs.getString("c_metter")%></th>
                   <th style="color:cyan" scope="row"><%= rs.getString("p_metter")%></th>
                    <th style="color:cyan" scope="row"><%= rs.getString("month")%></th>
                    <th style="color:cyan" scope="row"><%= rs.getString("cost")%></th>
                    <th style="color:cyan" scope="row"><%= rs.getString("billno")%></th>
                    <th style="color:cyan" scope="row"><%= rs.getString("status")%></th>

                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>