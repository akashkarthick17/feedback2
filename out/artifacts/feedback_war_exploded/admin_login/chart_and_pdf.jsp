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

    <link rel="stylesheet" type="text/css" href="html-to-pdf-2/style.css" />

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





</head>
<body class="hold-transition skin-blue sidebar-mini" >
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
            <span>Questions</span>
          </a>
        </li>


      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="body">
    <!-- Content Header (Page header) -->
    <section class="content-header" >
      <h1>
        Feedback Reports

      </h1>
      <ol class="breadcrumb">
        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

      </ol>
    </section>

      <br>
      <br>

      <button  onclick="genPDF()">Download PDF</button>


    <div class="row" style=" padding: 30px;" id="donut">
      <div class="col-xs-6">
    <div class="box box-danger">
      <div class="box-header with-border">
        <h3 class="box-title">Donut Chart</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
          </button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
      </div>
      <div class="box-body">
        <canvas id="pieChart" style=""></canvas>
      </div>
      <!-- /.box-body -->
    </div>
    </div>
    </div>



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
<!-- ChartJS -->
<script src="../bower_components/chart.js/Chart.js"></script>
<!-- FastClick -->
<script src="../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>

<!-- Select2 -->
<script src="../bower_components/select2/dist/js/select2.full.min.js"></script>


<script src="jsPDF-master/dist/jspdf.min.js"></script>
<script src="html2canvas.js"></script>


<script type="application/javascript">

function genPDF() {




    html2canvas(document.getElementById("donut"),{

        onrendered : function (canvas) {

            var img = canvas.toDataURL("image/png");

            var doc = new jsPDF();
            doc.addImage(img,0,0,200,130);
            doc.save("test.pdf");
        }

    });

}
</script>




<script>
    $(function () {
      /* ChartJS
       * -------
       * Here we will create a few charts using ChartJS
       */



        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieChart       = new Chart(pieChartCanvas)
        var PieData        = [
            {
                value    : 700,
                color    : '#f56954',
                highlight: '#f56954',
                label    : 'Chrome'
            },
            {
                value    : 500,
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : 'IE'
            },
            {
                value    : 400,
                color    : '#f39c12',
                highlight: '#f39c12',
                label    : 'FireFox'
            },
            {
                value    : 600,
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : 'Safari'
            },
            {
                value    : 300,
                color    : '#3c8dbc',
                highlight: '#3c8dbc',
                label    : 'Opera'
            },
            {
                value    : 100,
                color    : '#d2d6de',
                highlight: '#d2d6de',
                label    : 'Navigator'
            }
        ]
        var pieOptions     = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke    : true,
            //String - The colour of each segment stroke
            segmentStrokeColor   : '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth   : 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps       : 100,
            //String - Animation easing effect
            animationEasing      : 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate        : true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale         : false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive           : true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio  : true
            //String - A legend template
            }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions)


    })
</script>

</body>
</html>
