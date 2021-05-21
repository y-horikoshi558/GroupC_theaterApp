package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class groupDAO extends DBClass{

	public void getUserData(String id) {

		//PreparedStatementを生成
	    PreparedStatement pstmt;

	    try {

	    	//データベースに接続
	    	dbOpen();

	     //ユーザーデータを持ってくるSQLクエリを設定
	     /*************************************************/


	        String sql = "";
	        sql += " SELECT user_id, user_name, user_kana, email, user_pass, total_prace, mileage, rank ";
	        sql += " FROM  顧客マスタ ";
	        sql += " WHERE user_id = ?"; //					後で変更:レコード一つを持ってくる

	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);

	        pstmt.setString(1, id);

	     /*************************************************/


	        //レスポンス結果をrsultset rsetに格納
	        ResultSet rset = pstmt.executeQuery();

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
