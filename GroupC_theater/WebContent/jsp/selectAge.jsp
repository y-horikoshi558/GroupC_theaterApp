<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">

$(function() {
	$('.selectGroup').on("change", function(){

		var select = document.getElementsByName("select");
		var group = document.getElementsByName("group");
		var price = document.getElementsByName("price");
		var sumPrice = document.getElementById("sumPrice");
		var sumPriceDisp = document.getElementById("sumDisp");

		var sum = 0;
		for (var i = 0; i < select.length; i++)
		{
			var selectNum = document.getElementById("select"+i);
			group[i].value = selectNum[selectNum.selectedIndex].innerHTML;

			price[i].value = select[i].value;
			sum += Number(select[i].value);
		}

		sumPrice.value = sum;
		sumPriceDisp.innerHTML = sum;

	});

	$('.purchase').on("click", function(){

		var select = document.getElementsByName("select");
		var form = document.getElementById("form");

		for (var i = 0; i < select.length; i++)
		{
			if (select[i].value == 0)
				return;
		}

		form.action = "selectDate.jsp";

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

		<select class="selectGroup" name="select" id="select<%= i %>">
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
			合計　　<a id="sumDisp">0</a>円
		</p>

		<form action="" id="form" method="GET">
			<input type="hidden" name="title" value=<%= title %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="theater" value=<%= theater %>>
			<input type="hidden" name="time" value=<%= time %>>
			<% for (int i = 0; i < seats.length; i++) { %>
			<%= seats[i] %>
				<input type="hidden" name="seat"value=<%= seats[i] %>>
				<input type="hidden" name="group">
				<input type="hidden" name="price">
			<% } %>
			<input type="hidden" name="sumPrice" id="sumPrice">
			<input type="submit" class="purchase" value="購入">
		</form>
	</div>

</body>
</html>