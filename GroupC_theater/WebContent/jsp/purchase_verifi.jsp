<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<br><br>
<title>チケット購入確認</title>

<style>
	body{
		background-color:silver;
		margin:30px;
		padding : 20px ;
		align:center;
	}

	h1{
		color:purple;
		font-size:40px;
   }

   h2{
   		color:black;
   }

	table{}


	table#ticket1{
		font-size:25px;
		width:1200px;
		margin:0 auto;
		border: solid 3px purple;
		text-align:center;
		border-radius: 0.5em;

	}

	table#ticket2{
		font-size:25px;

		width:1200px;
		color:red;
		border: solid 3px purple;
		text-align:center;
		border-radius: 0.5em;
	}

	table#ticket3{
		font-size:25px;

		width:1200px;
		margin: 0 auto;
		border: solid 3px purple;
		text-align:center;
		border-radius: 0.5em;
	}

	table#ticket4{
		font-size:25px;

		width:1200px;
		margin:0 auto;
		border: solid 3px purple;
		text-align:center;
		border-radius: 0.5em;
	}

	.creca input[type=number] {
			font: 10px/16px sans-serif;
			box-sizing: border-box;
			width: 5%;
			margin: 8px 0;
			padding: 0.3em;
			transition: 0.3s;
			border: 1px solid #1b2538;
			border-radius: 4px;
			outline: none;
	}

	.landscape{

			display:inline-block;
	}

</style>

</head>
<body>

<center>
<h1>チケット購入確認</h1>

<br><br>

<header>
へっだー
</header>

<form action = "../Purchase_Done" >

<%
String title_id = request.getParameter("title_id");
String title = request.getParameter("title");
String date  = request.getParameter("date");
String time  = request.getParameter("time");
String theater = request.getParameter("theater");
String sumPrice = request.getParameter("sumPrice");

String flg = request.getParameter("maneger");
String mileage = request.getParameter("mileage");
String sUser_id = (String)session.getAttribute("user_id");
String sMileage = (String)session.getAttribute("mileage");

String credit = request.getParameter("credit");

String[] seats = new String[6];
seats = request.getParameterValues("seat");
String[] group = new String[6];
group = request.getParameterValues("group");
String[] price = new String[6];
price = request.getParameterValues("price");
%>

<h2>～チケット詳細～</h2>

<table id = "ticket1">
<%--チケット情報を枚数分表示--%>
<% for(int i = 0; i < seats.length; i++) { %>
<% if (seats[i] == "") continue; %>
<tr>
<td><%="タイトル"%></td>
<td><%="　日付"%></td>
<td><%="　上映開始時間"%></td>
<td><%="　年齢"%></td>
<td><%="　価格"%></td>
<td><%="　シアター"%></td>
<td><%="　座席番号"%></td>
</tr>

<tr>
<td><%=title + "　"%></td>
<td><%=date + "　　　"%></td>
<td><%=time + "～　"%></td>
<td><%=group[i] + "　"%></td>
<td><%=price[i] + "円　"%></td>
<td><%=theater + "　"%></td>
<td><%=seats[i]%></td>
</tr>

<% } %>
</table>

<br><br>

<table id = "ticket3">

<td> 合計金額:　  <a id = "sum"><%= sumPrice %></a>  円</td>

</table>

<br><br>

<table id = "ticket4">
<%--クレカの下4桁だけを表示させる--%>
<td>
<%= flg %>
<%=credit%>
</td>
</table>

<br><br>

<div class = "landscape">
<input type="hidden" name="title_id" value=<%= title_id %>>
<input type="hidden" name="title" value=<%= title %>>
<input type="hidden" name="date" value=<%= date %>>
<input type="hidden" name="theater" value=<%= theater %>>
<input type="hidden" name="time" value=<%= time %>>
<% for (int i = 0; i < seats.length; i++) { %>
<input type="hidden" name="seat"value=<%= seats[i] %>>
<input type="hidden" name="group" value=<%= group[i] %>>
<input type="hidden" name="price" value=<%= price[i] %>>
<% } %>
<input type="hidden" name="sumPrice" value=<%= sumPrice %>>

<input type = "submit" value = "購入">
</div>
</form>

<form action = "purchase.jsp">
<div class= "landscape">
<input type="hidden" name="title" value=<%= title %>>
<input type="hidden" name="date" value=<%= date %>>
<input type="hidden" name="theater" value=<%= theater %>>
<input type="hidden" name="time" value=<%= time %>>
<% for (int i = 0; i < seats.length; i++) { %>
<input type="hidden" name="seat"value=<%= seats[i] %>>
<input type="hidden" name="group" value=<%= group[i] %>>
<input type="hidden" name="price" value=<%= price[i] %>>
<% } %>
<input type="hidden" name="motone" value=<%=request.getParameter("motone")%>>
<input type="hidden" name="sumPrice" value=<%= sumPrice %>>
<input type="hidden" name="maneger" value=<%= flg %> >
<input type = "submit" value = "戻る">
</div>
</form>

</center>

</body>
</html>