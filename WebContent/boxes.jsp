<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="featured" class="container">
		<div class="box">
			<div class="title">
				<h2>Recent Updates</h2>
			</div>
		</div>
<%@ page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements" %>
  <% try {
Document doc = Jsoup.connect("http://sportslens.com/").get();
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
Document doc = Jsoup.connect("http://sportslens.com/").get();
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
</body>
</html>