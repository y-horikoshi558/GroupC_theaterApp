<%@page import="java.util.ArrayList"%>
<%@page import="common.Utility"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>
<%@page import="bean.MovieBean"%>
<%@page import="bean.MovieDetailsBean"%>
<%@page import="common.MovieDetailsDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

</head>
<body>




<%
	//topページのパラメータの値を受け取りました
	String id = request.getParameter("titleId");

	/*
		jspが起動したときにDetailsDAOから値をとってくる
	*/
	MovieDetailsDAO db = new MovieDetailsDAO();
	List<MovieDetailsBean> movies= db.getMDBean(id);

 	String titleId  	= movies.get(0).getTitleId();
 	String titleName 	= movies.get(0).getTitleName();
	String poster   	= movies.get(0).getPoster();
 	String Story    	= movies.get(0).getStory();
 	String[] image		= new String[5];
	for (int i = 0; i < image.length; i++)
		image[i] = "";




	if (movies.get(0).getImage1() != null)
	{
		image[0] = "\"" + movies.get(0).getImage1().substring(2, movies.get(0).getImage1().length()) + "\"";
	}
	if (movies.get(0).getImage2() != null)
	{
		image[1] = "\"" + movies.get(0).getImage2().substring(2, movies.get(0).getImage2().length()) + "\"";
	}
	if (movies.get(0).getImage3() != null)
	{
		image[2] = "\"" + movies.get(0).getImage3().substring(2, movies.get(0).getImage3().length()) + "\"";
	}
	if (movies.get(0).getImage4() != null)
	{
		image[3] = "\"" + movies.get(0).getImage4().substring(2, movies.get(0).getImage4().length()) + "\"";
	}
	if (movies.get(0).getImage5() != null)
	{
		image[4] = "\"" + movies.get(0).getImage5().substring(2, movies.get(0).getImage5().length()) + "\"";
	}



%>

<div align="center">


<% for (int i = 0; i < image.length; i++) { %>
<%	if (image[i].equals("")) continue; %>
	<div><a href="#content0<%= i+1 %>"><img src= <%= image[i] %> width="500" height="400" alt="アイキャッチ画像0<%= i+1 %>"></a></div>
<% } %>



<script type="text/javascript">
$(function(){
$('#slick01').slick({
autoplay: true, //自動再生
dots: true, //ドットインジケータの表示
});
});


</script>

<form action="./SelectDate">
<input type ="hidden" name="id" value=<%= titleId %> >
<input type ="hidden" name="name" value=<%= titleName %>>
<input type="submit" value="チケット予約はこちらから" >
</form>

</div>


</body>

</html>