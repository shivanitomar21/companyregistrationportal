<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
        String uname=request.getParameter("uname");
        
        String upass=request.getParameter("upass");
   
        session.setAttribute("uname",uname);
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VFirst","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select password,role from register where username=?");
   
    stmt1.setString(1,uname);

    ResultSet rs1=stmt1.executeQuery();
    
    int flag=0;
    while(rs1.next())
    {
        flag=1;
       if(upass.equals(rs1.getString(1)))
       {
           if(rs1.getString(2).equals("IT_ADMIN"))
           {
               %>
                <jsp:forward page="admin_user.jsp"/>
               <%
           }
           else if(rs1.getString(2).equals("IT_USER_NORMAL"))
           {
               %>
                <jsp:forward page="normal_user.jsp"/>
               <%
           }
       }
       else
       {
               %>
                <jsp:forward page="wrong_login.html"/>
               <%        
       }
    }
    if(flag==0)
    {
        %>
        <jsp:forward page="wrong_login.html"/>
        <%        
    }
    
    
stmt1.execute();
con.close();

}
catch(Exception e)
{
    out.print(e);
}
%>