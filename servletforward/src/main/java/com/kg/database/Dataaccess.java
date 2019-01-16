package com.kg.database;
/**
 * Dataaccess
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
@WebServlet("/database")
public class Dataaccess extends HttpServlet {

    

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");  
       PrintWriter pw = response.getWriter();  
       String connectionURL = "jdbc:mysql://localhost:3306/aravi";// userdb is the database  
       Connection connection;  
       try{  
        int id = Integer.parseInt(request.getParameter("id"));
        String name= request.getParameter("name");  
         String department = request.getParameter("department");  
         String age= request.getParameter("age");  
         
         Class.forName("com.mysql.jdbc.Driver");  
         connection = (Connection) DriverManager.getConnection(connectionURL, "root", "");
         PreparedStatement pst = (PreparedStatement) connection
                    .prepareStatement("insert into college(id,name,department,age) values(?,?,?,?)");
         pst.setInt(1,id);  
         pst.setString(2,name);        
         pst.setString(3,department);  
         pst.setString(4,age); 
         int i = pst.executeUpdate();  
         if(i!=0){  
           pw.println("<br>Record has been inserted");  
              
      
         }  
         else{  
           pw.println("failed to insert the data");  
          }  
       }  
       catch (Exception e){  
         pw.println(e);  
       }  
       RequestDispatcher view=request.getRequestDispatcher("/book");
       view.forward(request,response);
     }  
    
}