<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="../public/jstylesheet.css">
<!-- jQuery	の呼び出し -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../js/JQuery.js"></script>
<title>Insert title here</title>
</head>
<body>



	<div id = title >
		<p id = title_login>ログインのテストページです</p>
	</div>
	<%--<form action="../myPage" method="get"> 変更前  --%>


	<form action="../myPage" method="get">
		<p>ユーザーID</p>
		<input type="text" name="testId">
		<p> パスワード</p>
		<input type="text" name="testPass">
		<input type="submit" value="ログイン">
	</form>





</body>
</html>