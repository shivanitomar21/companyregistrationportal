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

<h2>Company Details</h2>
<a href="admin_user.jsp"><button style="float:right">Go Back to Admin_Page</button></a>
</br>
</br>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Company name/ Company Location/ Created By..." title="Type in a name">

<table id="myTable">
    
  <tr class="header">
      
    <th style="width:12%;border-right: 1px solid gray;text-align: center">S.No.</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Company Name</th>    
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Company Address</th>  
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Created By</th>     
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Actions</th>  
    
  </tr>
  
<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vfirst","root","root");

    PreparedStatement stmt3=con.prepareStatement("select s_no,c_name,c_address,username,status from user_company");
    
    ResultSet rs3=stmt3.executeQuery();
    
    while(rs3.next())
    {
        int s_no=rs3.getInt(1);
        String c_name=rs3.getString(2);
        String c_add=rs3.getString(3);
        String uname=rs3.getString(4);
        String status=rs3.getString(5);
    %>
    <tr>
        
    <td style="border-right: 1px solid gray"><%=s_no%></td>
    <td style="border-right: 1px solid gray"><%=c_name%></td>
    <td style="border-right: 1px solid gray"><%=c_add%></td>
    <td style="border-right: 1px solid gray"><%=uname%></td>
    
    <%
    if(uname.equals("shivanitomar"))
    {
        %>
        <td style="border-right: 1px solid gray"><button id="<%=s_no%>" style="margin-left: 4%" onclick="edit(this.id)">Edit</button><button id="<%=s_no%>" style="margin-left: 4%" onclick="delete_company(this.id)">Delete</button></a></td>
        </tr>
        <%         
    }
    else
    {
        if(status.equals("approved"))
        {
        %>
        <td style="border-right: 1px solid gray"><button id="<%=s_no%>" style="margin-left: 4%" onclick="edit(this.id)">Edit</button><button id="<%=s_no%>" style="margin-left: 4%" onclick="delete_company(this.id)">Delete</button><label style="margin-left: 4%">Approved</label></td>
        </tr>
        <%
        }
        else if(status.equals("unapproved"))
        {
         %>
        <td style="border-right: 1px solid gray"><button id="<%=s_no%>" style="margin-left: 4%" onclick="edit(this.id)">Edit</button><button id="<%=s_no%>" style="margin-left: 4%" onclick="delete_company(this.id)">Delete</button><button id="<%=s_no%>" style="margin-left: 4%" onclick="approve(this.id)">Approve</button></td>
        </tr>
            
        <%          
        }
    }
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

<script>
             function edit(click_id)
             {
                 var id=click_id;
                 
                 window.location.replace("edit_company.jsp?s_no="+id);
             }
             function approve(click_id)
             {
                 var id=click_id;
                 
                 window.location.replace("mark_approve.jsp?s_no="+id);
             }
             function delete_company(click_id)
             {
                 var id=click_id;
                 
                 window.location.replace("delete_company.jsp?s_no="+id);
             }
function myFunction()
{    
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
          
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
        
            td1 = tr[i].getElementsByTagName("td")[2];
            if (td1) {
            if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
            }   else {
                    tr[i].style.display = "none";
        
                    td2 = tr[i].getElementsByTagName("td")[3];
                    if (td2) {
                    if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    } else {
                    tr[i].style.display = "none";
                    }
                   }
            }
        }
      }
    }             
  }
}
</script>

</body>


</html>
