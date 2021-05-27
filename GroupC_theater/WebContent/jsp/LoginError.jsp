<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エラー</title>
	<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<form action ="Login.jsp" method="POST">
		<p class="text-center bg-danger">いずれかの情報が間違っています</p><BR><BR><BR>
<center>
 <button type="submit" class="btn btn-warning" name="Back">戻る</button>
</center>
	</form>
</body>
</html>