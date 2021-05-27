<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入完了</title>

<style>
	body{
			background-color:silver;
			margin:30px;
			padding : 20px ;
			align:center;
		}

	p{
		font-size:25px;
	}

	.hikae{
		font-size:20px;
		color:red;
	}

	table{

	width:500px;
	height:60px;
		color:red;
		border: solid 3px purple;
		text-align:center;
	font-size:40px:

	}
</style>


</head>
<body>
<center>

<header>
ヘッダー
</header>
<%
String slip_id = (String)session.getAttribute("slip_id");
%>

<br><br>
<p>ご購入ありがとうございました。</p>

<br><br>

<div class="hikae" >※チケットIDを必ずお控えください。</div>

<br><br>

<table>
<td>
チケットID : <%=slip_id%>
</td>
</table>

<br><br>

<form action = "Top.jsp">

<input type = "submit" value = "Topへ">

</form>
</center>
</body>
</html>