package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.userBean;
import common.DAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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

		String id = request.getParameter("login_id");
		String pass = request.getParameter("password");

		DAO dao = new DAO();

		List<userBean> userList =dao.getUserData(id, pass);

		HttpSession session = request.getSession();

		//ここの処理不安定
		boolean login = false;
		if(userList.size() != 0) {
			login = true;
			session.setAttribute("login", login);
			session.setAttribute("userInfo", userList);
			/*下記の画面遷移先は、TOP画面制作者に任せる*/
			response.sendRedirect("view/testTopPage.jsp");

		}else {
			response.sendRedirect("view/LoginError.jsp");
		}


	}

}
