<%--
  Created by IntelliJ IDEA.
  User: Akash
  Date: 14-08-2017
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%


    session.removeAttribute("user");
    session.removeAttribute("staffCountTrack");
    session.removeAttribute("staffTotalCount");
    session.removeAttribute("staffCountTrack");
    session.removeAttribute("department");
    session.removeAttribute("semester");
    session.removeAttribute("section");
    session.removeAttribute("staffList");


    session.invalidate();

    response.sendRedirect("index.jsp");
%>

</body>
</html>
