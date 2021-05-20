<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="common.userBean"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
	<link rel="stylesheet" type="text/css" href="../public/stylesheet.css">
</head>
<body>

<%
	//サーブレット
	//String userId =  (String)session.getAttribute("atrText");
	//セッションに格納された値を受け取る。※fowardは次ページに値を入れたrequestを送るので requestでOk


	//SQLの結果を受け取り表示する。
	List<userBean> userBeanList = (List<userBean>)session.getAttribute("sesUserBeanList");

	//sesUserBeanListがNULLの場合は初期化
	if (Objects.isNull(userBeanList)) {
		userBeanList = new ArrayList<>();
	}

%>

	<header>
		<h2 class="PageWrapper">headerWrapper</h2>
	</header>
	<div class="main">
		<div class="myPageWrapper">
			<h1>マイページ</h1>
		</div>

		<div class="myPageContents">
		<div class="contents">


			<%	for(userBean uBean:userBeanList){ %>
				<div class="content">

					<p>ユーザーID:<%=uBean.getUserId()  %></p>

				</div>
				<div class="content">

					<p>メールアドレス:<%=uBean.getuEmail() %></p>

				</div>
				<div class="content">

				<p>パスワード:<%=uBean.getuPass() %></p>

				</div>
			</div>


			<div class="milageContents">

				<div class="milageDateBox">

					<div class="runk">

					<p>Rank:<%=uBean.getRank() %></p>

				</div>

				<div class="milagePoint">

					<p>マイレージポイント:<%=uBean.getMileage()%></p>

				</div>

			</div>
		</div>


			<% }%>


			<div class="bottomContents">

					<div class="bottomLeft">
						<input class="btn renderTop" type="submit" value="TOPへ">
					</div>

					<div class="bottomRight">
						<input class="btn renderSet" type="submit" value="変更">
						<input class="btn renderUnsub" type="submit" value="退会">
					</div>


			</div>

		</div>
	</div>
	<footer>

	</footer>

</body>
</html>