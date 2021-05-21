<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<p>ログインのテストページです</p>
	<%--<form action="../myPage" method="get"> 変更前  --%>


	<form action="../testLoginPage" method="post">
		<p>ユーザーID</p>
		<input type="text" name="testId">
		<p>パスワード</p>
		<input type="text" name="testPass">
		<input type="submit" value="ログイン">
	</form>


</body>
</html>