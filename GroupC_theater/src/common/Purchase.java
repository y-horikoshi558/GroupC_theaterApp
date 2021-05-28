package common;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Purchase extends DBClass{

	/**
	 *　チケット情報登録処理
	 *
	 * @param denpyo_No
	 *            伝票No
	 * @param user_id
	 *            ユーザーid（漢字）
	 * @param ticket_id
	 *            チケットID
	 * @param date
	 *            日付（フリガナ）
	 * @param start_time
	 *            上映開始時間
	 * @param seat
	 *            座席番号
	 * @param group_id
	 *            年齢
	 *
	 * @return 更新件数
	 */
	public int istTicket(String slip_no,String user_id, String title_id ,String date, String time, String seat , String group_id ){

		// 実行結果件数用変数
		int retCount = 0;



//		//Statementを生成
//	    Statement stmt;

	  //PreparedStatementを生成
	    PreparedStatement pstmt;

	    dbOpen();
		try {

//			stmt = objCon.createStatement();

	        String sql = "";
	        sql += " INSERT INTO チケット売上  ";
	        sql += " VALUES (";
	        sql += "        '"+ slip_no + "' ,";
	        sql += "        '"+ user_id + "' ,";
	        sql += "        '"+ title_id + "' ,";
	        sql += "        '"+ date + "' ,";
	        sql += "        '"+ time + "' ,";
	        sql += "        '"+ seat + "',";
	        sql += "        '"+ group_id + "')";

	        // 実行SQL確認
	        System.out.println(sql);

			//SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);

//	        // 問い合わせの実行
//	        retCount = stmt.executeUpdate(sql);
	        pstmt.executeUpdate();
	        pstmt.close();	// PreparedStatementのクローズ

//	        stmt.close();	// Statementのクローズ

	        dbClose();

		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return retCount;

	}

}
