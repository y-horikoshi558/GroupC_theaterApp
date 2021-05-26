<%@page import="java.util.ArrayList"%>
<%@page import="common.Utility"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>
<%@page import="bean.MovieBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">

	$(function() {
		$('.slick01').slick({
			centerMode : true,
			centerPadding : '25%',
			autoplay : true,
			variableWidth : true,
			arrows : true,
			infinite : true,
			dots:true,
		});
	});
</script>

<style type="text/css">
body {
	background: #505050;
}

.slick-prev {
	left: 25px;
	z-index:100;
}

.slick-next {
	right: 25px;
	z-index:100;
}

.slick01 img {
	height: 20vw;
}

#movielist{
color:#ffffff;
text-align:center;
}

.slick-dots li button:before{
	color:#ffffff;
}

.slick-arrow:before{
	color:#000000;
	font-size:50px;
	opacity:1;
}

</style>

</head>
<body>


	<%
	request.getRequestDispatcher("Header.jsp").include(request, response);
	request.getRequestDispatcher("/Top").include(request, response);
	List<MovieBean> movies = (List<MovieBean>)session.getAttribute("sesMovies");
	 %>


<div id = "movielist" ><h1>上映中の映画</h1>

	<ul class="slick01">

       <% for(MovieBean movie:movies) {
 			out.println("<li><a href = '/Test2?movie_id = " + movie.getMovieId() + "><img alt = '画像' src = '" + movie.getPosterURL() + "'></a></li>");
 		}%>

 	<%--画像表示テスト<%
 	out.println("<li><a href = ''><img alt = 'テスト用' src ='https://www.thedrive.com/content-b/message-editor%2F1578937687603-tamir.jpg?quality=60'></a></li>'");
 	out.println("<li><a href = ''><img alt = '後で削除してください' src ='https://sites.breakingmedia.com/uploads/sites/3/2020/03/Iron-Dome-intercept-CGI-screenshot-1024x572.jpg'></a></li>'");
 	out.println("<li><a href = ''><img alt = '画像' src ='https://www.armyrecognition.com/images/stories/middle_east/israel/missile/iron_dome/Iron_Dome_defense_system_against_short_range_artillery_rocket_Israel_Isreli_Defense_Industry_640.jpg'></a></li>'");
	%>--%>

       </ul>
       </div>
</body>
</html>