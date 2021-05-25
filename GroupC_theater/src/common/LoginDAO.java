package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.userBean;

public class LoginDAO extends DBClass{

	public List<userBean> getLogin(String id ,String pass) {

		List<userBean> data = new ArrayList<>();

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
	        sql += " AND user_pass = ?";

	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);

	        pstmt.setString(1, id);
	        pstmt.setString(2, pass);

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


	        	// リストに追加
	        	data.add(ib);

	        }


	        rset.close();	// ResultSetのクローズ
	        pstmt.close();	// PreparedStatementのクローズ
	        dbOpen();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}




		return data;
	}

}
