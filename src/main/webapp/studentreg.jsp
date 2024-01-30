<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.klef.ep.models.Admin"%>
    
     <%  Admin adm = (Admin)session.getAttribute("adses");
    if(adm == null)
    {
    	response.sendRedirect("adminlogin.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide|Sofia|Trirong">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	

<!-- Add jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Add jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
  font-family: Arial, Helvetica, sans-serif;
  background-image: url("images/mainbg.jpg");
   background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.container {
  display: flex;
  flex-direction: column;
  width: 25vw;
}

h1, p {
  text-align: center;
}

/* more styles added to beautify the input fields */
input {
  margin: 0.25em 0em 1em 0em;
  outline: none;
  padding: 0.5em;
  border: none;
  background-color: white;
  border-radius: 0.25em;
  color: black;
}
/* styles for button */
button {
  padding: 0.75em;
  border: none;
  outline: none;
  background-color: rgb(68, 18, 232);
  color: white;
  border-radius: 0.25em;
}

/* hover functionality for button */
button:hover {
  cursor: pointer;
  background-color: rgb(41, 4, 164);
}

</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-brand mb-0 mb-md-1">
      
      <a href="Navbar.html">
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
  
<div class="container" style="margin-top:100px">
  <br><br>
  <%
// Retrieve the registration result from the session attribute
String registrationResult = (String) session.getAttribute("registrationResult");
// Clear the session attribute to avoid displaying the same result again on subsequent visits
session.removeAttribute("registrationResult");
%>

<%-- Display the registration result message if available --%>
 <%-- Display the registration result message if available --%>
            <% if (registrationResult != null && !registrationResult.isEmpty()) { %>
                <div class="alert <%= registrationResult.startsWith("Record") ? "alert-success" : "alert-danger" %>">
                    <%= registrationResult %>
                </div>
            <% } %>
  		<form method="post" action="insertstudent" enctype="multipart/form-data">
    	<!-- class named "container" is assigned to div -->
    	<div class="container">
      	<h1>Student Registration</h1>
      <p>Kindly fill in this form to register.</p>
     <label for="firstName"> <i class="fa fa-user icon"></i> <b>First Name</b></label>
<input
  type="text"
  placeholder="Enter your first name"
  name="firstName"
  id="firstName"
  required
/>

<label for="lastName"> <i class="fa fa-user icon"></i> <b>Last Name</b></label>
<input
  type="text"
  placeholder="Enter your last name"
  name="lastName"
  id="lastName"
  required
/>

      <br>
      <div style="display: inline-block;">
  		<label><b>Gender:</b></label>
  		<input type="radio" name="gender" value="male" required>
  		<label for="male">Male</label>
  		<input type="radio" name="gender" value="female" required>
  		<label for="female">Female</label>
  		<input type="radio" name="gender" value="others" required>
  		<label for="female">Others</label>
	</div>
     <br> 
  
<label for="dob"><i class="fa fa-calendar icon"></i><b> Date of Birth</b></label>
<input
  type="text"
  placeholder="Date of Birth"
  name="dob"
  id="dob"
  required
/>
<!-- Department -->
<label for="department"><i class="fa fa-building icon"></i><b> Department</b></label>
<input
  type="text"
  placeholder="Department"
  name="department"
  id="department"
  required
/>


<!-- Email -->
<!-- Email -->
<label for="email"><i class="fa fa-envelope icon"></i><b> Email</b></label>
<input
  type="email"
  placeholder="abc@gmail.com"
  name="email"
  id="email"
  pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
  required
/>

<label for="address"> <i class="fa fa-map-marker icon"></i> <b>Address</b></label>
<input
  type="text"
  placeholder="Enter your address"
  name="address"
  id="address"
  required
/>


<!-- Contact Number -->
<label for="contactno"><i class="fa fa-phone icon"></i><b> Contact Number</b></label>
<input
  type="tel"
  placeholder="Contact Number"
  name="contactno"
  id="contactno"
  minlength="10" 
  maxlength="10"
  required
/>

<label for="fileUpload"> <i class="fa fa-file icon"></i> <b>Photo</b></label>
<input
  type="file"
  placeholder="Choose Image"
  name = "image"
  required
/>


<label for="contactno"><i class="fa fa-phone icon"></i><b> Parent Contact Number</b></label>
<input
  type="tel"
  placeholder="Parent Contact Number"
  name="pcontactno"
  id="contactno"
  minlength="10" 
  maxlength="10"
  required
/>
      <button type="submit">Register</button>
    </div>

  </form>
</div>


</body>
</html>

<script>
  $(function() {
    // Initialize the datepicker on the "dob" input field
    $("#dob").datepicker({
      dateFormat: "yy-mm-dd", // Format the date as "yyyy-mm-dd"
      changeMonth: true, // Allow users to select the month from a dropdown
      changeYear: true, // Allow users to select the year from a dropdown
      yearRange: "-100:+0", // Allow selecting dates from 100 years ago up to today
      maxDate: 0, // Prevent selecting future dates
    });
  });
</script>
