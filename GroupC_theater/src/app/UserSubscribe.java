package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DAO;

/**
 * Servlet implementation class UserSubscribe
 */
@WebServlet("/UserSubscribe")
public class UserSubscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSubscribe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName =request.getParameter("uName");
		String userKanaName =request.getParameter("uKanaName");
		String userEmail = request.getParameter("uEmail");
		String userId = request.getParameter("uId");
		String userPass = request.getParameter("uPass");
		String userPasschx = request.getParameter("uPassCheck");


		if(		userName.equals("") &&
				userKanaName.equals("") &&
				userId.equals("") &&
				userPass.equals("")
		  ) {

			response.sendRedirect("jsp/LoginError.jsp");
			return;
		}

		//入力パスワードと再入力パスワードの一致を確認する

			if(!userPass.equals(userPasschx)) {

				response.sendRedirect("view/subscribePage.jsp");

				//一致していない場合は再度登録ページに戻る
				return;
			}else {

		//新規ユーザー登録処理

			DAO db = new DAO();

			db.setUser(userId, userName, userKanaName, userEmail, userPass);


				response.sendRedirect("jsp/Top.jsp");
			}




	}

}
