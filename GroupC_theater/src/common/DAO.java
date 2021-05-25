package common;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.userBean;

public class DAO extends DBClass{

	public void setUser(String id, String name, String kana,String email,String pass) {



		//PreparedStatementを生成
	    PreparedStatement pstmt;

	    try {

	    	//データベースに接続
	    	dbOpen();


	    	//テスト用に日時を固定
	    	Date date = Date.valueOf("2016-01-01");

	     //ユーザーデータを持ってくるSQLクエリを設定
	     /*************************************************/


	        String sql = "";
	        sql += " INSERT  ";
	        sql += " INTO 顧客マスタ";
	        sql	+="  VALUES(";
	        sql +="	  ?,";//id
	        sql +="   ?,";//name
	        sql +="   ?,";//kananame
	        sql +="   ?,";//email
	        sql +="   ?,";//pass
	        sql +="   ?,";//birth
	        sql +="   ?,";// price
	        sql +="   ?,";// milage
	        sql +="   ?,";//rank
	        sql +="   ?,";//exsit
	        sql +="   ?";//auth
	        sql +="  )";


	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);


	        //パラメータ
	        pstmt.setString(1, id);
	        pstmt.setString(2, name);
	        pstmt.setString(3, kana);
	        pstmt.setString(4, email);
	        pstmt.setString(5, pass);
	        pstmt.setDate(6, date);
	        pstmt.setInt(7, 0);
	        pstmt.setInt(8, 0);
	        pstmt.setString(9, "R1");
	        pstmt.setInt(10, 1);
	        pstmt.setInt(11, 1);

	        pstmt.executeUpdate();
	        pstmt.close();	// PreparedStatementのクローズ


	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}


	}

	public void deleteUser(String id,String pass) {

		//PreparedStatementを生成
	    PreparedStatement pstmt;

	    try {

	    	//データベースに接続
	    	dbOpen();



	     //ユーザーデータを持ってくるSQLクエリを設定
	     /*************************************************/


	        String sql = "";
	        sql += " DELETE  ";
	        sql += " FROM 顧客マスタ";
	        sql	+="  WHERE user_id = ?";
	        sql	+="  AND user_pass = ?";



	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);


	        //パラメータ
	        pstmt.setString(1, id);
	        pstmt.setString(2, pass);

	        pstmt.executeUpdate();
	        pstmt.close();	// PreparedStatementのクローズ


	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}
	}


	public void updateUser(String email,String new_pass,String id, String origin_pass) {

		//PreparedStatementを生成
	    PreparedStatement pstmt;

	    try {

	    	//データベースに接続
	    	dbOpen();



	     //ユーザーデータを持ってくるSQLクエリを設定
	     /*************************************************/


	        String sql = "";
	        sql += " UPDATE  ";
	        sql += " 顧客マスタ";
	        sql	+="  SET";
	        sql	+="  email = ?";
	        sql	+="  ,user_pass = ?";
	        sql	+="  WHERE user_id = ?";
	        sql	+="  AND   user_pass = ?";



	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);


	        pstmt.setString(1, email);
	        pstmt.setString(2, new_pass);
	        pstmt.setString(3, id);
	        pstmt.setString(4, origin_pass);


	        pstmt.executeUpdate();
	        pstmt.close();	// PreparedStatementのクローズ


	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}
	}

	public List<userBean> getUserData(String id,String pass) {

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
	        sql += " WHERE user_id = ? ";
	        sql += " OR email = ? ";
	        sql += " and user_pass = ? ";

	        //後で変更:レコード一つを持ってくる

	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);

	        pstmt.setString(1, id);
	        pstmt.setString(2, id);
	        pstmt.setString(3, pass);

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
