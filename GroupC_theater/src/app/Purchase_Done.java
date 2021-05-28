package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.userBean;
import common.Purchase;

/**
 * Servlet implementation class Purchase_Done
 */
@WebServlet("/Purchase_Done")
public class Purchase_Done extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */

     // DB接続用コネクション
    	Connection objCon;

    	// 接続文字列
    	String connUrl = "";

    	public Purchase_Done() {
    	    super();
    		try {
    		    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    		    String serverName = "DESKTOP-5A44TTQ\\SQLEXPRESS";	// サーバ名
    		    String dbName = "Kensyu";						// データベース名

    		    String userName = "sa";							// ユーザ名
    		    String password = "Step2154822";				// パスワード

    		    connUrl = "jdbc:sqlserver://" + serverName + ";";
    		    connUrl += "database=" + dbName + ";";
    		    connUrl += "integratedSecurity=false;";
    		    connUrl += "user=" + userName + ";";
    		    connUrl += "password=" + password + ";";

    		}
    		catch(Exception objEx) {
    			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());
    		}
    	}

    	/**
    	 * DB接続処理
    	 *
    	 * @return 接続結果（true:接続成功、false：接続失敗）
    	 */
    	public boolean dbOpen() {
    		try {

    		    // 接続開始
    			objCon =DriverManager.getConnection(connUrl);

    			System.out.println("DB接続成功");

    		    // 接続成功
    		    return true;
    		}
    		catch(Exception objEx) {
    			// エラー表示
    			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

    			// 接続失敗
    			return false;
    		}


    	}


    	/**
    	 * DB切断処理
    	 *
    	 * @return 切断結果（true:切断成功、false：切断失敗）
    	 */
    	public boolean dbClose() {
    		try {

    		    // 切断開始
    			objCon.close();

    			System.out.println("DB切断成功");

    		    // 切断成功
    		    return true;
    		}
    		catch(Exception objEx) {
    			// エラー表示
    			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

    			// 切断失敗
    			return false;
    		}
    	}

//    	/**
//    	 *　チケット情報登録処理
//    	 *
//    	 * @param denpyo_No
//    	 *            伝票No
//    	 * @param user_id
//    	 *            ユーザーid（漢字）
//    	 * @param ticket_id
//    	 *            チケットID
//    	 * @param date
//    	 *            日付（フリガナ）
//    	 * @param start_time
//    	 *            上映開始時間
//    	 * @param seat
//    	 *            座席番号
//    	 * @param group_id
//    	 *            年齢
//    	 *
//    	 * @return 更新件数
//    	 */
//    	public int istTicket(String slip_no,String user_id, String title_id ,String date, String time, String seat , String group_id ){
//
//    		// 実行結果件数用変数
//    		int retCount = 0;
//    		group_id = "G2";
//
////    		//Statementを生成
////    	    Statement stmt;
//
//    	  //PreparedStatementを生成
//    	    PreparedStatement pstmt;
//
//    	    dbOpen();
//    		try {
//
////    			stmt = objCon.createStatement();
//
//    	        String sql = "";
//    	        sql += " INSERT INTO チケット売上  ";
//    	        sql += " VALUES (";
//    	        sql += "        '"+ slip_no + "' ,";
//    	        sql += "        '"+ user_id + "' ,";
//    	        sql += "        '"+ title_id + "' ,";
//    	        sql += "        '"+ date + "' ,";
//    	        sql += "        '"+ time + "' ,";
//    	        sql += "        '"+ seat + "',";
//    	        sql += "        '"+ group_id + "')";
//
//    	        // 実行SQL確認
//    	        System.out.println(sql);
//
//    			//SQLからのレスポンス結果を pstmt に格納
//    	        pstmt = objCon.prepareStatement(sql);
//
////    	        // 問い合わせの実行
////    	        retCount = stmt.executeUpdate(sql);
//    	        pstmt.executeUpdate();
//    	        pstmt.close();	// PreparedStatementのクローズ
//
////    	        stmt.close();	// Statementのクローズ
//
//    	        dbClose();
//
//    		} catch (SQLException e) {
//    			// エラー表示
//    			System.err.println(e.getClass().getName() + ":" + e.getMessage());
//    		}
//
//    		return retCount;
//
//    	}

    	/**
    	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    	 */
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    		response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();

			//文字化け修正
			request.setCharacterEncoding("utf-8");
			String text = request.getParameter("text");

			//登録用パラメータ取得
			String titleId = request.getParameter("title_id");
			String title = request.getParameter("title");
			String date = request.getParameter("date");

			String[] dateAry = date.split("-");
			String res1 = dateAry[0];
			String res2 = dateAry[1];
			String res3 = dateAry[2];

			String time = request.getParameter("time");
			String resalt3 = time.substring(0,2)+ time.substring(3,5);

			String[] age = request.getParameterValues("groupId");
			String[] price = request.getParameterValues("price");
			String[] seat = request.getParameterValues("seat");

			String theater = request.getParameter("theater");
			String resalt4 = theater.substring(5,6);
			String mileage = request.getParameter("mileage");



			//アトリビュート作成(セッション属性)
			HttpSession session = request.getSession();
			List<userBean> sUserId =(List<userBean>)session.getAttribute("userInfo");
			String userId = "";
			int userMile = 0;

			for(userBean uB :sUserId ) {
				userId = uB.getUserId();
				userMile = uB.getMileage();
			}


			session.setAttribute( "mileage" , userMile - Integer.parseInt(mileage));

			// DAO
			Purchase pur = new Purchase();

			for(int i = 0;i<age.length;i++) {

				if (seat[i] == "") {
					// 入っていない場合、書き込みしない
				} else {
					// 入っている場合、書き込み実行
					//subStringで月日を取る
					pur.istTicket(res2+res3+resalt3+resalt4+seat[i] ,userId,titleId,date,time,seat[i],age[i]);
				}
			}


    			response.sendRedirect("jsp/purchase_done.jsp");
    	}

}
