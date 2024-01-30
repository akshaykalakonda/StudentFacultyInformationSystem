<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.klef.ep.models.Admin"%>
       <%@page import="com.klef.ep.services.FacultyService"%>
       <%@page import="com.klef.ep.services.StudentService"%>
<%@page import="com.klef.ep.models.Faculty"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%InitialContext context=new  InitialContext();
FacultyService facultyService = (FacultyService) context.lookup("java:global/SFISYSTEM/FacultyServiceImpl!com.klef.ep.services.FacultyService");

 %>
    <%
    Admin adm = (Admin)session.getAttribute("adses");
    if(adm == null)
    {
    	response.sendRedirect("adminlogin.jsp");
    }
    %>
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
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide|Sofia|Trirong">
  <style>
 
@media (min-width: 1020px) {
  .navbar-nav > li > a {
    /* (80px - line-height of 27px) / 2 = 26.5px */
    padding-top: 26.5px;
    padding-bottom: 26.5px;
    line-height: 30px;
    font-size: 18px !important;
  }
}

body {
  background-image: url('images/mainbg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
  font-family: "Trirong", serif;
}
.faculty-table {
            width: 300px;
            margin: 10px 0px;
            border: 2px solid #ccc;
            border-collapse: collapse;
            
        }

        .faculty-table th,
        .faculty-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .faculty-table th {
           background-color: black;
            color: white;
            text-align: center;
        }

        .faculty-table td {
            text-align: center;
            background-color: white;
        }

        /* Styling for the Total Faculty Count */
        .total-faculty {
            font-size: 60px;
            font-weight: bold;
            color: #007BFF; /* Blue color, you can change it to your preferred color */
            padding: 20px 0;
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
    
  <ul class="nav navbar-nav navbar-left">
  	<li><a href="adminindex.jsp"><i class='fa fa-home'></i> Home</a></li>
      <li><a href="adminreg.jsp"><i class='fa fa-user-plus'></i> Add Admin</a></li>
      <li><a href="facultyreg.jsp"><i class='fa fa-users'></i> Add Faculty</a></li>
      <li><a href="studentreg.jsp"><i class='fa fa-users'></i> Add Student</a></li>
      <li><a href="viewallfaculties.jsp"><i class='fa fa-eye'></i> View Faculty</a></li>
      <li><a href="viewallstudents.jsp"><i class='fa fa-eye'></i> View Students</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="adminreg.jsp">Profile</a></li>
          <li><a href="adlogout.jsp">Logout</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
  
<div class="container" style="margin-top:80px">
<br><br><br><br>
  
  <h3 style="color: black;">Welcome to Admin Page "<%=adm.getUsername()%>".</h3><br>
  
  <div class="col-md-4">
<table class="faculty-table">
    <tr>
        <th colspan="2">Student Count</th>
    </tr>
    <%
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfisystem", "root", "Akshay@2003");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as total_count FROM student_table");

        int totalCount = 0;
        if (rs.next()) {
            totalCount = rs.getInt("total_count");
        }

        // Don't forget to close the resources once you're done.
        rs.close();
        stmt.close();
        con.close();

        // Set the totalCount variable in the request scope to access it in JSP.
        request.setAttribute("totalCount", totalCount);
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    
      <tr> 
        <td class="total-faculty"><%=request.getAttribute("totalCount")%></td>
    </tr>
    </div>
    
    <div class="col-md-4">
   <table class="faculty-table">
    <tr>
        <th colspan="2">Faculty Count</th>
    </tr>
    
    
      <tr> 
        <td class="total-faculty">10</td>
    </tr>
  
</table>
</div>

</body>
</html>
    