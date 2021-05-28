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
 * Servlet implementation class UserInfoReset
 */
@WebServlet("/UserInfoReset")
public class UserInfoReset extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoReset() {
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

		String req_email ="";
		String req_pass ="";


		req_email = request.getParameter("setEmail");
		req_pass =	request.getParameter("setPass");

		HttpSession session = request.getSession();
		List<userBean> userBeanList = (List<userBean>)session.getAttribute("sesUserBeanList");


		String user_id ="";
		String user_pass = "";


		//値の取り出し
		for(userBean uBean:userBeanList){

			user_id =uBean.getUserId();
			user_pass = uBean.getuPass();

		}

		DAO db = new DAO();

		db.updateUser(req_email, req_pass, user_id, user_pass);

		response.sendRedirect("jsp/testTopPage.jsp");

	}

}
