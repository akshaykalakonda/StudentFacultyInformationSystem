<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide|Sofia|Trirong">
  <style>
 
@media (min-width: 1020px) {
  .navbar-nav > li > a {
    /* (80px - line-height of 27px) / 2 = 26.5px */
    padding-top: 26.5px;
    padding-bottom: 26.5px;
    line-height: 27px;
    font-size: 18px !important;
  }
}

body {
  background-image: url('images/homepage.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
  font-family: "Trirong", serif;
}

</style>
  
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-brand mb-0 mb-md-1">
      
      <a href="">
        <img alt="Logo" class="img-fluid py-1" src="images/logo.jpg" aria-role="logo" height="60" width="120">
      </a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span> Login As<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="adminlogin.jsp">Admin</a></li>
          <li><a href="facultylogin.jsp">Faculty</a></li>
        </ul>
      </li>
    </ul>
  </div>	
</nav>
  
<div class="container" style="margin-top:80px">
  <br><br><br><br><br><br><br>
  <h1 style="color: whitesmoke;"><b>Faculty & Student Information System</b></h1>
    <h3 style="color: whitesmoke;">An effective management system <br>for a Modern Campus.</h3>
  
</div>

</body>
</html>
