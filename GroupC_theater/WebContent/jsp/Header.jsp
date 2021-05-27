<%@page import="java.util.ArrayList"%>
<%@page import="common.Utility"%>
<%@page import="java.util.Optional"%>
<%-- <%@page import="bean.TicketBeans"%> --%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<style type="text/css">
body{
	background:#505050;

}

#title{
	text-align:center;
}

#top{
	border:none;
	background-color:#505050;
	color:#ffffff;
	font-size:400%;
	margin-left:90px;
}

#side{
	float:right;
}

#side_column_1 {
	background-color:#505050;
	float:clear;
}

#side_column_2 {
	background-color:#505050;
	font-size:150%;
	float:clear;
}

#login{
	border:none;
	background-color:#505050;
	color:#ffffff;
}

#logout{
	border:none;
	background-color:#505050;
	color:#ffffff;
}

#mypage{
	border:none;
	background-color:#505050;
	color:#ffffff;
}

#menu{
	background-color:#505050;
	text-align:center;
}

#movielist {
	border:none;
	background-color:#aaaaaa;
	color:#ffffff;
	font-size:200%;
}
</style>

<%--
<%
TicketBeans ticketBean = (TicketBeans) session.getAttribute("TicketBeans");
if (Objects.isNull(ticketBean)) {
	ticketBean = new TicketBeans();
}
%>
--%>

</head>

<body>
	<div id = "side">
	<%
	//if(ticketBean.getLogin()){
	if (true) { //テスト用
	%>
	<div id="side_column_1">

		<form action="#" method="get">
			<input type="submit" value="ログアウト" id="logout">
		</form>
		<br>
		<form action="../myPage" method="get" >
			<input type="submit" value="マイページ" id="mypage" >
		</form>
			<div id="side_column_2">
		<form action="./Login.jsp" method="get" >
			<input type="submit" value="ログイン" id="login">
		</form>
	<!--
		*変更内容*
			・else文以下の部分を削除ました。
			・フォーム内の入力タグをボタン属性からsubmit要素に変えました。
			・ボタン要素で遷移できなかったので、編集する時によろ
			・マイページはユーザー情報がないと500になるのでセッションからユーザー情報が
			  取れない場合はマイページを表示しないとかの処理が必要になるかもです
	 -->

	<% }%>
	</div>
	</div>
	</div>

	<div id="title">
		<form action="" method="post">
			<input type="button" value="CINEMA" id="top">
		</form>
	</div>

	<br>
	<div id="menu">
		<form action="movieList.jsp" method="post">
			<input type="submit" value="映画一覧" id="movielist">
		</form>
	</div>
</body>
</html>