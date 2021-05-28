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
 * Servlet implementation class UnSub
 */
@WebServlet("/UnSub")
public class UnSub extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnSub() {
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
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		//セッションからIDとパスをもらう
		List<userBean> userBeanList = (List<userBean>)session.getAttribute("sesUserBeanList");


		String userid = "";
		String userpass = "";

		//セッションから値を取り出す
		for(userBean uBean:userBeanList){
			userid = uBean.getUserId();
			userpass = uBean.getuPass();

		}
		//取り出した値の確認
		System.out.println(userBeanList);
		System.out.println(userid);
		System.out.println(userpass);

		//テキストフィールドのパラメータを表示

		String chxuserid = request.getParameter("checkId");
			System.out.println(chxuserid);
		String chxuserpass = request.getParameter("checkPass");
			System.out.println(chxuserpass);


			if(!userid.equals(chxuserid) && !userpass.equals(chxuserpass)) {
				response.sendRedirect("jsp/unSubscribe.jsp");
				return;
			}else {

				DAO db = new DAO();

				db.deleteUser(userid,userpass);

				response.sendRedirect("jsp/testTopPage.jsp");

			}


	}

}
