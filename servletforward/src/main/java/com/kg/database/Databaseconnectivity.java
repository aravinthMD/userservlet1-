package com.kg.database;
 
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/book")
public class Databaseconnectivity extends HttpServlet {
 
    public Databaseconnectivity() {}
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html"); 

        PrintWriter out = response.getWriter();

         

        try {

            Class.forName("com.mysql.jdbc.Driver");

             

            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/aravi?"
                                            + "user=root&password=");

          
           Statement statement = connect.createStatement();

             

            ResultSet resultSet = statement.executeQuery("select * from aravi.college");



            out.println("<table border=\"1\">");

            while(resultSet.next()) {

                out.println("<tr>");
                out.println("<td>" + resultSet.getInt("id") + "</td>");
                out.println("<td>" + resultSet.getString("name") + "</td>");

                out.println("<td>" + resultSet.getString("department") + "</td>");
                out.println("<td>" + resultSet.getString("age") + "</td>");
               

                out.println("</tr>");
                out.println("<a href=index.jsp>EDIT</a>");

            }

            out.println("</table>");
            out.println("<a href=/index.jsp>add user</a>");


        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            if(out != null)

                out.close();

        }

    }

 

}
