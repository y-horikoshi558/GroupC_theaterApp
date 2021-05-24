package common;

import java.sql.ResultSet;
import java.sql.Statement;

public class groupDAO extends DBClass{

	public void getUserData(String id) {

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

	        System.out.println(sql);

	        /*************************************************/

	        // 実行SQL確認
	        System.out.println(sql);

	        // 問い合わせの実行
	        ResultSet rset = stmt.executeQuery(sql);

	        while(rset.next()) {

      	// beanの利用
	        	userBean ib = new userBean();

	        	ib.setUserId(rset.getString("user_id"));
	        	ib.setUserName(rset.getString("user_name"));
	        	ib.setUserKana(rset.getString("user_kana"));
	        	ib.setuEmail(rset.getString("email"));
	        	ib.setuPass(rset.getString("user_pass"));
	        	ib.setTotal_price(rset.getString("total_prace"));
	        	ib.setRank(rset.getString("rank"));
	        	ib.setMileage(rset.getInt("mileage"));


	        }


	        rset.close();	// ResultSetのクローズ
	        pstmt.close();	// PreparedStatementのクローズ
	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}


	}

}
