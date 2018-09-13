<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sign Up</title>
<link rel="stylesheet" href="sign_up.css">
<body>
<form method="post" action="inserdata" style="border:1px solid #ccc">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	
	<label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
	
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    
    <label for="teams"><b>Select Teams</b></label>
    
     <%@ page import="java.sql.*" %>
     <%
     String Driver = "com.mysql.jdbc.Driver";
     String url = "jdbc:mysql://localhost/footballnews";
     String uName ="root";
     String pwd = "";
     Connection conn=null;

     try {
         Class.forName(Driver).newInstance();
         conn = DriverManager.getConnection(url, uName, pwd);
         Statement stmt = conn.createStatement();
         for(int i=0;i<=50;i++){
         String sql = "select * from team where id="+i;
         ResultSet rs=stmt.executeQuery(sql);
         while(rs.next())
         {
      %>
     <input type="checkbox" name="teams" value="<%=rs.getString("team")%>"><%=rs.getString("team")%><br/>
   <%
    }
    }
    } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }
     catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }
     catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }
     finally{
         try {
             conn.close();
         } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
} 
    %>

    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
</body>
</html>