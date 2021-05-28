<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入完了</title>

<style>
	body{
			background-color:#c4e9e6;
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

	.ticket{
		font-size:30px;
		color:#FFABCE;
	}
</style>

<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>


</head>
<body style=background-color:#c4e9e6;>
<center>

<header>
ヘッダー
</header>
<%
List<String> slip_id_list = (List<String>)session.getAttribute("slip_id_list");
%>

<br><br>

<h1>チケット購入完了ページ</h1>

<br><br>

<p>ご購入ありがとうございました。</p>


<br><br>


<div class="hikae" >※チケットIDを必ずお控えください。</div>


<br><br>

<div class="ticket">チケットID : <br>

<%
	for(String id : slip_id_list){
%>
		・<%=id %><br>
<%
	}
%>
</div>

<br><br>


<form action = "../Top">

<input type = "submit" class="purchase btn btn-outline-primary btn-lg" value = "Topへ">


</form>

</center>
</body>
</html>