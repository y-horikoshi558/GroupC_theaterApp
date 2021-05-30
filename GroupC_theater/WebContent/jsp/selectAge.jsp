<%@page import="common.NullCheck"%>
<%@page import="bean.GroupBean"%>
<%@page import="java.util.List"%>
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
		var groupId = document.getElementsByName("groupId");
		var price = document.getElementsByName("price");
		var sumPrice = document.getElementById("sumPrice");
		var sumPriceDisp = document.getElementById("sumDisp");

		var sum = 0;
		for (var i = 0; i < select.length; i++)
		{
			var selectNum = document.getElementById("select"+i);
			group[i].value = selectNum[selectNum.selectedIndex].innerHTML;
			groupId[i].value = selectNum[selectNum.selectedIndex].name;

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

		// 仮遷移
		form.action = "./jsp/purchase.jsp";

	});

});


function setHid(obj){
	var id = $(obj).prop("id");

	var k = $('#'+id + ' option:selected').attr('class');

	$('#hidSelect'+id.replace("select","")).val(k);

}
</script>

<body>
<%
String title 	= (String)request.getAttribute("title");
String id 	= (String)request.getAttribute("id");
String date 	= (String)request.getAttribute("date");
String month = "";
String day = "";
String screen 	= (String)request.getAttribute("screen");
String time 	= (String)request.getAttribute("time");

String[] seats = new String[6];
seats = (String[])request.getAttribute("seats");

List<GroupBean> groupList = (List<GroupBean>)request.getAttribute("list");

if (NullCheck.nullCheckBoolean(title) == "" ||
NullCheck.nullCheckBoolean(date) == "" ||
NullCheck.nullCheckBoolean(seats[0]) == "")
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
		<h1><%= request.getAttribute("title") %></h1>

		<h2><%= month %>月<%= day %>日　<%= screen %>　<%= time %></h2>

		<p>チケットの種類をお選びください。</p>

		<form action="" id="form" method="GET">

		<% for (int i = 0; i < seats.length; i++) { %>
			<% if (seats[i] == "")	continue; %>

		<p>
		<%= seats[i] %>


		<select class="selectGroup" name="select" id="select<%= i %>" onChange="setHid(this)">
			<option value="0" selected>選択してください。</option>
			<% for (int j = 0; j < groupList.size(); j++) { %>

<%--
			<option  class="<%= groupList.get(j).getId() %>" value=<%= groupList.get(j).getPrice() %>><%= groupList.get(j).getAge() %></option>
			<option name=<%= groupList.get(i).getId() %> value=<%= groupList.get(j).getPrice() %>><%= groupList.get(j).getAge() %></option>
 --%>
				<option  class="<%= groupList.get(j).getId() %>" value=<%= groupList.get(j).getPrice() %>><%= groupList.get(j).getAge() %></option>



			<% } %>
		</select>
		<input type="hidden" name="hidSelect" id="hidSelect<%= i %>" >

		</p>

		<% } %>

		<p>-------------------------------------------------</p>
		<p>
			合計　　<a id="sumDisp">0</a>円
		</p>


			<input type="hidden" name="title" value=<%= title %>>
			<input type="hidden" name="title_id" value=<%= id %>>
			<input type="hidden" name="date" value=<%= date %>>
			<input type="hidden" name="theater" value=<%= screen %>>
			<input type="hidden" name="time" value=<%= time %>>

			<% for (int i = 0; i < seats.length; i++) { %>
				<input type="hidden" name="seat"value=<%= seats[i] %>>
				<input type="hidden" name="group">
				<input type="hidden" name="groupId">
				<input type="hidden" name="price">
			<% } %>
			<input type="hidden" name="motone" id="sumPrice">
			<input type="submit" class="purchase" value="購入">
		</form>
	</div>

</body>
</html>