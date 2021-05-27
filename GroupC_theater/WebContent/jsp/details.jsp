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

	/*
		各要素ごとの変数を準備
		このやり方はあまりよくないのでArrayListにまとめてください

	*/

	  String titleId  = "";
	  String titleName = "";
	  String poster   = "";
	  String Story    = "";
	  String image_1 = "";
	  String image_2 = "";
	  String image_3 ="";
	  String image_4 ="";
	  String image_5 ="";

	for(MovieDetailsBean md: movies){
	 titleId =	md.getTitleId();
	 titleName = md.getTitleName();
	 poster  =	md.getPoster();
	 Story   = md.getStory();
	 image_1 = md.getImage1();
	 image_2 = md.getImage2();
	 image_3 = md.getImage3();
	 image_4 = md.getImage4();
	 image_5 = md.getImage5();
	}


%>


<h1>映画詳細画面</h1>

<div align="center">
<div id="slick01">
<div><a href="#content01"><img src="<%=image_1 %>" width="500" height="400" alt="アイキャッチ画像01"></a></div>
<div><a href="#content02"><img src= "<%=image_2 %>"width="750" height="400" alt="アイキャッチ画像02"></a></div>
<div><a href="#content03"><img src= "../image/building_tantei_jimusyo.png" width="750" height="400" alt="アイキャッチ画像03"></a></div>
<div><a href="#content04"><img src="../image/tantei_boy.png" width="750" height="400" alt="アイキャッチ画像04"></a></div>
<div><a href="#content04"><img src= ""width="750" height="400" alt="アイキャッチ画像05"></a></div>
</div>
</div>

<script type="text/javascript">
$(function(){
$('#slick01').slick({
autoplay: true, //自動再生
dots: true, //ドットインジケータの表示
});
});


</script>
<p>名探偵コナソ<BR></BR>
</p>

<p><%=id %></p>
<p><%=Story %></p>
<p><%=image_1 %></p>
<p><%=image_2 %></p>
<img alt="" src="image_1">
<img alt="" src="<%=image_1%>">

<form action="./selectDate.jsp">
<input type ="hidden" name="title_id" value="タイトル" >
<input type="submit" value="日付、時間帯選択ページへ" >
</form>
</body>

</html>