<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
        String uname=(String)session.getAttribute("uname");
    
        String cname=request.getParameter("cname");
        
        String cadd=request.getParameter("cadd");
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VFirst","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into user_company (s_no,c_name,c_address,username) values(?,?,?,?)");

    stmt1.setInt(1,0);
  
    stmt1.setString(2,cname);
 
    stmt1.setString(3,cadd);
    
    stmt1.setString(4,uname);
    
stmt1.execute();
con.close();

%>
        <jsp:forward page="admin_user.jsp"/>
<%
}
catch(Exception e)
{
    out.print(e);
}
%>