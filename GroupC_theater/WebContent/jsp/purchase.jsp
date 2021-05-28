<%@page import="java.util.Objects"%>
<%@page import="bean.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@page import = "bean.userBean"%>
<%@page import="bean.GroupBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>チケット購入</title>

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

	table#ticket5{
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

	.security input[type=number] {
			font: 15px/24px sans-serif;
			box-sizing: border-box;
			width: 10%;
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

 <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body style="background-color:#c4e9e6;">
<center>

<h1>チケット購入ページ</h1>
<br><br>

<header>
へっだー
</header>
<%
List<userBean> userInfo = (List<userBean>)session.getAttribute("userInfo");//マイレージ取得
int mileage = 0;
if(Objects.nonNull(userInfo)){
	mileage = userInfo.get(0).getMileage();
}
%>
<script type="text/javascript">


//マイレージが押されているかの判定
function myfunc(){
var mileage = <%=mileage%>;  //マイレージ
var sum = <%=request.getParameter("motone")%>;				//表示用金額
var myragesum = document.getElementById("myragesum");				//表示用マイレージ適用金額
var sumsum = document.getElementById("sumPrice");		//値受け渡し用合計金額



	if (document.getElementById("maneger").checked) {

		  document.getElementById("sum").innerHTML = sum - mileage;


		  if(Number(sum.innerHTML) <= 0  ){
			  sMileage = mileage -sum ;
			  document.getElementById("sum").innerHTML = "0";
		  }
		  	sumsum.value = document.getElementById("sum").innerText;


	 }else{

		 document.getElementById("sum").innerHTML = sum;
		 sumsum.value = sum;

	 }
}


const input = document.querySelector('input[type="number"]')
input.addEventListener('input', function(e) {
  const value = e.target.value
  if (value >= 4) {
    e.target.value = value.slice(0, 4)
  }
})
</script>

<br><br>

<form action = "purchase_verifi.jsp" id= "aa">

<%
String title_id = request.getParameter("title_id");
String title = request.getParameter("title");
String date  = request.getParameter("date");
String time  = request.getParameter("time");
String theater = request.getParameter("theater");
String sumPrice = request.getParameter("motone"); //動かないもともとの金額
String sumPrice2 = request.getParameter("sumPrice"); //マイレージの変動あり
String sUser_id = (String)session.getAttribute("user_id");

List<userBean> sUserId =(List<userBean>)session.getAttribute("userInfo");
int userMile = 0;

for(userBean uB :sUserId ) {
	userMile = uB.getMileage();
}
String maneger =  request.getParameter("maneger");


String[] seats = new String[6];
seats = request.getParameterValues("seat");

String[] groupId = new String[6];
groupId = request.getParameterValues("hidSelect");

String[] group = new String[6];
group = request.getParameterValues("group");
String[] price = new String[6];
price = request.getParameterValues("price");

String flg = request.getParameter("maneger");
if (flg == null) flg = "";
%>

<h2>～チケット詳細～</h2>
<br><br>

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

	<td> 合計金額:　  <a id = "sum">
	<% if(flg.equals("on") ){%>
	<%= sumPrice2 %></a>  円</td>
	<%}else{ %>
	<%= sumPrice %></a>  円</td>
	<%} %>
</table>

<div name = "manegercheck" id ="aa">
	<td id = "mileage">
	<input type="checkbox" name="maneger"  id="maneger" onchange="myfunc()"   <%= flg.equals("on") ? "checked" : "" %>>マイレージの使用（<%=mileage%>円）
	</td>
</div>

<br><br>

<table id = "ticket4">
  <tr>
  <th class="creca">クレジットカード番号を入力(16ケタ)</th>
  </tr>

  <tr>
 <td>
    <input id="credit" type="number" max="9999" maxlength="4" placeholder="0000" name="credit" >
    <input type="number" maxlength="4" max="9999" placeholder="0000" name="credit1">
    <input type="number" maxlength="4" max="9999" placeholder="0000" name="credit2">
    <input type="number" maxlength="4" max="9999" placeholder="0000" name="credit3">
</td>
</tr>
</table>

<br><br>

<table id = "ticket5">

<td class = "security">セキュリティ番号を入力(4ケタ)
<input type = "password" maxlength = "4" name = "code" placeholder= "1234">
</td>

</table>

<br><br>
<table border="0" width="300px">
	<tr>
		<td>
			<input type="hidden" name="title_id" value=<%= title_id %>>
			<input type="hidden" name="title" value=<%= title %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="theater" value=<%= theater %>>
			<input type="hidden" name="time" value=<%= time %>>

			<% for (int i = 0; i < seats.length; i++) { %>
				<input type="hidden" name=<%="seat"%> value=<%= seats[i] %>>
				<input type="hidden" name="group" value=<%= group[i] %>>

				<input type="hidden" name="price" value=<%= price[i] %>>
			<% } %>
			<% for (int i = 0; i < groupId.length; i++) { %>
				<input type="hidden" name="groupId" value=<%= groupId[i] %>>
			<%} %>
			<input type="hidden" id="credit" name = "mileage" value =<%= mileage %>>
			<input type="hidden" id="credit" name = "mileage" value =<%= userMile %>>
			<input type="hidden" id="sumPrice" name = "sumPrice" value=<%= sumPrice %>>
			<input type="hidden" name = "motone" value=<%=request.getParameter("motone")%>>
			<input type="hidden" id="credit" name = "credit">
			<input type="submit" class="purchase btn btn-outline-primary btn-lg" id = "kou" value="購入">
</form>
	</td>
	<td>
<form action="selectAge.jsp" id="form" method="GET">
			<input type="hidden" name="title" value=<%= title %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="theater" value=<%= theater %>>
			<input type="hidden" name="time" value=<%= time %>>
			<% for (int i = 0; i < seats.length; i++) { %>
				<input type="hidden" name="seat"value=<%= seats[i] %>>
				<input type="hidden" id="sumPrice" value=<%= sumPrice %>>
				<input type="hidden" name="group">
				<input type="hidden" name="price">
			<% } %>
			<input type="submit" class="purchase btn btn-outline-success btn-lg" value="戻る">
		</form>
	</td>
	</tr>
</table>
</center>
</body>
</html>