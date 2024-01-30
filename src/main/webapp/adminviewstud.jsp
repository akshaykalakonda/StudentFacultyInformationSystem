<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.klef.ep.models.Admin"%>
       <%@page import="com.klef.ep.services.StudentService"%>
<%@page import="com.klef.ep.models.Student"%>
<%@page import="javax.naming.InitialContext"%>
<%InitialContext context=new  InitialContext();
StudentService studentService = (StudentService) context.lookup("java:global/SFISYSTEM/StudentServiceImpl!com.klef.ep.services.StudentService");

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
        .profile {
      display: flex;
      flex-direction: column;
      background-color: #2196f3;
      padding: 20px;
      border-radius: 10px;
    }
	.container1 {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      display: grid;
      grid-template-columns: 1fr 3fr;
      grid-gap: 20px;
    }
    .profile-photo {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      border: 5px solid #fff;
      margin: 0 auto 20px;
      display: block;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .profile-info {
      font-size: 18px;
      margin-bottom: 20px;
      color: #fff;
    }

    .details {
      padding: 20px;
    }

    .detail-field {
      margin-bottom: 15px;
    }

    .detail-label {
      font-weight: bold;
      color: #444;
    }

    .detail-value {
      color: #555;
    }

    .sidebar {
      background-color: #64b5f6;
      padding: 20px;
      border-radius: 10px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
    }

    .sidebar li {
      margin-bottom: 10px;
    }

    .content {
      padding: 20px;
      background-color: #81d4fa;
      border-radius: 10px;
    }

    .content h2 {
      margin-top: 0;
    }

    footer {
      text-align: center;
      margin-top: 30px;
      padding: 10px;
      background-color: #1565c0;
      color: #fff;
    }
    
    .round-image {
            border-radius: 70%;
            overflow: hidden;
            
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



<% 



String fid = request.getParameter("sid");
int id = Integer.parseInt(fid);



Student fty = studentService.adminviewstud(id);


%>




  <br><br><br><br>
 <div class="container1">
    <div class="profile">
      <div class="round-image">
        <img src="viewallstudentsbyid.jsp?pid=<%=fty.getId()%>" alt="Profile Picture" width="95%" height="93%"  border-radius="50%"/>
      </div>
      <div class="profile-info">
        <p><strong>First Name:</strong> <%= fty.getFname() %></p>
  <p><strong>Last Name:</strong> <%= fty.getLname() %></p>
        <p><strong>ID Number:</strong> <%= fty.getId()%></p>
  <p><strong>Gender:</strong> <%= fty.getGender() %></p>
        <p><strong>Branch:</strong> <%= fty.getDepartmnt() %></p>
        
      </div>
    </div>
    <div class="details">
      <h2>Student Details</h2>
      <div class="detail-field">
        <span class="detail-label">Email:</span>
        <span class="detail-value"><%= fty.getEmail() %></span>
      </div>
     
      <div class="detail-field">
        <span class="detail-label">Student Contact:</span>
        <span class="detail-value"><%= fty.getScontactno() %></span>
      </div>
       <div class="detail-field">
        <span class="detail-label">Parent Contact:</span>
        <span class="detail-value"><%= fty.getPcontactno() %></span>
      </div>

       
      <div class="detail-field">
        <span class="detail-label">Address:</span>
        <span class="detail-value"><%= fty.getAddress() %></span>
      </div>
      <div class="detail-field">
        <span class="detail-label">Date of Birth:</span>
        <span class="detail-value"><%= fty.getDob() %></span>
      </div>
    </div>
    <div class="sidebar">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="#">My Courses</a></li>
        
        
      </ul>
    </div>
    <div class="content">
      <h2>Welcome, <%= fty.getLname() %></h2>
      <p></p>
    </div>
  </div>
  

</body>
</html>
    