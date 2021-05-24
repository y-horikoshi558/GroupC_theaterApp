<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../public/stylesheet.css">
</head>
<body>

<%

%>

<header>

</header>


	<div class="main">

		<div class ="title-sub-wrapper">
			<h2 class="title">新規登録</h2>
		</div>


		<div class="myPageContents">
			<div class="contents">



			<form action="../UserSubscribe" method="post">

				<p>ユーザー名</p>
				<input type="text" name="uName" >

				<p>フリガナ</p>
				<input type="text" name="uKanaName" >

				<p>メールアドレス</p>
				<input type="text" name="uEmail">

				<p>ユーザーID</p>
				<input type="text" name="uId">

				<p>パスワード</p>
				<input type="text" name="uPass">

				<p>パスワード再確認</p>
				<input type="text" name="uPassCheck">

				<input type="submit" value ="登録">


			</form>









			</div>

		</div>

	</div>





<footer>

</footer>

</body>
</html>