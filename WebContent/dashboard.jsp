<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    PreparedStatement pst = conn.prepareStatement("select name from user_info where email=?");
    pst.setString(1,request.getParameter("email"));
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
    %>
<title><%=rs.getString("name") %></title>
</head>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Open+Sans:400,300,600,700,800" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="dropdown.css" rel="stylesheet" type="text/css" media="all" />
<body>
<jsp:include page="Logo.html" />
<div id="header">
	<div id="menu" class="container">
		<ul>
			<li><div class="dropdown">
  				<button onclick="myFunction()" class="dropbtn">Teams</button>
  				<div id="myDropdown" class="dropdown-content">
  				<%  
  					String name = rs.getString("name");
 					String sql ="select "+rs.getString("name")+" from selected_teams";
  				    ResultSet rst=stmt.executeQuery(sql);
  				    while(rst.next()){
  				    if(rst.getString(name)!=null){%>
    				<a href="team_news.jsp?team=<%=rst.getString(name)%>&user=<%=name%>"><font color="black"><%=rst.getString(name)%></font></a>
    				<%
    				}
  				    }
  				    %>
  				</div>
				</div>
				<script>
				/* When the user clicks on the button, 
				toggle between hiding and showing the dropdown content */
				function myFunction() {
				    document.getElementById("myDropdown").classList.toggle("show");
				}

				// Close the dropdown menu if the user clicks outside of it
				window.onclick = function(event) {
				  if (!event.target.matches('.dropbtn')) {

				    var dropdowns = document.getElementsByClassName("dropdown-content");
				    var i;
				    for (i = 0; i < dropdowns.length; i++) {
				      var openDropdown = dropdowns[i];
				      if (openDropdown.classList.contains('show')) {
				        openDropdown.classList.remove('show');
				      }
				    }
				  }
				}</script></li>
			<li style="float:right"><div class="logout">
  				<button onclick="logOutFunction()" class="logoutbtn"><%=rs.getString("name") %></button>
  				<div id="mylogout" class="logout-content">
    				<a href="index.jsp" accesskey="4" title="" ><font color="black">Log Out</font></a>
  				</div>
				</div>
				<script>
				function logOutFunction() {
				    document.getElementById("mylogout").classList.toggle("show");
				}

				// Close the dropdown menu if the user clicks outside of it
				window.onclick = function(event) {
				  if (!event.target.matches('.logoutbtn')) {

				    var dropdowns = document.getElementsByClassName("logout-content");
				    var i;
				    for (i = 0; i < dropdowns.length; i++) {
				      var openDropdown = dropdowns[i];
				      if (openDropdown.classList.contains('show')) {
				        openDropdown.classList.remove('show');
				      }
				    }
				  }
				}</script></li>
		</ul>
	</div>
</div>
<jsp:include page="carousel.jsp" />
<jsp:include page="boxes.jsp" />	
</div>
<div id="copyright">
	<p>Created by Rohit Shukla.</p>
</div>
</body>
<%}
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

</html>