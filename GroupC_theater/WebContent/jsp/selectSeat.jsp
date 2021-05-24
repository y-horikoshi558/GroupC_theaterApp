<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.NullCheck"%>
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

	$('.kuuseki').on("click", function(){

		var seats = document.getElementsByName("seats");
		var seat = document.getElementsByName("seat");

		for (var i = 0; i < seats.length; i++)
		{
			if (seats[i].innerHTML == this.id)
			{
				seats[i].innerHTML = "空席";
				seat[i].value = "";
				$(this).css('background-color','white');

				return;
			}
		}
		for (var i = 0; i < seats.length; i++)
		{
			if (seats[i].innerHTML != "空席")
				continue;

			seats[i].innerHTML = this.id;
			seat[i].value = this.id;
			$(this).css('background-color','red');

			break;
		}
	});
});



</script>

<body>
<%
String title = request.getParameter("title");
String date = "5" + "月" + "31" + "日";
String theater = "シアター" + "A";
String time = "17:40";

if (NullCheck.nullCheckBoolean(title) == "")
%>
<META http-equiv="Refresh" content="0;URL=test.jsp">

	<div align="center">
		<h1><%= title %></h1>
		<h2><%= date %>　<%= theater %>　<%= time %></h2>

		<form action="selectAge.jsp" method="GET">
			<table border="1" style="width: 800px; height: 100px;" id="sheetTable">
				<tr>
					<th class="tableHeader">席／列</th>
					<% // 横幅 %>
					<% int seatRow = 7; %>
					<% for (int i = 0; i < seatRow; i++) { %>
					<th class="tableHeader"><%= i + 1 %></th>
					<% } %>
				</tr>

				<% String[] seatColumn = { "A", "B", "C", "D", "E", "F", "G", "H", "I" }; %>
				<% for (int y = 0; y < 4; y++) { %>
				<tr>
					<th class="tableHeader"><%= seatColumn[y] %>列</th>
					<% for (int x = 0; x < seatRow; x++) { %>
					<td class="kuuseki" id="<%= seatColumn[y] + "0" + (x + 1) %>"></td>
					<% } %>

				</tr>
				<% } %>

			</table>
			<BR><BR><BR>

			<table border="1" style="width: 500px; height: 50px;" id="sheetTable">
			<%
			String[] seats = new String[6];
			for (int i = 0; i < seats.length; i++)
			{
				seats[i] = "" + i;
			%>

				<th name="seats">空席</th>
				<input type="hidden" name="seat">

			<%
			}
			%>

			</table>
			<br><br>

			<input type="hidden" name="title" value=<%= title %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="theater" value=<%= theater %>>
			<input type="hidden" name="time" value=<%= time %>>
			<input type="submit" value="購入する">
		</form>
	</div>
</body>
</html>