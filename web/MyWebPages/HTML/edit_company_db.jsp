<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
        String s_no=request.getParameter("s_no");
    
        String cname=request.getParameter("cname");
        
        String cadd=request.getParameter("cadd");
          
        out.print(cname);
        out.print(cadd);
        out.print(s_no);
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VFirst","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update user_company set c_name=?, c_address=? where s_no=?");

    stmt1.setString(1,cname);
  
    stmt1.setString(2,cadd);
 
    stmt1.setInt(3,Integer.parseInt(s_no));
    
stmt1.execute();

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