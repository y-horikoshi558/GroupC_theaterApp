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
import common.userInfoDAO;

/**
 * Servlet implementation class myPage
 */
@WebServlet("/myPage")
public class myPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		// TODO Auto-generated method stub

		/*testLoginPage.jspからのパラメータの受け取り*/
		//String testid = request.getParameter("testId");

		HttpSession session = request.getSession();//セッションの利用を開始

		boolean loginchx = (boolean) session.getAttribute("login");

		if(loginchx != false) {

		//セッションからuser_idのパラメータを受け取る
		List<userBean> loginData = (List<userBean>)session.getAttribute("userInfo");

		//セッションから値を取り出す

			String userid = "";

				for(userBean uLogin:loginData){
					userid = uLogin.getUserId();
				}

		userInfoDAO infoDAO = new userInfoDAO();

		//表示用のデータをデータベースから持ってくる
		List<userBean> userBeanList= infoDAO.getUserData(userid);

		//中身の確認
		userBeanList.forEach(userBean -> {
			System.out.println(userBean.getUserName());
		});


		//セッションの値が入ったList型インスタンスを次ページに送る
		session.setAttribute("sesUserBeanList", userBeanList);

		//リロードを回避する為のリダイレクト処理
		response.sendRedirect("jsp/myPage.jsp");

		}else {
			response.sendRedirect("jsp/Login.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
