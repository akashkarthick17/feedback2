<%@ page import="com.database.servlet.CRUDManager" %><%--
  Created by IntelliJ IDEA.
  User: Akash
  Date: 14-08-2017
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback</title>
</head>
<body>
<%
    if(request.getParameter("register")!=null) {
        String user = request.getParameter("register");

        session.setAttribute("studentId",user);


        CRUDManager.registerStudent(user);



        response.sendRedirect("student_login/dashboard.jsp");
    }
    else if(request.getParameter("pass")!=null){
        String pass = request.getParameter("pass");
        if (pass.equals("rmdfeedback")) {


            session.setAttribute("user","admin");

            response.sendRedirect("admin_login/dashboard.jsp");
        }
        else {


            response.sendRedirect("index.jsp");
        }
    }
    else {


        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
