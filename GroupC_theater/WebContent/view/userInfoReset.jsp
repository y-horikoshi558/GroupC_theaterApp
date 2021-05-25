<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="bean.userBean"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function next(){
	document.frm.action = "../UserInfoReset";
	document.frm.submit();
}
</script>
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

				</div>
				<div class="reset-pass">
					<p>パスワード</p>

				</div>

			<form action="myPage.jsp" method="post" id ="sback" name="frm">

			<div class="bottom-container">
				<div class="buttom-contents">
					<div  class="form-back">

							<input type="submit" value="戻る" form="sback">

					</div>
					<div  class="form-check">


						<input type="text" name="setEmail"  value="<%=user_email%>">

						<input type="button" value="確認" onClick="next()">


						<input type="text" name="setPass" form="inputreset" value="<%=user_pass%>">
					</div>

				</div>

			</div>

			</form>
			</div>


		</div>

	</div>



</body>
</html>