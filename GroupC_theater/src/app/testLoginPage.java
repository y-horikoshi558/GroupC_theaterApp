package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.LoginDAO;
import common.userBean;

/**
 * Servlet implementation class testLoginPage
 */
@WebServlet("/testLoginPage")
public class testLoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public testLoginPage() {
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


		HttpSession userSession = request.getSession();

		String login = request.getParameter("testId");
		String password = request.getParameter("testpass");

		LoginDAO db = new LoginDAO();

		List<userBean> user = db.getLogin(login,password);



		if(user != null ) {

			userSession.setAttribute("user",user);

			response.sendRedirect("view/testTopPage.jsp");

			return;
		}

		response.sendRedirect("view/testLoginError.jsp");


		//メモ　DAOから受け取った配列中身によって移動先を変えたいが
		//		DBにない値を入れた場合でも条件式の中身に入ってしまう
		//		デバックでuserの中身を確認したら、値は入っていたため
		//		分岐条件をuser.size() == 0 にしたが、改善しなかった
		//		編集の際は LoginDAOとDBClassのサーバー名を見直して
		//		ファイルパスの変更もお願いします。



	}

}
