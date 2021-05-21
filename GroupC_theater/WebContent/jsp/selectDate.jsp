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
<body>

<script type="text/javascript">

$(function() {

	$('.selectDay').on("click", function(){

		if($(this).css("background-color")!="rgb(198, 198, 198)")
		{
			$(this).css('background-color',"rgb(198, 198, 198)");
		}
		else
		{
			$(this).css('background-color','white');
		}
	});

});
</script>

<form action="#">
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
				<th class="selectDay"><%= day[i] %></th>
				<%
						cal.add(Calendar.DAY_OF_MONTH, 1);
					}
				%>

			</tr>

		</table>
		<BR><BR><BR>
		<input type="button" onclick="checkSheet()" value="購入する">
		<input type="hidden" name="hidSheet" id="hidSheet">
	</form>

</body>
</html>