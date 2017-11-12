<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.list.servlet.FeedbackQuestion" %>
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


  if(request.getParameterValues("textarea")!=null){

     String[] question = request.getParameterValues("textarea");


     CRUDManager.saveFeedbackQuesitions(question);

  }
  if(request.getParameter("create")!=null){

      CRUDManager.createFeedbackQuestions();

      response.sendRedirect("question_post.jsp");

  }
    if(request.getParameter("delete")!=null){

      int id = Integer.parseInt(request.getParameter("id"));
        CRUDManager.deleteFeedbackQuestions(id);

        response.sendRedirect("question_post.jsp");

    }




  List<FeedbackQuestion> fbList = CRUDManager.getFeedbackQuestion();

  request.setAttribute("fbList",fbList);



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
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css">


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


  <style type="text/css">


    .box-padding{




    }

  </style>

  <script type="application/javascript">

    function create(){

        window.location.href="question_post.jsp?create=create";


    }
    function save() {
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
        <li class="">
          <a href="survey_reports.jsp"><i class="fa fa-pie-chart"></i>
            <span>Survey Reports</span>
          </a>
        </li>
        <li class="active">
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
      <h1>
      Feedback Questions

      </h1>
      <ol class="breadcrumb">
        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

      </ol>
    </section>

    <br><br><br>
    <!-- Application buttons -->
    <!-- Application buttons -->



        <a class="btn btn-app" style="background-color:  white;" onclick="create()">
          <i class="fa fa-plus"></i> Create
        </a>
        <a class="btn btn-app" style="background-color:  white;" onclick="save()">
          <i class="fa fa-save"></i> Save
        </a>



      <form action="question_post.jsp" method="post" id="form">
    <C:forEach var="temp" items="${fbList}">

    <div class="row " style="margin-left:15px; margin-right: 15px;">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Question ${temp.qno}
            <small></small>
        </h3>

      </div>
      <!-- /.box-header -->

      <div class="box-body pad">
          <span><a href="question_post.jsp?delete=delete&id=${temp.qno}" class="btn btn-danger pull-right fa fa-trash "></a></span>

                <textarea class="textarea" placeholder="Place some text here" name="textarea"
                          style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">


                  ${temp.question}

                </textarea>

      </div>
    </div>
    </div>

    </C:forEach>

      </form>





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
<!-- Bootstrap WYSIHTML5 -->
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>

<!-- Select2 -->
<script src="../bower_components/select2/dist/js/select2.full.min.js"></script>
<script>
    $(function () {

        //bootstrap WYSIHTML5 - text editor
        $('.textarea').wysihtml5()
    })
</script>
</body>
</html>
