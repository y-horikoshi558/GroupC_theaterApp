<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.NullCheck"%>
<%@page import="java.util.List" %>
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

		if ($(this).css("background-color") == "rgb(128, 128, 128)")
			return;

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

		var form = document.getElementById("form");
		var submit = document.getElementById("submit");
		submit.disabled = false;
		form.action = "./selectGroup";
	});
});



</script>

<body>
<%
String[] seatColumn = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J" };

String title = request.getParameter("title");
String id = request.getParameter("id");
String date = request.getParameter("date");
String month = "";
String day = "";
String screen = "スクリーン" + request.getParameter("screen");
String time = request.getParameter("time");
List<String> seat = (List<String>)request.getAttribute("list");
int[] seatWH = (int[])request.getAttribute("seatWH");		// [0]:whidth, [1]:height

if (NullCheck.nullCheckBoolean(title) == "" ||
NullCheck.nullCheckBoolean(date) == "")
{ %>
	<META http-equiv="Refresh" content="0;URL=selectDate.jsp">
<%
	return;
}
else
{
	month = "" + Integer.parseInt(date.substring(5, 7));
	day = "" + Integer.parseInt(date.substring(8, 10));
}
%>
	<div align="center">
		<h1><%= title %></h1>
		<h2><%= month %>月<%= day %>日　<%= screen %>　<%= time %></h2>
		<form action="" method="GET" id="form">
			<table border="1" style="width: 800px; height: 100px;" id="sheetTable">
				<tr>
					<th class="tableHeader">席／列</th>
					<% // 横幅 %>
					<% for (int i = 0; i < seatWH[0]; i++) { %>
					<th class="tableHeader"><%= i + 1 %></th>
					<% } %>
				</tr>

				<% for (int y = 0; y < seatWH[1]; y++) { %>
				<tr>
					<th class="tableHeader"><%= seatColumn[y] %>列</th>
					<% for (int x = 0; x < seatWH[0]; x++) {
						String tdId = seatColumn[y] + "0" + (x + 1);
						boolean nonSelFlg = false; 			// true:選択不可
						for (int i = 0; i < seat.size(); i++) {
							if (tdId.equals(seat.get(i))) {
								nonSelFlg = true;
								break;
							}
						} %>
						<td class="kuuseki" id=<%= tdId %> bgcolor=<%= nonSelFlg ? "gray" : "white" %>></td>
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
			<input type="hidden" name="id" value=<%= id %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="screen" value=<%= screen %>>
			<input type="hidden" name="time" value=<%= time %>>
			<input type="submit" value="購入する" id="submit" disabled>
		</form>
	</div>
</body>
</html>