<%-- 
    Document   : normal_create_company
    Created on : May 18, 2018, 7:27:15 PM
    Author     : Sachin Tomar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <form action="admin_create_company_db.jsp">
      <div id="outer" style="width:45%;border:1px solid black;margin-left:25%;margin-top: 12%">
      <div id="inner" style="border:1px solid black;margin:3px">
          <h2 style="text-align: center">Create Company</h2>
      </div>
          <div style="padding-left: 17%">
          <h3>Enter Details</h3>
          
         </br>
         <label>Company Name:</label>
         <input type="text" name="cname" style="margin-left: 12%" required>
         </br></br>
         </br>
         <label>Company Address:</label>
         <input type="text" name="cadd" style="margin-left: 10%" required>
         </br></br></br>
         <label>Created By:</label>
         <input type="text" name="creator" value="Admin" style="margin-left: 19.5%" readonly>
         </br></br></br>
        <button style="padding: 5px;width:15%;margin-left:10%">Save</button>
         <a href="admin_user.jsp"><button style="padding: 5px;width:15%;margin-left: 10%">Cancel</button></a>
         
         </br></br>
         </div>
      </div>
          </form>
    </body>
</html>
