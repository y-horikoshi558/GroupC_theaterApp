package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.userBean;
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



		//testLoginのパラメータを受け取る
		String id = request.getParameter("testId");


		//DAOの利用
		userInfoDAO infoDAO = new userInfoDAO();

		//userBean型のリストに SQLクエリの結果を入れる
		List<userBean> userBeanList= infoDAO.getUserData(id);



		//コンソールでデータベースの中身を確認
		userBeanList.forEach(userBean -> {
			System.out.println(userBean.getUserName());
		});




		//テスト用にセッションを作成する

		HttpSession session = request.getSession();//セッションの開始

		//session.setAttribute("atrText",id); //セッション名はatrText パラメータを格納する
		//テストセッションここまで


		//セッションの値が入ったList型インスタンスを次ページに送る
		session.setAttribute("sesUserBeanList", userBeanList);

		//リロードを回避する為のリダイレクト処理
		response.sendRedirect("view/myPage.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
