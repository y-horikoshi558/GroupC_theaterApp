<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="common.userBean"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%

	List<userBean> userBeanList = (List<userBean>)session.getAttribute("sesUserBeanList");

	//sesUserBeanListがNULLの場合は初期化
		if (Objects.isNull(userBeanList)) {
			userBeanList = new ArrayList<>();
		}

		String user_id ="";
		String user_name = "";

		String user_email ="";
		String user_pass ="";

		for(userBean uBean:userBeanList){

			user_id =uBean.getUserId();
			user_name = uBean.getUserName();
			user_email = uBean.getuEmail();
			user_pass = uBean.getuPass();
		}

	%>

	<div class="main">

		<div class="title-wrapper">
			<h1>ユーザー情報の編集</h1>
		</div>

		<div class="container">
			<div class="userinfo-contents">

				<div class="info-id">
					<p>ユーザーID</p>
					<p><%=user_id %></p>
				</div>
				<div class="info-name">
					<p>ユーザー名</p>
					<p><%=user_name %></p>
				</div>

				<div class="reset-email">
					<p>メールアドレス</p>
					<input type="text" name="setEmail" form="sback" value="<%=user_email%>">
				</div>
				<div class="reset-pass">
					<p>パスワード</p>
					<input type="text" name="setPass" form="scheck" value="<%=user_pass%>">
				</div>

			<div class="bottom-container">
				<div class="buttom-contents">
					<div  class="form-back">
						<form action="myPage.jsp" method="get" id="sback">
							<input type="submit"form="sback" value="戻る">
						</form>
					</div>
					<div  class="form-check">
						<form action="testTopPage.jsp" method="post" id="scheck">
							<input type="submit" form="scheck" value="確認">
						</form>
					</div>

				</div>

			</div>

			</div>


		</div>

	</div>



</body>
</html>