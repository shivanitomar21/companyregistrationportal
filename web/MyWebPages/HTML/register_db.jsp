<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
        String name=request.getParameter("name");
        
        String email=request.getParameter("email");
    
        String contact=request.getParameter("contact");
      
        String psw=request.getParameter("psw");
        
        String username=request.getParameter("username");
      
        String role=request.getParameter("role");
          
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VFirst","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into register (name,email,contact,password,username,role) values(?,?,?,?,?,?)");
    
    stmt1.setString(1,name);
    stmt1.setString(2,email);
 
    stmt1.setString(3,contact);
    stmt1.setString(4,psw);
    
    stmt1.setString(5, username);
    stmt1.setString(6,role);
    
    
stmt1.execute();
con.close();

%>
        <jsp:forward page="vfirst_assignment.jsp"/>
<%
}
catch(Exception e)
{
    out.print(e);
}
%>