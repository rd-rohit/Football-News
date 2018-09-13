<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Matches</title>
</head>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Open+Sans:400,300,600,700,800"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="w3.css">
<link rel="stylesheet" href="matches.css">
<body>
	<jsp:include page="Logo.html" />
	<div id="header">
	<div id="menu" class="container">
		<ul>
			<li ><a href="index.jsp" accesskey="1" title="">News</a></li>
			<li class="current_page_item"><a href="#" accesskey="2" title="">Matches</a></li>
			<li style="float:right"><a href="login.html" accesskey="4" title="" >Login</a></li>
			<li style="float:right"><a href="signup.jsp" accesskey="5" title="" >Sign Up</a></li>
		</ul>
	</div>
</div>
	<%@ page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements" %>
	<center>
	<table cellspacing="30">
	<tr><th>Date</th><th>  Home Team  </th><th>  Away Team  </th>
	
	<%
	try {
	      // fetch the document over HTTP
	      Document doc = Jsoup.connect("http://www.goal.com/en-in/live-scores").get();
	      // get all links in page
	      Elements links = doc.select("div.match-main-data > a");
	      for (Element link : links) {
	          String url ="http://www.goal.com"+link.select("a").attr("href");
	    	  String status = link.select("div.match-status span.state").text();
	    	  String[] date=link.select("div.match-status time").attr("datetime").split("T");
	    	  String time  =link.select("div.match-status time").text();
	    	  String[] new_date  = date[0].split("-");
	    	  String n_date = new_date[2]+"-"+new_date[1]+"-"+new_date[0];
	    	  String homeTeam=link.select("div.match-teams div.match-data div.team-home span.team-name").text();
	    	  String goalsHomeTeam=link.select("div.match-teams div.match-data div.team-home span.goals").text();
	    	  String homeTeamCrest=link.select("div.match-teams div.match-data div.team-home span.crest img").attr("src");
	    	  String goalsAwayTeam=link.select("div.match-teams div.match-data div.team-away span.goals").text();
	    	  String awayTeam=link.select("div.match-teams div.match-data div.team-away span.team-name").text();
	    	  String awayTeamCrest=link.select("div.match-teams div.match-data div.team-away span.crest img").attr("src");
	%>
	<tr>
	<section class="w3-container w3-center">
	<div class="match-main-data">
		<a itemprop="url" class="match-main-data-link"
			href=<%=url %>>
			<div class="match-status">
				<span data-bind="state"></span>
				<time data-dateformat="autoShort"
					datetime="2018-07-20T02:00:00+00:00" data-utc="1532052000000"><b><td><%= n_date %></td></b></time>
			</div>
			<div class="match-teams ">
				<div class="match-data">
					<td><div class="team-home " itemprop="homeTeam" itemscope=""
						itemtype="https://schema.org/SportsTeam">
						 <span class="crest"> 
						 <img itemprop="logo" src=<%=homeTeamCrest %> alt=<%=homeTeam %>>
						</span> 
						<span itemprop="name" class="team-name"> <%=homeTeam %></span>
						<span class="goals" data-bind="scoreHome"><%=goalsHomeTeam %></span>
					</div></td>
					<td><div class="line">-</div>
					<div class="team-away " itemprop="awayTeam" itemscope=""
						itemtype="https://schema.org/SportsTeam">
						<span class="goals" data-bind="scoreAway"><%=goalsAwayTeam %></span> 
						<span itemprop="name" class="team-name"> <%=awayTeam %> </span>
						<span class="crest"> <img itemprop="logo" src=<%=awayTeamCrest %> alt=<%=awayTeam %>></span> 
					</div></td></tr>
				</div>
			</div>
		
		</table>
	</center>
	</a>
		<div class="action"></div>
	</div>
	</section><% 	  
     }
   } catch (IOException e) {
   e.printStackTrace();
   } %>
</body>
</html>