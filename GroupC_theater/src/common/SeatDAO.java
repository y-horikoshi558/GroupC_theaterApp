package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO extends DBClass{

	public List<String> getSeat(String id, String date, String start) {

		List<String> data = new ArrayList<String>();

		// PreparedStatement生成
		PreparedStatement pstmt;

		try {

			//stmt = objCon.createStatement();

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/

			String sql = "";
			sql += " SELECT	seats ";
			sql += " FROM  	チケット売上 ";
			sql += " WHERE 	1 = 1 ";
			sql += " AND	title_id = ? ";
			sql += " AND	date = ? ";
			sql += " AND	start = ? ";

			// 実行SQL確認
			System.out.println(sql);

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

	        pstmt.setString(1, id);
	        pstmt.setString(2, date);
	        pstmt.setString(3, start);

			/*************************************************/

	        //レスポンス結果をrsultset rsetに格納
	        ResultSet rset = pstmt.executeQuery();

			while(rset.next()) {

				data.add(rset.getString("seats"));

			}

	        rset.close();	// ResultSetのクローズ
	        pstmt.close();	// PreparedStatementのクローズ
	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return data;
	}

	public int[] getSeatWH(String id) {

		int[] data = new int[2];

		// PreparedStatement生成
		PreparedStatement pstmt;

		try {

			//stmt = objCon.createStatement();

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/

			String sql = "";
			sql += " SELECT	seat_width, seat_height ";
			sql += " FROM  	シアターマスタ ";
			sql += " WHERE 	1 = 1 ";
			sql += " AND	theater_name = ? ";

			// 実行SQL確認
			System.out.println(sql);

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

	        pstmt.setString(1, id);

			/*************************************************/

	        //レスポンス結果をrsultset rsetに格納
	        ResultSet rset = pstmt.executeQuery();

			if (rset.next()) {

				data[0] = rset.getInt("seat_width");
				data[1] = rset.getInt("seat_height");

			}

	        rset.close();	// ResultSetのクローズ
	        pstmt.close();	// PreparedStatementのクローズ
	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return data;

	}

}
