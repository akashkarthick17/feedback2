<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="com.list.servlet.Staff" %>
<%@ page import="java.util.List" %>
<%@ page import="com.database.servlet.CRUDManager" %>
<%@ page import="com.list.servlet.FeedbackQuestion" %>
<%@ page import="java.util.ArrayList" %>
<%

    List<FeedbackQuestion> fbList = CRUDManager.getFeedbackQuestion();
    int count = fbList.size();
    request.setAttribute("feedbackList",fbList);

    // set feedback question size
    pageContext.setAttribute("fbSize",count);


    List<Integer> rating = new ArrayList<>();

    //get Staff details
    List<Staff> list_staff = (List<Staff>) session.getAttribute("staffList");

    if(request.getParameter("ratingsubmit")!=null){


        //storing values........ in database

       // if(request.getParameter("sCount")!=null) {

            int c = Integer.parseInt(request.getParameter("sCount"));

            Staff s = list_staff.get(c - 1);


            for (int i = 1; i <= count; i++) {
                if (request.getParameter("hiddenradio" + i) != null) {

                    int t = Integer.parseInt(request.getParameter("hiddenradio" + i));

                    rating.add(t);
                }
            }


            CRUDManager.feedbackLog(rating,fbList,s);

       // }




        int totalCount = (int) session.getAttribute("staffTotalCount");
        int countTrack = (int) session.getAttribute("staffCountTrack");


        if(countTrack==totalCount){

            session.setAttribute("staffCountTrack",1);

            response.sendRedirect("surveydashboard.jsp");
        }
        else{

            countTrack = countTrack+1;
            session.setAttribute("staffCountTrack",countTrack);
        }

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
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css">
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

    <style type="text/css">



        .bggrey {
            background-color : #eff1f3;
            list-style-type: none;
            text-decoration: none;
            text-transform: none;
            color:black;

        }
        .scroll{
            overflow-y: scroll;
            height:600px;
        }
        .hidden{
            display: none;
        }

        *{font-family: 'Roboto', sans-serif;}

        @keyframes click-wave {
            0% {
                height: 40px;
                width: 40px;
                opacity: 0.35;
                position: relative;
            }
            100% {
                height: 200px;
                width: 200px;
                margin-left: -80px;
                margin-top: -80px;
                opacity: 0;
            }
        }

        .option-input {
            -webkit-appearance: none;
            -moz-appearance: none;
            -ms-appearance: none;
            -o-appearance: none;
            appearance: none;
            position: relative;
            top: 13.33333px;
            right: 0;
            bottom: 0;
            left: 0;
            height: 40px;
            width: 40px;
            transition: all 0.15s ease-out 0s;
            background: #cbd1d8;
            border: none;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            margin-right: 0.5rem;
            outline: none;
            position: relative;
            z-index: 1000;
        }
        .option-input:hover {
            background: #9faab7;
        }
        .option-input:checked {
            background: #40e0d0;
        }
        .option-input:checked::before {
            height: 40px;
            width: 40px;
            position: absolute;
            /*content: '✔';*/
            display: inline-block;
            font-size: 26.66667px;
            text-align: center;
            line-height: 40px;
        }
        .option-input:checked::after {
            -webkit-animation: click-wave 0.65s;
            -moz-animation: click-wave 0.65s;
            animation: click-wave 0.65s;
            background: #40e0d0;
            content: '';
            display: block;
            position: relative;
            z-index: 100;
        }
        .option-input.radio {
            border-radius: 50%;
        }
        .option-input.radio::after {
            border-radius: 50%;
        }

        .shadow {

            -moz-box-shadow:    inset 0 0 10px #000000;
            -webkit-box-shadow: inset 0 0 10px #000000;
            box-shadow:         inset 0 0 10px #000000;

        }
        a:hover{

            cursor: pointer;


        }
        .Qgreen{
            color: green;
        }




    </style>
    <script type="application/javascript">

        function myradio(question, value){

            // document.getElementById("buttonform").removeAttribute("disabled");


            //marking green
             document.getElementById("green"+question).className = "icon fa fa-check-circle Qgreen";



            var x = document.getElementById("hidden"+question);
            x.value= value;
            var flag=0;

            for(var i = 1;i<=<%=  pageContext.getAttribute("fbSize")  %>;i++){

                var y = document.getElementById("hidden"+i).value;
                if(y=="null")
                    flag=1;

            }
            if(flag===0){
                document.getElementById("buttonform").removeAttribute("disabled");
            }

            setTimeout(function (){

                document.getElementById("click"+(question+1)).click();


            }, 500);



        }


        function question(ques){

            var shadow = document.getElementById("shadow"+ques);
            shadow.classList.add("shadow");
            for(var i=1;i<=<%=  pageContext.getAttribute("fbSize")  %>;i++){
                if(i!=ques){
                    var s = document.getElementById("shadow"+i);


                    s.classList.remove("shadow");
                }

            }



            var select = document.getElementById("hidden"+ques).value;

            if(select != "null"){


                switch(select){
                    case "1":{
                        document.getElementById("one"+ques).checked = true;
                        break;
                    }
                    case "2":{
                        document.getElementById("two"+ques).checked = true;
                        break;
                    }
                    case "3":{
                        document.getElementById("three"+ques).checked = true;
                        break;
                    }
                    case "4":{
                        document.getElementById("four"+ques).checked = true;
                        break;
                    }
                    case "5":{
                        document.getElementById("five"+ques).checked = true;
                        break;
                    }
                    default :
                        document.getElementById("five"+ques).checked = true;

                }
            }




            var x = document.getElementById("rate"+ques);
            x.classList.remove("hidden");
            var xx = document.getElementById("head"+ques);
            xx.classList.remove("hidden");

            for(var i=1;i<=<%=  pageContext.getAttribute("fbSize")  %>;i++){
                if(i!=ques){
                    var y = document.getElementById("rate"+i);


                    y.classList.add("hidden");
                }

            }



            for(var i=1;i<=<%=  pageContext.getAttribute("fbSize")  %>;i++){
                if(i!=ques){
                    var yy = document.getElementById("head"+i);


                    yy.classList.add("hidden");
                }

            }

        }

    </script>

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
                                    Student
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
                    <p>Welcome Student</p>

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


            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">Subject Details</h3>
                        </div>
                        <!-- /.box-header -->
                        <%

                            int sCount = (int) session.getAttribute("staffCountTrack");
                            List<Staff> list = (List<Staff>) session.getAttribute("staffList");
                            Staff s = list.get(sCount-1);



                        %>




                        <div class="box-body">
                            <p  > <code style="font-weight: 500; font-size:17px; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif">Subject Code</code> : <%= s.getSubjectCode() %> &ensp;&ensp;&ensp;

                                <code style="font-weight: 500; font-size:17px; font-family:  'Helvetica Neue', Helvetica, Arial, sans-serif">Subject Name</code> : <%= s.getSubjectName() %> &ensp;&ensp;&ensp;


                                <code style="font-weight: 500; font-size:17px; font-family:  'Helvetica Neue', Helvetica, Arial, sans-serif">Staff Name</code>  : <%= s.getStaffName() %>.</p>


                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>

        </section>

        <!-- Main content -->
        <section class="content">



            <!-- START ALERTS AND CALLOUTS -->


            <div class="row">
                <div class="col-md-6">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <i class="fa fa-question-circle-o" ></i>

                            <h3 class="box-title">Questions</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body scroll">
                            <%
                                int j=1;
                            %>
                            <c:forEach var="temp" items="${feedbackList}">
                            <a  onclick="question(<%= j %>)" id="click<%= j %>">
                                <div class="alert  alert-dismissible hand bggrey <% if(j==1){out.print("shadow");}%>" id="shadow<%= j %>">


                                    <h4><i class="icon fa fa-question-circle" ></i> Question <%= j %> <i class="" id="green<%= j %>" ></i></h4>

                                  ${temp.question}

                                </div>
                            </a>
                                <%
                                    ++j;
                                %>

                            </c:forEach>

                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                    <form action="rating.jsp" method="post" >

                        <div class="box box-default" >

                            <%
                                int c = (int) pageContext.getAttribute("fbSize");
                                for(int i=1;i<= c;i++){

                            %>
                            <div class="box-header with-border <% if(i!=1){ out.print("hidden");} %> " id="head<%= i%>" >
                                <i class="fa fa-star-half-o"></i>

                                <h3 class="box-title">Rating for Question <%= i %></h3>
                            </div>
                            <!-- /.box-header -->

                            <div class="box-body <% if(i!=1){ out.print("hidden");} %>  " id="rate<%= i%>" style="padding-bottom: 30px;">
                                <div class="callout " style="margin-bottom: 30px;">



                                    <div class="form-group">
                                        <input type="hidden" name="hiddenradio<%= i %>" value="null" id="hidden<%= i %>"></input>


                                        <label>
                                            <input type="radio" name="r3" id="five<%= i %>" class="option-input radio"   value="5" onclick="myradio(<%= i %>,5)" >
                                            Strongly Agree

                                        </label>

                                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;

                                        <label style="">
                                            <input type="radio" name="r3" id="four<%= i %>" class="option-input radio" value="4" onclick="myradio(<%= i %>,4)" >
                                            Agree
                                        </label>
                                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                                        <label class="">
                                            <input type="radio" name="r3" id="three<%= i %>" class="option-input radio" value="3" onclick="myradio(<%= i %>,3)"  >
                                            Neutral
                                        </label>
                                        <br>
                                        <br>

                                        <label>
                                            <input type="radio" name="r3" id="two<%= i %>" class="option-input radio" value="2"  onclick="myradio(<%= i %>,2)" >
                                            Disagree
                                        </label>
                                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                                        <label>
                                            <input type="radio" name="r3" id="one<%= i %>" class="option-input radio" value="1"  onclick="myradio(<%= i %>,1)" >
                                            Strongly Disagree
                                        </label>

                                    </div>
                                </div>

                            </div>

                            <% } %>



                            <!-- /.box-body -->
                        </div>
                        <input type="hidden" name="sCount" value="<%= session.getAttribute("staffCountTrack") %>">

                        <%--disabled--%>
                        <input type="submit" disabled name="ratingsubmit" class="btn btn-info"  id="buttonform">
                    </form>

                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <!-- END ALERTS AND CALLOUTS -->



        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 <a href="https://www.flixys.com">Flixys Pvt Ltd.</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="../bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="../bower_components/moment/min/moment.min.js"></script>
<script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="../bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="../plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>

<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

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
