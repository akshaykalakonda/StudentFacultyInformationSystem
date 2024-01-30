<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="com.klef.ep.services.AdminService"%>
    <%@page import="com.klef.ep.models.Admin"%>
    <%@page import="javax.naming.InitialContext"%>
 <%  
InitialContext context = new InitialContext();
AdminService adminService = (AdminService) context.lookup("java:global/SFISYSTEM/AdminServiceImpl!com.klef.ep.services.AdminService");

String uname = request.getParameter("username");
String pwd = request.getParameter("pswrd");

Admin ad = adminService.adminLogin(uname, pwd);

if(ad!=null)
{   
	  //session is an implicit object
	   session.setAttribute("adses", ad);  // emp is a session variable and emp is an object of type Employee class.
	   response.sendRedirect("adminindex.jsp"); // will redirect to employee home
}
else
{
	String result = "Invalid Username or Password";
	session.setAttribute("registrationResult", result);
	response.sendRedirect("adminlogin.jsp"); // will redirect to login failed page
}
%>    