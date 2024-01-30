<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="com.klef.ep.services.FacultyService"%>
    <%@page import="com.klef.ep.models.Faculty"%>
    <%@page import="javax.naming.InitialContext"%>
 <%  
InitialContext context = new InitialContext();
FacultyService facultyService = (FacultyService) context.lookup("java:global/SFISYSTEM/FacultyServiceImpl!com.klef.ep.services.FacultyService");

String uname = request.getParameter("username");
int id = Integer.parseInt(uname);
String pwd = request.getParameter("pswrd");

Faculty fty = facultyService.facultyLogin(id, pwd);

if(fty!=null)
{   
	  //session is an implicit object
	   session.setAttribute("ftses", fty);  // emp is a session variable and emp is an object of type Employee class.
	   response.sendRedirect("facultyindex.jsp"); // will redirect to employee home
}
else
{
	String result = "Invalid Username or Password";
	session.setAttribute("registrationResult", result);
	response.sendRedirect("facultylogin.jsp"); // will redirect to login failed page
}
%>    