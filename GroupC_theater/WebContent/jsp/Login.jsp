<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>ログイン</title>
	<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>

</head>
<body>
<%--centerクラスは注意が出るのでいったん外す　margin 0 autoを使えばOk --%>
<main>

	ログイン<BR><BR>

	<form action ="../LoginServlet" method="POST">
		<div class="form-group">
	    <label for="Inputemail">メールアドレス、またはユーザーID</label>
	    <input type="text" class="form-control" style="width:250px;" placeholder="メールアドレス、またはユーザーID" name="login_id">
	  </div>
	  <div class="form-group">
	    <label for="Inputuser_pass">パスワード</label>
	    <input type="password" class="form-control" style="width:250px;" placeholder="パスワード" name="password">
	  </div>

	  <button type="submit" class="btn btn-warning" name="login">ログイン</button>

	</form>

	<form action="../jsp/Top.jsp">

		<button type="submit" class="btn btn-warning" name="back">戻る（TOPへ）</button>

	</form>

	<form action="../jsp/subscribePage.jsp">

		<button type="submit" class="btn btn-warning" name="new_account">新規登録</button><BR><BR><BR>

	</form>

</main>
</body>
</html>