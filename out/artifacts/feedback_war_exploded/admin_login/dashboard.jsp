<%@ page import="java.util.List" %>
<%@ page import="com.list.servlet.Year" %>
<%@ page import="com.database.servlet.CRUDManager" %>
<%

    if(session.getAttribute("user")==null){

        response.sendRedirect("../index.jsp");

    }

    else if(!session.getAttribute("user").equals("admin")){

        response.sendRedirect("../index.jsp");

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
    body{

    }

    .box-padding{




    }

  </style>

  <script type="application/javascript">


    function isExists(year) {

       return false;

    }
    function create(){



        var cYear = document.getElementById("createYear").value;
        //alert(cYear);
        if(cYear==''){
            alert("please Enter Current Year");
        }
        else if(isNaN(cYear)){
            alert("please Enter Correct Year");
        }
        else if(isExists(cYear)){

            alert("Year already Exists");
        }
        else{




            window.location.href="DashboardServlet?crud=create&year="+cYear;
        }



    }

   function Tdelete() {
        var e = document.getElementById("delete");
        var dYear = e.options[e.selectedIndex].value;
       window.location.href="DashboardServlet?crud=delete&year="+dYear;
   }
   function insert(){

       // alert("insert value");

       var e = document.getElementById("insert");
       var iYear = e.options[e.selectedIndex].value;

      // alert("value : "+iYear);
       document.getElementById("year").value = iYear;


     /* var x = document.createElement("INPUT");
      x.setAttribute("type","text");
      x.setAttribute("name","crud");
      x.setAttribute("value","insert");

     document.getElementById("insertform").appendChild(x);


       var y = document.createElement("INPUT");
       y.setAttribute("type","text");
       y.setAttribute("name","year");
       y.setAttribute("value",iYear);

       document.getElementById("insertform").appendChild(y);

       document.getElementById("insertform").submit();
*/


   }

   function publishlink(){

       var y = document.getElementById("publishyear");
       var s = document.getElementById("publishsem");

       var getYear = y.options[y.selectedIndex].value;
       var getSem  = s.options[s.selectedIndex].value;
      // alert(getYear+" - "+getSem);

       window.location.href="DashboardServlet?crud=publish&year="+getYear+"&sem="+getSem;

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
        <li class="active">
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
        Dashboard

      </h1>
      <ol class="breadcrumb">
        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

      </ol>
    </section>
    <br><br><br>

    <div class="row" style="padding-left: 7px; padding-right: 7px;">
    <div class="col-md-6">
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Create</h3>


          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body box-padding">


            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">

                <div class="form-group">
                  <label for="createYear" class="col-sm-2 control-label">Year</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="createYear" placeholder="Enter the current year">
                  </div>
                </div>



              <!-- /.box-body -->
              <button type="button" onclick="create()" class="btn btn-warning pull-right">Create</button>

              <!-- /.box-footer -->
            </form>

        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
      <div class="col-md-6">
        <div class="box box-primary box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">Update</h3>


            <!-- /.box-tools -->
          </div>
          <!-- /.box-header -->
          <div class="box-body box-padding" >
            <div class="col-md-12">

              <form class="form-horizontal">

              <div class="form-group">
                <label for="update" class="col-sm-2 control-label">Select Year</label>

                <div class="col-sm-10">
                  <select class="form-control select2" style="" id="update" data-placeholder="Select Year" required>

                      <option value=""></option>
                    <%


                      List<Year> getYear = CRUDManager.fetch();

                      for(Year y :getYear){
                    %>

                    <option value="<%= y.getYear()%>"><%= y.getYear() %></option>


                    <%
                      }
                    %>
                  </select>

                </div>
              </div>


              <button type="submit" class="btn btn-primary pull-right">Update</button>

              </form>



              <!-- /.form-group -->

              <!-- /.form-group -->
            </div>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
    </div>

    <div class="row" style="padding-left: 7px; padding-right: 7px;">
      <div class="col-md-6">
        <div class="box box-success box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">Insert</h3>


            <!-- /.box-tools -->
          </div>
          <!-- /.box-header -->
          <div class="box-body box-padding">
            <div class="col-md-12">

              <form class="form-horizontal">

                <div class="form-group">
                  <label for="insert" class="col-sm-2 control-label">Select Year</label>

                  <div class="col-sm-10">
                    <select class="form-control select2" style="" id="insert" data-placeholder="Select Year" required>

                        <option value=""></option>
                      <%




                        for(Year y :getYear){
                      %>

                      <option value="<%= y.getYear()%>"><%= y.getYear() %></option>


                      <%
                      }
                      %>
                    </select>

                  </div>
                </div>


                <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modal-success">Insert</button>

              </form>



              <!-- /.form-group -->

              <!-- /.form-group -->
            </div>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <div class="col-md-6">
        <div class="box box-danger box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">Delete</h3>


            <!-- /.box-tools -->
          </div>
          <!-- /.box-header -->
          <div class="box-body box-padding">
            <div class="col-md-12">

              <form class="form-horizontal">

                <div class="form-group">
                  <label for="delete" class="col-sm-2 control-label">Select Year</label>

                  <div class="col-sm-10 ">
                    <select class="form-control select2" style="" id="delete" data-placeholder="Select Year">


                        <option value=""></option>
                      <%


                        for(Year y :getYear){
                      %>

                      <option value="<%= y.getYear()%>"><%= y.getYear() %></option>


                      <%
                        }
                      %>
                    </select>

                  </div>
                </div>


                <button type="button" onclick="Tdelete()" class="btn btn-danger pull-right">Delete</button>

              </form>



              <!-- /.form-group -->

              <!-- /.form-group -->
            </div>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
    </div>

      <div class="col-md-12">
          <div class="box box-default">
              <div class="box-header with-border">
                  <i class="fa fa-cloud-upload"></i>

                  <h3 class="box-title">Publish Link</h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body ">
                  <div class="alert " style="background-color:#F0F0F0" >

                      <div style="color: green">
                      <%

                         if(CRUDManager.checkActiveLink()){

                             %>
                      Active Link is published for the
                      <%

                             String[] ar = CRUDManager.getActiveYear();
                             String active_year = ar[0];
                             String active_sem = ar[1];

                        %>
                      <span style="font-weight: 600; font-size: 17px">Year -  <%= active_year %> </span> and
                          <span style="font-weight: 600; font-size: 17px">Sem -  <%= active_sem %> </span>

                      <%

                          }
                          else {
                          %>
                          No Active Link is published
                          <%

                          }

                      %>
                      </div>

                      <br>

                      <div class="row">


                      <div class="col-sm-5">
                          <select class="form-control select2" style="" id="publishyear" data-placeholder="Select Year" required>


                              <option value=""></option>
                              <%


                                  for(Year y :getYear){
                              %>

                              <option value="<%= y.getYear()%>"><%= y.getYear() %></option>


                              <%
                                  }
                              %>
                          </select>

                          <br>
                      </div>
                          <div class="col-sm-5">
                              <select class="form-control select2" style="" id="publishsem" data-placeholder="Select Semester" required>


                                  <option value=""></option>
                                  <option value="odd">ODD</option>
                                  <option value="even">EVEN</option>
                              </select>

                          </div>

                          <div>
                              <button type="button" class="btn bg-purple " onclick="publishlink()"><i class="fa fa-cloud-upload"></i> Publish</button>

                          </div>
                      </div>
                  </div>

              </div>
              <!-- /.box-body -->
          </div>
          <!-- /.box -->
      </div>

    <!-- Main content -->
    <section class="content">



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


    <div class="modal modal-success fade" id="modal-success">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Success Modal</h4>
                </div>
                <form action="DashboardServlet" method="post" enctype="multipart/form-data" id="insertform">
                <div class="modal-body">

                    <div class="row">
                    <div class="col-xs-12">
                    <select class="select2" required style="width:300px;" id="selectsem"  name="sem" data-placeholder="Please Select Semester">

                        <option value=""></option>
                        <option value="odd">ODD</option>
                        <option value="even">EVEN</option>

                    </select>

                    </div>

                    </div>
                        <br>
                        <br>

                    <div class="row">

                        <div class="col-xs-12">
                        <input type="file" name="fname" class="btn btn-success" required >

                        </div>
                    </div>

                  <div>
                    <input type="hidden" name="crud" id="crud" value="insert">
                    <input type="hidden" name="year" id="year" value="year">
                  </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                    <button type="submit" onclick="insert()" class="btn btn-outline">Save changes</button>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>





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

<!-- Select2 -->
<script src="../bower_components/select2/dist/js/select2.full.min.js"></script>

<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2().val('');

        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()

        //Date range picker
        $('#reservation').daterangepicker()
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges   : {
                    'Today'       : [moment(), moment()],
                    'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                    'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate  : moment()
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        )

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true
        })

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        })
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass   : 'iradio_minimal-red'
        })
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass   : 'iradio_flat-green'
        })

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        //Timepicker
        $('.timepicker').timepicker({
            showInputs: false
        })
    })
</script>
</body>
</html>
