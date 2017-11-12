package com.database.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


/**
 * Created by Akash on 27-08-2017.
 */

public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Hello World!</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Hello World!</h1>");

        Connection connection =null;
        Statement statement = null;
        ResultSet resultSet = null;



        try {

            Class.forName("com.mysql.jdbc.Driver");
            connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb","root","root");

            String sql = "SELECT * FROM student";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);


            while (resultSet.next()){

                out.println(resultSet.getInt("roll"));
                out.println(resultSet.getString("name"));
                out.println(resultSet.getInt("age"));

            }


        } catch (SQLException e) {


            e.printStackTrace();
            out.print("exception");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        out.println("</body>");
        out.println("</html>");




    }
}
