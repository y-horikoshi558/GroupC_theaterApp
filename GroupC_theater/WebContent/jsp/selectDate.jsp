<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Sample</title>
	    <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">

$(function() {

	$('.selectDay').on("click", function(){

		var selectDate = document.getElementsByName("selectDate");
		var nonDispDay = document.getElementById("schedule");
		var dispDay = document.getElementsByName(this.innerHTML);

		for (var i = 0; i < selectDate.length; i++)
		{
			$(selectDate).css('background-color','white');
		}

		for (var i = 0; i < nonDispDay.rows.length; i++)
		{
			nonDispDay.rows[i].hidden = true;
		}

		$(this).css('background-color',"rgb(198, 198, 198)");

		for (var i = 0; i < dispDay.length; i++)
		{
			dispDay[i].hidden = false;
		}
	});

	$('.selectTime').on("click", function(){

		//var id = document.getElementsByName("titleId");
		var date = document.getElementsByName("date");
		var time = document.getElementsByName("time");
		var screen = document.getElementsByName("screen")

		var selectTime = document.getElementsByName("selectTime");
		var form = document.getElementById("form");

		for (var i = 0; i < selectTime.length; i++)
		{
			$(selectTime).css('background-color','white');
		}

		$(this).css('background-color',"rgb(198, 198, 198)");

		screen[0].value = this.id.substr(0,1);
		date[0].value = this.id.substr(1,10);
		time[0].value = this.id.substr(11,5);

		form.action = "selectSeat.jsp";
	})

});

</script>

<body>
<%
String title = "名探偵オグリ　勝利の鼓動";
String id = "M01";
ArrayList<String[]> scheduleList = new ArrayList<String[]>();
scheduleList.add(new String[]{"M01", "2021-05-24", "10:00", "A"});
scheduleList.add(new String[]{"M01", "2021-05-24", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-24", "15:00", "A"});
scheduleList.add(new String[]{"M01", "2021-05-24", "17:30", "B"});
scheduleList.add(new String[]{"M01", "2021-05-25", "10:00", "A"});
scheduleList.add(new String[]{"M01", "2021-05-25", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-25", "17:30", "B"});
scheduleList.add(new String[]{"M01", "2021-05-25", "12:30", "C"});
scheduleList.add(new String[]{"M01", "2021-05-25", "17:30", "B"});
scheduleList.add(new String[]{"M01", "2021-05-26", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-27", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-28", "17:30", "B"});
scheduleList.add(new String[]{"M01", "2021-05-29", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-30", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-05-30", "12:30", "D"});
scheduleList.add(new String[]{"M01", "2021-06-01", "12:30", "A"});
scheduleList.add(new String[]{"M01", "2021-06-02", "12:30", "A"});

%>

<div align="center">

<h1><%= title %></h1>

<form action="" id="form" method="GET">
	<table border="1" style="width: 800px;" id="sheetTable">
		<tr>
			<th class="tableHeader">席／列</th>
			<%
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("dd");
				Calendar cal = Calendar.getInstance();
				String[] day = new String[7];

				cal.setTime(date);

				for (int i = 0; i < day.length; i++)
				{
					day[i] = sdf.format(cal.getTime());
			%>
			<th class="selectDay" name="selectDate"><%= day[i] %></th>
			<%
					cal.add(Calendar.DAY_OF_MONTH, 1);
				}
			%>

		</tr>

	</table>
	<BR><BR><BR>


	<% // 上映するスクリーンを識別
	ArrayList<String> stheaters = new ArrayList<String>();
	stheaters.add(scheduleList.get(0)[3]);
	for (int i = 1; i < scheduleList.size(); i++) {
		for (int j = 0; j < stheaters.size(); j++) {
			if (stheaters.get(j) == scheduleList.get(i)[3])
				break;
			if (j != stheaters.size() - 1)
				continue;

			stheaters.add(scheduleList.get(i)[3]);
			break;
		}
	} %>

	<table border="1" id="schedule">
	<% for (int k = 0; k < day.length; k++) { %>
		<% for (int i = 0; i < stheaters.size(); i++) { %>
			<% boolean once = false; %>
			<tr id=<%= day[k] %> name=<%= day[k] %> hidden>
			<% for (int j = 0; j < scheduleList.size(); j++) { %>
				<% // 日付チェック　getの添え字を変えると日付変更可能 %>
				<% if (!day[k].equals(scheduleList.get(j)[1].substring(8, 10))) continue; %>
				<% // シアターチェック %>
				<% String sday = scheduleList.get(j)[3]; %>
				<% if (stheaters.get(i) != sday) continue; %>

				<% if (!once) { %>
					<% once = true; %>
					<th><%= stheaters.get(i) %> Screen</th>
				<% } %>

				<% String tdId = sday + scheduleList.get(j)[1] + scheduleList.get(j)[2]; %>
				<td class="selectTime" id=<%= tdId %> name="selectTime"><%= scheduleList.get(j)[1] %><br>
				<%= scheduleList.get(j)[2] %></td>

			<% } %>
			</tr>
		<% } %>
	<% } %>
	</table>


	<input type="hidden" name="title" value=<%= title %>>
	<input type="hidden" name="id" value=<%= id %>>
	<input type="hidden" name="date">
	<input type="hidden" name="time">
	<input type="hidden" name="screen">
	<input type="submit" value="購入する">
</form>
</div>
</body>
</html>