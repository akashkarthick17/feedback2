<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.list.servlet.Staff" %>
<%@ page import="java.util.List" %>
<%@ page import="com.database.servlet.CRUDManager" %>

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
    int sem = Integer.parseInt(request.getParameter("sem"));
    String dept = request.getParameter("dept");
    String section = request.getParameter("section");


    List<Staff> staff = CRUDManager.getStaffList(year,dept,sem,section);
    request.setAttribute("staffDetails",staff);
    request.setAttribute("sYear",year);

    String semester ="";
    if(sem%2==0){

        semester="even";
    }
    else{
        semester="odd";
    }







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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <script type="application/javascript">


        function fRating(year,sem,staffname, subcode,subname){



            //alert("hello");
            //alert(year+" "+staffname+" "+subcode+" "+subname);

            document.getElementById("year").value=year;
            document.getElementById("subname").value=subname;
            document.getElementById("subcode").value=subcode;
            document.getElementById("staffname").value=staffname;
            document.getElementById("sem").value=sem;


            document.getElementById("form").submit();




        }



    </script>




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
                <li class="">
                    <a href="feedback_reports.jsp"><i class="fa fa-line-chart"></i>
                        <span>Feedback Reports</span>
                    </a>
                </li>
                <li class="active">
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

            <ol class="breadcrumb">
                <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

            </ol>
        </section>

        <br><br><br><br>

        <!-- Main content -->
        <section class="content">


            <form action="staff_survey_rating.jsp" method="post" id="form">
                <input type="hidden" name="year" id="year">
                <input type="hidden" name="subcode" id="subcode">
                <input type="hidden" name="subname" id="subname">
                <input type="hidden" name="staffname" id="staffname">
                <input type="hidden" name="sem" id="sem">

            </form>

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Staff Rating</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped">
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>Staff Name</th>
                            <th>Subject Code</th>
                            <th>Subject Name</th>
                            <th>Overall Rating in Percentage</th>
                            <th style="width: 40px">Label</th>
                        </tr>
                        <% int i=1; %>
                        <C:forEach var="temp" items="${staffDetails}" >
                            <tr>
                                <td><%= i %>.</td>
                                <td><a href="#" onclick="fRating('<%= request.getAttribute("sYear")%>','<%= semester %>','${temp.staffName}','${temp.subjectCode}','${temp.subjectName}')">${temp.staffName}</a></td>
                                <td>${temp.subjectCode}</td>
                                <td>${temp.subjectName}</td>
                                <td>
                                    <div class="progress progress-xs progress-striped active">
                                        <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                                    </div>
                                </td>
                                <td><span class="badge bg-green">90%</span></td>
                            </tr>

                            <%
                                ++i;
                            %>
                        </C:forEach>

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
</body>
</html>
