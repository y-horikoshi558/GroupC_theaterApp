<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class ="main">

		<div class="text-contents">
			<p>退会画面</p>
		</div>


		<div class ="bottom-contents">

			<form action="../view/myPage.jsp" method="post">

				<input type = submit value ="戻る">
			</form>
			<form action="../UnSub" method="post">
				<input type="text" name = checkId>
				<input type="text" name = checkPass>
				<input type = submit value ="退会">
			</form>

		</div>

		</div>



</body>
</html>