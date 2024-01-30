<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.klef.ep.models.Admin"%>

   <%@page import="com.klef.ep.services.FacultyService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.Faculty"%><%@page import="java.util.*"%>
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

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="style.css" />
   <style>
       @import url('https://fonts.googleapis.com/css2?family=Roboto:ital@1&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

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

body {
    width: 100%;
    position:fixed;
    margin-left:10%;
    margin-top:-20%;
    font-family: 'Roboto', sans-serif;
    background-color: black;;
}

table {
    width: 100%;
    border-collapse: collapse;
}

.header_fixed {
    max-height: 100vh;
    width: 80%;
    overflow: auto;
    border: 1px solid #dddddd;
    margin-top : 5%;
}

.header_fixed thead th {
    position: sticky;
    top: 0;
    background-color: black;
    color: #e6e7e8;
    font-size: 15px;
}

th
{
    border-bottom: 5px solid #dddddd;
    padding: 10px 50px;
    font-size: 14px;
    
}
td {
    border-bottom: 5px solid #dddddd;
    padding: 10px 60px;
    font-size: 14px;
    
}

td img {
    height: 60px;
    width: 60px;
    border-radius: 100%;
    border: 5px solid #e6e7e8;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

tr:nth-child(odd) {
    background-color: #edeef1;
}

tr:hover td {
    color: #44b478;
    cursor: pointer;
    background-color: #ffffff;
}

td button {
    border: none;
    padding: 7px 20px;
    border-radius: 20px;
    background-color: black;
    color: #e6e7e8;
  cursor: pointer;
}

::-webkit-scrollbar {
    width: 6px;
}

::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
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

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

    <div class="header_fixed">
        <table>
            <thead>
                <tr>
                    <th>S No.</th>
                    
                    <th>Username</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
            </thead>
    <%             
InitialContext context1 = new InitialContext();
FacultyService facultyService1 = (FacultyService) context1.lookup("java:global/SFISYSTEM/FacultyServiceImpl!com.klef.ep.services.FacultyService");

List<Faculty> ftylist = facultyService1.viewAllFaculties();

for(Faculty fty : ftylist)
{
	  %>
            <tbody>
      
                <tr>
                    <td><%=fty.getId()%></td>
                    
                    <td><%=fty.getName()%></td>
                    <td><%=fty.getEmail()%></td>
                    <td><%=fty.getDepartment()%></td>
                    <td><a href="adminviewfac.jsp?fid=<%=fty.getId()%>"><button>View</button></a></td>
                </tr>
                
            </tbody>
            	  <%
}

%>
        </table>
    </div>
</body>

</html>