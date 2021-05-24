<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery	の呼び出し -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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



<script src ="js/JQuery.js"></script>

</body>
</html>