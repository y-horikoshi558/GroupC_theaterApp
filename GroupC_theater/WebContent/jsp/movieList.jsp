<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String titleId = "M01";
String[] image = { "../image/tantei_boy.png",
		"../image/tantei_boy.png",
		"../image/skate_board.png",
		"../image/tantei_boy.png",
		"../image/tantei_hannin.png",
		"../image/tantei_boy.png",
		"../image/tantei_boy.png",
		"../image/tantei_boy.png",
		"../image/tantei_boy.png",};

%>

<div align="center">
	<h1>映画一覧</h1>
	<h2>上映中の映画</h2>

	<table>
	<% int dispWidth = 3; %>
	<% for (int i = 0; i < image.length; i += dispWidth) { %>
	<tr>
		<% for (int j = 0; j < dispWidth; j++) { %>
		<td>
			<a href="../DetailsServlet?titleId=<%= titleId %>"><img src=<%= image[i + j] %> title="名探偵コナソ　小六郎の死"></a>
		</td>
		<% } %>
	</tr>
	<% } %>

	</table>
</div>
</body>
</html>