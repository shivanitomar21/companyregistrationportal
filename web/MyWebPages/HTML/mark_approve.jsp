<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try
{   
    String s_no=request.getParameter("s_no");
         
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vfirst","root","root");

    PreparedStatement stmt3=con.prepareStatement("update user_company set status=? where s_no=?");
    
    stmt3.setString(1,"approved");
    
    stmt3.setInt(2,Integer.parseInt(s_no));
      
stmt3.execute();

con.close();
%>
    <jsp:forward page="admin_view_company.jsp"/>
<%
}
catch(Exception e)
{
    out.print(e);
}
%>  