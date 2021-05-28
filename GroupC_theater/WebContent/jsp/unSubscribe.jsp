<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	request.getRequestDispatcher("Header.jsp").include(request, response);
	request.getRequestDispatcher("/Top").include(request, response);



%>


	<div class ="main">


		<div class="myPageWrapper">
			<div class="page-title">
				<h1 id ="title-mypage">退会画面
				<span class="title-textdeco">></span>
				</h1>
			</div>
		</div>

		<div class="container">

			<div class="userinfo-contents">

			<form action="../UnSub" method="post">

				<div class="reset-email">
					<p>ユーザーID</p>
					<input class="inputDeco1" type="text" name = checkId placeholder="ユーザーID">
				</div>
				<div class="reset-pass">
					<p>パスワード</p>
					<input class="inputDeco1" type="password" name = checkPass placeholder="パスワード">
				</div>


				<div  class="form-check">
					<input type = submit value ="退会">
				</div>


			</form>


		</div>


		</div>


		</div>


<script src="../js/JQuery.js"></script>
</body>
</html>