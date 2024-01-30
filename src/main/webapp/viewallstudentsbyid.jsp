<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<% 

Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

String pid = request.getParameter("pid");
int id = Integer.parseInt(pid);


try 
{

    Class.forName("com.mysql.cj.jdbc.Driver");
    con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/sfisystem", "root", "Akshay@2003");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select imagedata from student_table where id = "+id+"  ");
    if (rs.next()) 
    { 
      image = rs.getBlob(1);
      imgData = image.getBytes(1,(int)image.length());
    } 

// display the image

response.setContentType("image/jpg");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} 
catch (Exception e) 
{

out.println("Image Display Error=" + e.getMessage());

return;

} 

%>