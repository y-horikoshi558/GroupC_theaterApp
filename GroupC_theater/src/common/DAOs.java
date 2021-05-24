package common;

import java.sql.Date;
import java.sql.PreparedStatement;

public class DAOs extends DBClass{

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


	public void updateUser(String email,String id,String pass) {

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
	        sql	+="  WHERE user_id = ?";
	        sql	+="  AND   user_pass = ?";


	        System.out.println(sql);


	        //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);


	        pstmt.setString(1, email);
	        pstmt.setString(2, id);
	        pstmt.setString(3, pass);


	        pstmt.executeUpdate();
	        pstmt.close();	// PreparedStatementのクローズ


	        dbClose();		//

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}
	}




}
