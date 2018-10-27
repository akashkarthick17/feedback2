<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.database.servlet.CRUDManager" %>
<%@ page import="com.list.servlet.Rating" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>

<%

    if(session.getAttribute("user")==null){

        response.sendRedirect("../index.jsp");

    }

    else if(!session.getAttribute("user").equals("admin")){

        response.sendRedirect("../index.jsp");

    }


%>





<%

    int year = Integer.parseInt(request.getParameter("year"));

    String subcode = request.getParameter("subcode");

    String subname = request.getParameter("subname");
    String staffname = request.getParameter("staffname");


    String semester = request.getParameter("semester");
    int sem = Integer.parseInt(request.getParameter("sem"));
    String dept = request.getParameter("dept");
    String sec = request.getParameter("sec");


//    out.print(year);
//    out.print("<br>");
//
//    out.print(subcode);
//    out.print("<br>");
//    out.print(subname);
//    out.print("<br>");
//    out.print(staffname);
//    out.print("<br>");
//    out.print(sem);
//    out.print("<br>");


    List<Rating> ratingList = CRUDManager.getFeedbackRating(year,semester,staffname,subcode,subname,sem,dept,sec);

    String questionString = "";
    String ratingString = "";
    double ratingCount = 0.0;
    for(Rating r : ratingList) {
        questionString += r.getQuestion()+"%@! ";
        ratingString += r.getRating()+"%@! ";
        ratingCount  = ratingCount + r.getRating();
    }

    double totalRating = ratingCount/ratingList.size();

//
//    if(ratingList.isEmpty()){
//
//        out.print("the list is empty");
//    }
//    else{
//
//
//        out.print("the list is not empty");
//    }
//
//
//    for(Rating r : ratingList){
//
//        out.print("Question--> "+r.getQuestion());
//    }

    request.setAttribute("SpecificStaffDetails",ratingList);





