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

<link rel="stylesheet" type="text/css" href="../public/jstylesheet.css">
<!-- jQuery	の呼び出し -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

%>

<p>トップ画面のテストページです<br>ログインからのセッションの受け渡しを確認します</p>


	<a href="../myPage">マイページ</a>


	<a href="./Login.jsp">ログイン</a>


	<div class="login" id="login-show">ログイン</div>

	<div class="login-modal-wrapper" id ="login-modal" >

		<div class="modal">
      <div id="login-form">
        <h2>ログイン</h2>
        <form action="..myPage">
          <input class="form-control" type="text" placeholder="ユーザーID or メールアドレス">
          <input class="form-control" type="password" placeholder="パスワード">
          <div id="submit-btn">ログイン</div>
        </form>
      </div>
    </div>
	</div>


<script src="../js/JQuery.js"></script>
</body>
</html>