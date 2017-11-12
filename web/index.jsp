<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" href="images/rmd.ico">

  <title>Feedback</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<style type="text/css" >

    body{
        overflow: hidden;
    }

</style>
<script type="application/javascript">

  function checkStudent(){

      var name = document.getElementById("register").value;

      var button = document.getElementById("button");

      if(name ==''){

          alert("Please Enter Register Number");

      }

      else {
          if (!isNaN(name)) {
              location.href = "login.jsp?register=" + name;
          }

          else {
              // data-toggle="modal" data-target="#modal-info"

              button.setAttribute("data-toggle", "modal");
              button.setAttribute("data-target", "#modal-info");

          }
      }
     // alert("hello "+name);

  }
  function validateAdmin(){


      var user = document.getElementById("register").value;
      var pass = document.getElementById("password").value;



      if(user == "admin@rmd.ac.in"){
          location.href = "login.jsp?pass="+pass;s
      }

          location.href= "index.jsp";



  }
  function key(e){
      if(e.keyCode==13){
          //alert("enter is pressed");

          document.getElementById("button").click();

          return false;
      }
  }
  function keyLogin(e){
      if(e.keyCode==13){
          //alert("enter is pressed");

          document.getElementById("buttonLogin").click();

          return false;
      }
  }
</script>
<body class="hold-transition lockscreen" id="body">

<!-- Automatic element centering -->
<div class="lockscreen-wrapper" id="feedback">
  <div class="lockscreen-logo">
    <p ><b >Feedback</b> System</p>
  </div>
  <!-- User name -->
  <div class="lockscreen-name" >Enter Register Number</div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="images/user.png" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form   class="lockscreen-credentials">
      <div class="input-group">
        <input type="text" class="form-control" id="register" onkeypress="return key(event)" autocomplete="off" name="register" placeholder="Register Number">

        <div class="input-group-btn">
          <button type="button" id="button" name="submit" onclick="checkStudent()" class="btn" ><i class="fa fa-arrow-right text-muted"></i></button>
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <br>

  <div class="lockscreen-footer text-center">
    Copyright &copy; 2017 <b><a href="https://www.flixys.com" class="">Flixys Pvt Ltd.</a></b><br>
    All rights reserved
  </div>
</div>


<div class="modal modal-info fade" id="modal-info">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"> &times; </span></button>
        <h4 class="modal-title">Password</h4>
      </div>
      <div class="modal-body">
        <div class="box box-primary">


          <input class="form-control" onkeypress="return keyLogin(event)" autofocus type="password" id="password" placeholder="Enter Password" required>

        </div>
        <!-- /.box-body -->
      </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
      <button type="button" onclick="validateAdmin()" id="buttonLogin"  class="btn btn-outline">Login</button>
    </div>
  </div>
  <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.center -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
