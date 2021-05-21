<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>

<script type="text/javascript">

$(function() {
	$('.selectGroup').on("change", function(){

		var select = document.getElementsByName("select");
		var sumPrace = document.getElementById("sum_prace");

		var sum = 0;
		for (var i = 0; i < select.length; i++)
		{
			sum += Number(select[i].value);
		}
		//alert(sumPrace.innerHTML);
		sumPrace.innerHTML = sum;

	});

	$('.purchase').on("click", function(){

		var select = document.getElementsByName("select");

		for (var i = 0; i < select.length; i++)
		{
			if (select[i].value == 0)
				return;
		}

		alert("遷移");

	});

});

</script>

<body>
<%
String title = request.getParameter("title");
String date = request.getParameter("date");
String theater = request.getParameter("theater");
String time = request.getParameter("time");

String[] seats = new String[6];
seats = request.getParameterValues("seat");

%>

	<div align="center">
		<h1><%= request.getParameter("title") %></h1>

		<h2><%= date %>　<%= theater %>　<%= time %></h2>

		<p>チケットの種類をお選びください。</p>

		<% for (int i = 0; "" != seats[i]; i++) { %>

		<p>
		<%= seats[i] %>

		<select class="selectGroup" name="select">
			<option value="0" selected>選択してください。</option>
			<option value="1000">幼児</option>
			<option value="1500">小学生</option>
			<option value="1900">大人</option>
			<option value="1600">etc...</option>
		</select>

		</p>

		<% } %>

		<p>-------------------------------------------------</p>
		<p>
			合計　　<a id="sum_prace">0</a>円
		</p>

		<input type="button" class="purchase" value="購入">

	</div>

</body>
</html>