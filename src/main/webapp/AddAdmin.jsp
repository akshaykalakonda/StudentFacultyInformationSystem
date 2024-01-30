<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.klef.ep.services.AdminService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
</head>
<body>

<%
InitialContext context=new  InitialContext();
AdminService adminService = (AdminService) context.lookup("java:global/SFISYSTEM/AdminServiceImpl!com.klef.ep.services.AdminService");

String uname  = request.getParameter("username");
String pwd = request.getParameter("pwd");
String repwd = request.getParameter("pwd-repeat");
String result;
if(pwd.equals(repwd)){
	String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
	if(pwd.matches(pattern)){
		Admin adm = new Admin();
		adm.setUsername(uname);
		adm.setPassword(pwd);

		result = adminService.addAdmin(adm);
		
	}
	else{
		result = "  Password must contain atleast one number [0-9],uppercase [A-Z],special character [!@#$%^&*]!!,length should be >=8...try again!!  ";
		
	}
}
else{
	result = "  Password & Repeat Password Does not match !! try again!!  ";	
}

session.setAttribute("registrationResult", result);

//Redirect back to the registration form page
response.sendRedirect("adminreg.jsp");
	%>
	
