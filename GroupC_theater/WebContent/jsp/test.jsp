<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.DBClass"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<img src="../image/tantei_boy.png" alt="迷探偵の画像" title="迷探偵">
	<%
		DBClass db = new DBClass();

		if (db.dbOpen())
			out.println("<p>接続完了</p>");
		else
			out.println("<p>失敗</p>");

		db.dbClose();

	%>

</body>
</html>