package com.database.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;

/**
 * Created by Akash on 03-09-2017.
 */
@WebServlet(name = "DashboardServlet")
public class DashboardServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        PrintWriter out = response.getWriter();


        String crud = request.getParameter("crud");
        String year = request.getParameter("year");


        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        if (crud != null && crud.equals("create")) {


            CRUDManager.create(Integer.parseInt(year));
            response.sendRedirect("dashboard.jsp");

        } else if (crud != null && crud.equals("delete")) {


            CRUDManager.delete(Integer.parseInt(year));
            response.sendRedirect("dashboard.jsp");

        }
        else if (crud != null && crud.equals("publish")) {


            String sem = (request.getParameter("sem"));


            CRUDManager.publish(year,sem);
            response.sendRedirect("dashboard.jsp");

        }


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        PrintWriter out = response.getWriter();



        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_login/upload");
        requestDispatcher.forward(request,response);




    }
    }
