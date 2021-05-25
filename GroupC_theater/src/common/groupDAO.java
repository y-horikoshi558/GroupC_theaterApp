package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class groupDAO extends DBClass{

	public List<GroupBean> getUserData(String id) {

		List<GroupBean> data = new ArrayList<GroupBean>();

		//Statementを生成
		//Statement stmt;

		// PreparedStatement生成
		PreparedStatement pstmt;

		try {

			//stmt = objCon.createStatement();

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/

			String sql = "";
			sql += " SELECT * ";
			sql += " FROM  料金表マスタ ";

			// 実行SQL確認
			System.out.println(sql);

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

			/*************************************************/

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

			//レスポンス結果をrsultset rsetに格納
			ResultSet rset = pstmt.executeQuery();

			while(rset.next()) {

				GroupBean ib = new GroupBean();

				ib.setId(rset.getString("group_id"));
				ib.setAge(rset.getString("age"));
				ib.setPrice(rset.getString("prace"));

				// リストに追加
	        	data.add(ib);
			}

	        rset.close();	// ResultSetのクローズ
	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return data;
	}

}
