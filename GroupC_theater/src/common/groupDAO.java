package common;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class groupDAO extends DBClass{

	public List<GroupBean> getUserData(String id) {

		List<GroupBean> data = new ArrayList<GroupBean>();

		//Statementを生成
		Statement stmt;
		try {

			stmt = objCon.createStatement();

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/

			String sql = "";
			sql += " SELECT * ";
			sql += " FROM  料金表マスタ ";

			// 実行SQL確認
			System.out.println(sql);

			/*************************************************/

			// 問い合わせの実行
			ResultSet rset = stmt.executeQuery(sql);

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
