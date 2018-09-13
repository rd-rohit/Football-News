<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=request.getParameter("team") %></title>
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
  				<button onclick="myFunction()" class="dropbtn"><%=request.getParameter("team") %></button>
  				<div id="myDropdown" class="dropdown-content">
  				<%@ page import="java.sql.*" %>
<%
String Driver = "com.mysql.jdbc.Driver";
String database_url = "jdbc:mysql://localhost/footballnews";
String uName ="root";
String pwd = "";
Connection conn=null;
String name =request.getParameter("user");

try {
    Class.forName(Driver).newInstance();
    conn = DriverManager.getConnection(database_url, uName, pwd);
    Statement stmt = conn.createStatement();  
 	String sql ="select "+name+" from selected_teams";
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
  				<button onclick="logOutFunction()" class="logoutbtn"><%=name %></button>
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
</div>
<!-- Carousel -->
<div class="slideshow-container" >

  <!-- Full-width images with number and caption text -->
  <%@ page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements" %>
  <% try {
	// fetch the document over HTTP
      Document doc = Jsoup.connect("http://sportslens.com/?s=+"+request.getParameter("team").toLowerCase().replaceAll(" ","-")+"/").get();
      // get all links in page
      Elements links = doc.select("article.latestPost");
      int i=0;
      while (i<=4) {
          Element link =links.get(i);
    	  String url = link.select("article.latestPost header h2 a").attr("href");
    	  String img_src=link.select("article.latestPost a div.featured-thumbnail img").attr("src");
    	  String title=link.select("article.latestPost header h2").text();
    	%>  
  
  <div class="mySlides fade">
    <div class="numbertext"> <%=i+1 %>/ 5</div>
    <a href =<%=url %> >
    <img src=<%=img_src %> width="1000" height="600">
    <div class="text"><b><%=title %></b></div>
    </a>
  </div>
<% i++;
        }
    } catch (IOException e) {
    e.printStackTrace();
    } %>
     <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides fade");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 5000);
}
</script>
<!-- Carousel Closed -->
<!-- Boxes-->
<div id="featured" class="container">
		<div class="box">
			<div class="title">
				<h2>Recent Updates</h2>
			</div>
		</div>
<%@ page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements" %>
  <% try {
Document doc = Jsoup.connect("http://sportslens.com/tags/teams/"+request.getParameter("team").toLowerCase().replaceAll(" ","-")+"/").get();
      // get all links in page
      Elements links = doc.select("article.latestPost");
      int i=5;
      while (i<=8) {
          Element link =links.get(i);
    	  String url = link.select("article.latestPost header h2 a").attr("href");
    	  String img_src=link.select("article.latestPost a div.featured-thumbnail img").attr("src");
    	  String title=link.select("article.latestPost header h2").text();
    	%>  
  
		<div id="box<%=i-4%>"> 
		<a href=<%=url %>> 
		<img src=<%=img_src %> width="280" height="220" alt="" /></a>
			<h2 class="subtitle"><%=title %></h2>
		</div>
	
	<% i++;
        }
    } catch (IOException e) {
    e.printStackTrace();
    } %>
    </div>
    <div id="featured" class="container">
  <% try {
Document doc = Jsoup.connect("http://sportslens.com/tags/teams/"+request.getParameter("team").toLowerCase().replaceAll(" ","-")+"/").get();
      // get all links in page
      Elements links = doc.select("article.latestPost");
      int i=9;
      while (i<=11) {
          Element link =links.get(i);
    	  String url = link.select("article.latestPost header h2 a").attr("href");
    	  String img_src=link.select("article.latestPost a div.featured-thumbnail img").attr("src");
    	  String title=link.select("article.latestPost header h2").text();
    	%>  
  
		<div id="box<%=i-8%>"> 
		<a href=<%=url %>> 
		<img src=<%=img_src %> width="280" height="220" alt="" /></a>
			<h2 class="subtitle"><%=title %></h2>
		</div>
	
	<% i++;
        }
    } catch (IOException e) {
    e.printStackTrace();
    } %>
    </div>
<!-- Boxes Closed--> 
<div id="copyright">
	<p>Created by Rohit Shukla.</p>
</div>

</body>
<%
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