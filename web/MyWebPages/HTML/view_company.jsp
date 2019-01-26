<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('../css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>

<h2>Companies Created</h2>

<a href="normal_user.jsp"><button style="float:right">Go Back to Normal User Page</button></a>
</br></br>
<table id="myTable">
    
  <tr class="header">
      
    <th style="width:12%;border-right: 1px solid gray;text-align: center">S.No.</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Company Name</th>    
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Company Address</th>  
    <th style="width:12%;border-right: 1px solid gray;text-align: center">status</th>     
    
  </tr>
  
<%
    String uname=(String)session.getAttribute("uname");
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vfirst","root","root");

    PreparedStatement stmt3=con.prepareStatement("select s_no,c_name,c_address,status from user_company where username=?");
    
    stmt3.setString(1,uname);
    
    ResultSet rs3=stmt3.executeQuery();
    
    while(rs3.next())
    {
        String s_no=rs3.getString(1);
        String c_name=rs3.getString(2);
        String c_add=rs3.getString(3);
        String status=rs3.getString(4);

       
    %>
    <tr>
        
    <td style="border-right: 1px solid gray"><%=s_no%></td>
    <td style="border-right: 1px solid gray"><%=c_name%></td>
    <td style="border-right: 1px solid gray"><%=c_add%></td>
    <td style="border-right: 1px solid gray"><%=status%></td>
    
    </tr>
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

</table>



</body>


</html>
