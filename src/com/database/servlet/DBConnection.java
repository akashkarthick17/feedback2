package com.database.servlet;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.ConnectionCustomizer;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.io.PrintWriter;
import java.sql.*;
import javax.naming.*;


/**
 * Created by Akash on 03-09-2017.
 */
public  class DBConnection {


    private static DataSource dataSource;


    public static Connection database() throws NamingException, SQLException {

        Connection connection=null;
        try {
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource ds = (DataSource) context.lookup("connpool");
            connection = ds.getConnection();


        }

        catch(Exception e){

            e.printStackTrace();
        }

     return connection;
    }


    public static DataSource ConnectDatabase(){


        ComboPooledDataSource cpds = new ComboPooledDataSource();
        try {
            cpds.setDriverClass("com.mysql.jdbc.Driver");
        } catch (PropertyVetoException e) {

            e.printStackTrace();
        }
        cpds.setJdbcUrl("jdbc:mysql://localhost:3306/feedback");
        cpds.setUser("root");
        cpds.setPassword("root");
        cpds.setMinPoolSize(3);
        cpds.setAcquireIncrement(5);
        cpds.setMaxPoolSize(2000);


        dataSource = cpds;



        return  dataSource;
    }

    public static Connection  ConnectToDatabase() throws ClassNotFoundException {

        Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        try {
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback", "root", "root");
        }
        catch (Exception e){
            e.printStackTrace();

        }

        return con;
    }

}
