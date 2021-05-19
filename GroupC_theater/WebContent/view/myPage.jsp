<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
	<link rel="stylesheet" type="text/css" href="../public/stylesheet.css">

	<%
		int testId = 101;
	%>

</head>
<body>
	<header>
		<h2 class="PageWrapper">headerWrapper</h2>
	</header>
	<div class="main">
		<div class="myPageWrapper">
			<h1>マイページ</h1>
		</div>

		<div class="checkId">
			<p> テスト:</p>
		</div>

		<div class="myPageContents">
		<div class="contents">
			<div class="content">
				<p>ユーザーID</p>
				<form action="" method="get">

				</form>
			</div>
			<div class="content">
				<p>メールアドレス</p>
			</div>
			<div class="content">
				<p>パスワード</p>
			</div>
		</div>


			<div class="milageContents">
				<div class="milageDateBox">
					<div class="runk">
					<p>Rank</p>
				</div>
				<div class="milagePoint">
					<p>マイレージポイント</p>
				</div>
				</div>
			</div>

			<div class="bottomContents">

					<div class="bottomLeft">
						<input class="btn renderTop" type="submit" value="TOPへ">
					</div>

					<div class="bottomRight">
						<input class="btn renderSet" type="submit" value="変更">
						<input class="btn renderUnsub" type="submit" value="退会">
					</div>


			</div>

		</div>
	</div>
	<footer>

	</footer>

</body>
</html>