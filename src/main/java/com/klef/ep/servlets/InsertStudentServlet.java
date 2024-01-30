package com.klef.ep.servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.klef.ep.models.Student;
import com.klef.ep.services.StudentService;

/**
 * Servlet implementation class Inser
 */
@WebServlet("/insertstudent")
@MultipartConfig
public class InsertStudentServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		try {
			String fname = request.getParameter("firstName");
			String lname = request.getParameter("lastName");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String dept = request.getParameter("department");
			String mail = request.getParameter("email");
			String addrs = request.getParameter("address");
			String contact = request.getParameter("contactno");
			String pcontact = request.getParameter("pcontactno");
			Part file = request.getPart("image");
			
			System.out.println(file);
			
			InitialContext context = new InitialContext();
			StudentService studentService = (StudentService) context.lookup("java:global/SFISYSTEM/StudentServiceImpl!com.klef.ep.services.StudentService");
			
			
	        InputStream inputStream = file.getInputStream();
	        Blob blob = new javax.sql.rowset.serial.SerialBlob(getBytesFromInputStream(inputStream));
	        
	        Student std = new Student();
	        std.setFname(fname);
	        std.setLname(lname);
	        std.setGender(gender);
	        std.setDob(dob);
	        std.setDepartmnt(dept);
	        std.setPassword(dob);
	        std.setEmail(mail);
	        std.setAddress(addrs);
	        std.setPcontactno(pcontact);
	        std.setScontactno(contact);
	        std.setImagedata(blob);
	        
	       studentService.AddStudent(std);
	       response.sendRedirect("adminindex.jsp");
			
		}catch(Exception e)
		{
			out.print(e);
		}
	}
	private byte[] getBytesFromInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }
}
