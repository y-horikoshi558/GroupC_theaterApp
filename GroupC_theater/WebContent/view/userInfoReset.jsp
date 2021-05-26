<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="bean.userBean"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>マイページ</title>
	<link rel="stylesheet" type="text/css" href="../public/stylesheet2.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- jQuery	の呼び出し -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

function next(){
	document.frm.action = "../UserInfoReset";
	document.frm.submit();
}
</script>
</head>
<body>

	<%

	List<userBean> userBeanList = (List<userBean>)session.getAttribute("sesUserBeanList");

	//sesUserBeanListがNULLの場合は初期化
		if (Objects.isNull(userBeanList)) {
			userBeanList = new ArrayList<>();
		}

		String user_id ="";
		String user_name = "";

		String user_email ="";
		String user_pass ="";

		for(userBean uBean:userBeanList){

			user_id =uBean.getUserId();
			user_name = uBean.getUserName();
			user_email = uBean.getuEmail();
			user_pass = uBean.getuPass();
		}

	%>

	<header>
		<h2 class="PageWrapper">headerWrapper</h2>
	</header>

	<div class="main">

		<div class="myPageWrapper">
			<div class="page-title">
				<h1 id ="title-mypage">ユーザー情報の編集
				<span class="title-textdeco">></span>
				</h1>
			</div>
		</div>

		<div class="contents">

			<div class="content">

				<div class="info-id">
					<p class="infolabel">ユーザーID:</p>
					<p class="param-id"><%=user_id %></p>
				</div>
			</div>

			<div class="content">

				<div class="info-name">
					<p class="infolabel">ユーザー名:</p>
					<p class="param-name"><%=user_name %></p>
				</div>
			</div>


			</div>



		<div class="container">
			<div class="userinfo-contents">



				<div class="reset-email">
					<p>メールアドレス</p>

				</div>
				<div class="reset-pass">
					<p>パスワード</p>

				</div>

			<form action="myPage.jsp" method="post" id ="sback" name="frm">

			<div class="bottom-container">
				<div class="buttom-contents">

					<div  class="form-check">

						<input type="text" name="setPass" form="inputreset" value="<%=user_pass%>">

						<input type="text" name="setEmail"  value="<%=user_email%>">

						<input type="button" value="確認" onClick="next()">

					</div>

					<div  class="form-back">

						<input type="submit" value="戻る" form="sback">

					</div>

				</div>

			</div>

			</form>
			</div>


		</div>

	</div>



<script src="../js/JQuery.js"></script>
</body>
</html>