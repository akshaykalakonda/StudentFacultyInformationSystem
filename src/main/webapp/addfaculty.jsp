<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.klef.ep.services.FacultyService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.Faculty"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
InitialContext context=new  InitialContext();
FacultyService facultyService = (FacultyService) context.lookup("java:global/SFISYSTEM/FacultyServiceImpl!com.klef.ep.services.FacultyService");

String uname  = request.getParameter("name");
String ugender  = request.getParameter("gender");
String dob  = request.getParameter("dob");
String dept  = request.getParameter("department");
String sal  = request.getParameter("salary");
double usal = Double.parseDouble(sal);
String pwd = request.getParameter("dob");
String email  = request.getParameter("email");
String contact  = request.getParameter("contactno");
String result;

		Faculty fty = new Faculty();
		fty.setName(uname);
		fty.setGender(ugender);
		fty.setDob(dob);
		fty.setDepartment(dept);
		fty.setSalary(usal);
		fty.setPassword(pwd);
		fty.setEmail(email);
		fty.setContactno(contact);

		result = facultyService.addFaculty(fty);
		


session.setAttribute("registrationResult", result);

//Redirect back to the registration form page
response.sendRedirect("facultyreg.jsp");
	%>