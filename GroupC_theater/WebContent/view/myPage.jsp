<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="bean.userBean"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
	<link rel="stylesheet" type="text/css" href="../public/stylesheet2.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- jQuery	の呼び出し -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


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
			<div class="page-title">
				<h1 id ="title-mypage">マイページ</h1>
			</div>

		</div>

		<div class="myPageContents">
		<div class="contents">


			<%	for(userBean uBean:userBeanList){ %>
				<div class="content">

					<p>ユーザーID:<span class="user-dynaDate"><%=uBean.getUserId()  %></span></p>
				</div>
				<div class="content">

					<p>メールアドレス:<span class="user-dynaDate"><%=uBean.getuEmail() %></span></p>

				</div>
				<div class="content">

				<p>パスワード:<span class="user-dynaDate"><%=uBean.getuPass()%></span></p>

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
						<form action="testTopPage.jsp">
							<input class="btn renderTop" type="submit" value="TOPへ">
						</form>
					</div>

					<div class="bottomRight">

						<form action="./userInfoReset.jsp" method ="get">
							<input class="btn renderSet" type="submit" value="変更" >
						</form>

						<form action="../UnSubPage" method="post">
							<input class="btn renderUnsub" type="submit" value="退会" >
						</form>
					</div>


			</div>

		</div>

		<div id="reset-show">変更</div>

		<!-- modalの処理 -->
	 <div class="reset-modal-wrapper" id="login-modal">

		    <div class="modal">

		    	<div class="close-modal">
      			  <i class="fa fa-2x fa-times"></i>
      			</div>

		      <div id="reset-form">
		        <h2>ユーザー情報の変更</h2>
		        <form action="./userInfoReset.jsp">
		         <p>メールアドレス</p>
		          <input class="form-control" type="text" placeholder="メールアドレス">
		          <p>パスワード</p>
		          <input class="form-control" type="password" placeholder="パスワード">
		          <input class="form-control" type="password" placeholder="パスワード">
		          <div id="submit-btn"><a>変更</a></div>
		        </form>
		      </div>
		    </div>


  </div>
	 <!--modalここまで -->



	</div>

	<footer>

	</footer>

<script src="../js/JQuery.js"></script>
</body>
</html>