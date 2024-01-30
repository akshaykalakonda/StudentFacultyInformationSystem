<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
   

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


<link rel="stylesheet" 
          href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
input[type=text], input[type=password]{
    width: 100%;
    margin: 10px 0;
    border-radius: 5px;
    padding: 15px 18px;
    box-sizing: border-box;
  }
  body 
{
  font-family:sans-serif; 
  background-image: url("images/adminlogin.jpg");
   background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;

}


h1{
    text-align: center;
}


form{
    width:45rem;
    left-margin: 0px;
    color:white;
    padding: 20px 10px;
}

input[type=text], input[type=password]{
    width: 100%;
    margin: 2px 0;
    border-radius: 2px;
    padding: 10px 18px;
    box-sizing: border-box;
    color: black;
  }
button {
    background-color: black;
    color: white;
    padding: 10px 18px;
    border-radius: 5px;
    margin: 7px 0;
    width: 100%;
    font-size: 18px;
  }

button:hover {
    opacity: 0.6;
    cursor: pointer;
}

.headingsContainer{
    text-align: center;
}

.headingsContainer p{
    color: black;
}
.mainContainer{
    padding: 16px;
}


.subcontainer{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}

.subcontainer a{
    font-size: 16px;
    margin-bottom: 12px;
}

span.forgotpsd a {
    float: right;
    padding-top: 16px;
  }

.forgotpsd a{
    color: rgb(74, 146, 235);
  }
  
.forgotpsd a:link{
    text-decoration: none;
  }


  /* Media queries for the responsiveness of the page */
  @media screen and (max-width: 600px) {
    form{
      width: 25rem;
    }
  }
  
  @media screen and (max-width: 400px) {
    form{
      width: 20rem;
    }
  }

</style>
  
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-brand mb-0 mb-md-1">
      
      <a href="index.jsp">
        <img alt="Logo" class="img-fluid py-1" src="images/logo.jpg" aria-role="logo" height="60" width="120">
      </a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="index.jsp"><span class="	glyphicon glyphicon-home"></span> Home</a></li>
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
                <div class="alert <%= registrationResult.startsWith("Invalid") ? "alert-danger" : "alert-success" %>">
                    <%= registrationResult %>
                </div>
            <% } %>
  <form action="checkadminlgn.jsp" method="post">
    <!-- Headings for the form -->
    <div class="headingsContainer">
        <h3><b>Admin Login</b></h3>
        <p>Sign in with your username and password</p>
    </div>

    <!-- Main container for all inputs -->
    <div class="mainContainer">
        <!-- Username -->
        <div class="input-icons">
        <i class="fa fa-user icon"></i>
        <label for="emailid">Username</label>
        <input type="text" placeholder="Enter Username" name="username" required>

        <br><br>

        <!-- Password -->
        <i class="fa fa-lock icon"></i>
        <label for="pswrd">password</label>
        <input type="password" placeholder="Enter Password" name="pswrd" required>
        </div>
        <!-- sub container for the checkbox and forgot password link -->
        <div class="subcontainer">
            <label>
              <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
            <p class="forgotpsd"> <a href="#">Forgot Password?</a></p>
        </div>


        <!-- Submit button -->
        <button type="submit">Login</button>
    </div>

</form>
</div>

</body>
</html>
