/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CSS Chega
 */
public class check extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        
        String id=request.getParameter("email");
        
        String proximaPage = " ";
        
       if(NewClass.validate(id)){
           
            proximaPage = "/editinfo.jsp";
       }
       else
       {
            proximaPage = "/user.jsp";
       } 
       RequestDispatcher rd = request.getRequestDispatcher(proximaPage);
       rd.forward(request, response);
        
    }

   

}
