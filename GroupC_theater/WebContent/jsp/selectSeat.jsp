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

	var seats;

	$('.kuuseki').on("click", function(){

		if($(this).css("background-color")!="rgb(255, 0, 0)"){
			$(this).css('background-color','red');

			var demo2 = document.getElementById("test");
			demo2.innerHTML = "あああ";


		}
		else{
			$(this).css('background-color','white');

			var demo2 = document.getElementById("test");
			demo2.innerHTML = "いいい";
		}
	});

});



</script>

<body>
	<%
		String[] seats = new String[6];
		for (int i = 0; i < seats.length; i++)
			seats[i] = "　";
	%>

	<form action="#">
		<table border="1" style="width: 800px;" id="sheetTable">
			<tr>
				<th class="tableHeader">席／列</th>
				<th class="tableHeader">１</th>
				<th class="tableHeader">２</th>
				<th class="tableHeader">３</th>
				<th class="tableHeader">４</th>
				<th class="tableHeader">５</th>
				<th class="tableHeader">６</th>
				<th class="tableHeader">７</th>
			</tr>
			<tr>
				<th class="tableHeader">A席</th>
				<td onclick="selectSeat(A01)" id="A01"></td>
				<td class="kuuseki" id="A02"></td>
				<td class="kuuseki" id="A03"></td>
				<td class="kuuseki" id="A04"></td>
				<td class="kuuseki" id="A05"></td>
				<td class="kuuseki" id="A06"></td>
				<td class="kuuseki" id="A07"></td>
			</tr>
			<tr>
				<th class="tableHeader">B席</th>
				<td class="kuuseki" id="B01"></td>
				<td class="reserve" id="B02"></td>
				<td class="reserve" id="B03"></td>
				<td class="kuuseki" id="B04"></td>
				<td class="kuuseki" id="B05"></td>
				<td class="kuuseki" id="B06"></td>
				<td class="kuuseki" id="B07"></td>
			</tr>
			<tr>
				<th class="tableHeader">C席</th>
				<td class="kuuseki" id="C01"></td>
				<td class="reserve" id="C02"></td>
				<td class="kuuseki" id="C03"></td>
				<td class="kuuseki" id="C04"></td>
				<td class="reserve" id="C05"></td>
				<td class="kuuseki" id="C06"></td>
				<td class="kuuseki" id="C07"></td>
			</tr>
		</table>
		<BR><BR><BR>

		<table border="1" style="width: 800px;" id="sheetTable">
		<% for (int i = 0; i < 6; i++) { %>

			<th id = "<%= seats[i] %>"><%= seats[i] %></th>
		<% } %>

		</table>

		<a id="test">テスト</a>

		<input type="button" onclick="checkSheet()" value="購入する">
		<input type="hidden" name="hidSheet" id="hidSheet">
	</form>

</body>
</html>