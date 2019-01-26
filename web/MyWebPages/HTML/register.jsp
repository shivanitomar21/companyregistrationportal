<html>
   

<body>
    <style>
        * {box-sizing: border-box}

/* Full-width input fields */
  input[type=text], input[type=password], input[type=email], input[type=select]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, input[type=email]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
    width: 100%;
  }
}
</style>
<form action="register_db.jsp" style="border:1px solid #ccc">
  <div class="container" style="width:40%;margin-left: 30%;border:1px soild gray">
    <h1>Registeration Page</h1>
  
    <hr>
    <div style="border: 1px soild gray">
    <label><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
    
    <label><b>Email</b></label>
    <input type="email" placeholder="Enter Email" name="email" required>

    <label><b>Mobile</b></label>
    <input type="text" placeholder="Enter Contact number" name="contact"  maxlength="10" pattern="[0-9]{1}[0-9]{9}" required>
    
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label><b>Role</b></label>
    
    <select name="role">
        <option>---select---</option>
        <option>IT_ADMIN</option>
        <option>IT_USER_NORMAL</option>
    </select>
   


    <div class="clearfix">
      <a href="vfirst_assignment.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
    </div>
  </div>
</form>
    </body>
    </html>