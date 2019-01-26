<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <form action="edit_company_db.jsp">
      <div id="outer" style="width:45%;border:1px solid black;margin-left:25%;margin-top: 12%">
      <div id="inner" style="border:1px solid black;margin:3px">
          <h2 style="text-align: center">Edit Company</h2>
      </div>
          <div style="padding-left: 17%">
          <h3>Enter Details</h3>
          
         </br>
<%
try
{   
    String s_no=request.getParameter("s_no");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vfirst","root","root");

    PreparedStatement stmt3=con.prepareStatement("select c_name,c_address from user_company where s_no=?");
    
    stmt3.setInt(1,Integer.parseInt(s_no));
    
    ResultSet rs3=stmt3.executeQuery();
    
    while(rs3.next())
    {
        String cname=rs3.getString(1);
        String cadd=rs3.getString(2);
         
        %>
        <label>Company Id:</label>
        <input type="text" name="s_no" value="<%=s_no%>" style="margin-left: 17%" readonly>
         </br></br>
         </br>      
         <label>Company Name:</label>
         <input type="text" name="cname" value="<%=cname%>" style="margin-left: 12%" required>
         </br></br>
         </br>
         <label>Company Address:</label>
         <input type="text" name="cadd" value="<%=cadd%>" style="margin-left: 9.5%" required>
         </br></br></br>
         
         <a href="edit_company_db.jsp"><button style="padding: 5px;width:15%;margin-left:10%">Edit</button></a>
         
         <a href="admin_view_company.jsp"><button style="padding: 5px;width:15%;margin-left: 17%">Cancel</button></a>
          <%
    }
      
stmt3.execute();

con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

         </br></br>
         </div>
      </div>
    </form>

    </body>    
</html>
