<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.klef.ep.services.StudentService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.Student"%>
<%

InitialContext context = new InitialContext();
StudentService studentService = (StudentService) context.lookup("java:global/SFISYSTEM/StudentServiceImpl!com.klef.ep.services.StudentService");



String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String dept = request.getParameter("department");
String email = request.getParameter("email");
String address = request.getParameter("address");
String password = request.getParameter("dob");
String contact = request.getParameter("contactno");
String pcontact = request.getParameter("pcontactno");

Student std = new Student();

std.setFname(fname);
std.setLname(lname);
std.setGender(gender);
std.setDob(dob);
std.setAddress(address);
std.setDepartmnt(dept);
std.setEmail(email);
std.setPassword(dob);
std.setScontactno(contact);
std.setPcontactno(pcontact);
studentService.AddStudent(std);




 String result = studentService.AddStudent(std);



session.setAttribute("registrationResult", result);

//Redirect back to the registration form page
response.sendRedirect("studentreg.jsp");


%>