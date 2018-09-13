<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="slideshow-container" >

  <!-- Full-width images with number and caption text -->
  <%@ page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements" %>
  <% try {
	// fetch the document over HTTP
      Document doc = Jsoup.connect("http://sportslens.com/").get();
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
</body>
</html>