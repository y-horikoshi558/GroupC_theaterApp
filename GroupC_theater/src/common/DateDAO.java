package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.DateBean;

public class DateDAO extends DBClass {

	public List<DateBean> getDate(String id) {

		List<DateBean> data = new ArrayList<DateBean>();

		// PreparedStatement生成
		PreparedStatement pstmt;

		try {

			//stmt = objCon.createStatement();

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/

			String sql = "";
			sql += " SELECT	date, start, theater ";
			sql += " FROM  	時間管理";
			sql += " WHERE	title_id = ? ";

			// 実行SQL確認
			System.out.println(sql);

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

			pstmt.setString(1, id);

			/*************************************************/

			//レスポンス結果をrsultset rsetに格納
			ResultSet rset = pstmt.executeQuery();

			while(rset.next()) {

				DateBean dBean = new DateBean();

				dBean.setDate(rset.getString("date"));
				dBean.setTime(rset.getString("start"));
				dBean.setScreen(rset.getString("theater"));

				// リストに追加
	        	data.add(dBean);
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