%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="../images/rmd.ico">
    <title>Feedback</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">

    <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

    <link rel="stylesheet" href="css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="../plugins/Buttons-1.4.0/css/buttons.dataTables.css">



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="dashboard.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>F</b>B</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Feedback</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="../images/rmd.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">RMD Engineering College</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="../images/rmd.jpg" class="img-circle" alt="User Image">

                                <p>
                                    Admin
                                    <small>RMD Engineering College</small>
                                </p>
                            </li>

                            <!-- Menu Footer-->
                            <li class="user-footer">

                                <div class="pull-right">
                                    <a href="../logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->

                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../images/rmd.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Welcome Admin</p>

                </div>
            </div>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MAIN NAVIGATION</li>
                <li class="">
                    <a href="dashboard.jsp"><i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="active">
                    <a href="feedback_reports.jsp"><i class="fa fa-line-chart"></i>
                        <span>Feedback Reports</span>
                    </a>
                </li>
                <li class="">
                    <a href="survey_reports.jsp"><i class="fa fa-pie-chart"></i>
                        <span>Survey Reports</span>
                    </a>
                </li>
                <li class="">
                    <a href="question_post.jsp"><i class="fa fa-question-circle-o"></i>
                        <span>Feedback Questions</span>
                    </a>
                </li>
                <li class="">
                    <a href="question_post_survey.jsp"><i class="fa fa-question-circle-o"></i>
                        <span>Survey Questions</span>
                    </a>
                </li>
                <li class="">
                    <a href="student_list.jsp"><i class="fa fa-user"></i>
                        <span>Students List</span>
                    </a>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>

            </h1>
            <ol class="breadcrumb">
                <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

            </ol>
        </section>

        <br><br>

        <!-- Main content -->
        <section class="content">


            <form target="_blank" action="download">
                <input type="hidden" value="<%= questionString %>" name="questionString">
                <input type="hidden" value="<%= ratingString %>" name="ratingString">
                <input type="hidden" value="<%= totalRating %>" name="totalRating">
                <input type="hidden" value="<%= subname %>" name="subjectTitle">
                <input type="hidden" value="<%= subcode %>" name="subjectCode">
                <input type="hidden" value="<%= staffname %>" name="staffName">
                <input type="hidden" value="<%= dept %>" name="department">
                <input type="hidden" value="<%= sem %>" name="semester">
                <input type="hidden" value="<%= sec %>" name="section">
                <input type="hidden" value="<%= year %>" name="year">
                <button type="submit" class="btn btn-primary">Export as PDF</button>
            </form>
            <%--<a target="_blank" href="download">Export as PDF</a>--%>

            <div class="box" >
                <div class="box-header" >
                    <h3 class="box-title"><bold style="font-weight: 700">Staff Name - </bold><%= staffname %></h3> &ensp; <br> <br>
                    <h3 class="box-title"><bold style="font-weight: 700">Subject Name - </bold><%= subname %></h3>  &ensp;
                    <h3 class="box-title"><bold style="font-weight: 700">Subject Code - </bold><%= subcode %></h3>  &ensp;

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table  class="table table-bordered table-striped"  id="example">

                        <thead>

                        <tr>
                            <th>Question No.</th>
                            <th>Question</th>
                            <th>Strongly Agree</th>
                            <th>Agree</th>
                            <th>Neutral</th>
                            <th>Disagree</th>
                            <th>Strongly Disagree</th>
                            <th>Total Students</th>
                            <th>Rating</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--<tr>--%>


                        <%--<td style="font-size: large; font-weight: 600"><%= subcode %></td>--%>
                        <%--<td style="font-size: large; font-weight: 600"><%= subname%></td>--%>
                        <%--<td style="font-size: large; font-weight: 600"><%= staffname%></td>--%>
                        <%--<td></td>--%>
                        <%--<td></td>--%>
                        <%--<td></td>--%>
                        <%--<td></td>--%>
                        <%--<td></td>--%>
                        <%--<td></td>--%>
                        <%--</tr>--%>


                        <%

                           double i=0.0;


                            DecimalFormat f = new DecimalFormat("##.00");

                        for(Rating r : ratingList) {


                        %>

                        <tr>

                        <td><%= r.getQno() %>    </td>
                        <td><%= r.getQuestion() %>    </td>
                        <td><%= r.getSa() %>    </td>
                        <td><%= r.getA() %>    </td>
                        <td><%= r.getN() %>    </td>
                        <td><%= r.getD() %>    </td>
                        <td><%= r.getSd() %>    </td>
                        <td><%= r.getTotal() %>    </td>
                        <td><%= f.format(r.getRating()) %>    </td>

                        </tr>
                        <%

                                i = i + r.getRating();


                            }

                        %>


                        <tr>

                            <td></td>
                            <td  style="font-weight: 600;">Overall Rating</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="font-weight: 600;"><%= f.format(i/ratingList.size())  %> </td>



                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>



        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 <a href="https:/www.flixys.com">Flixys Pvt Ltd</a>.</strong> All rights
        reserved.
    </footer>


</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>

<script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>



<script src="js/jquery-1.12.4.js"></script>
<script src="js/dataTables.buttons.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jszip.min.js"></script>
<script src="js/pdfmake.min.js"></script>
<script src="js/vfs_fonts.js"></script>
<script src="js/buttons.html5.min.js"></script>
<script src="../plugins/Buttons-1.4.0/js/dataTables.buttons.min.js"></script>
<script src="../plugins/Buttons-1.4.0/js/buttons.flash.js"></script>
<script src="../plugins/Buttons-1.4.0/js/buttons.html5.js"></script>
<script src="../plugins/Buttons-1.4.0/js/buttons.print.js"></script>



<script >
    $(document).ready(function() { $('#example').DataTable(
        {
            paginate :false,

            bSort : false
        }
 );
    } );

</script>
</body>
</html>
