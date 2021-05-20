package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class DBClass {

	// DB接続用コネクション
	Connection objCon;

	// 接続文字列
	String connUrl = "";

	public DBClass() {
		try {
		    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		    // フェッチ後はそれぞれの名前に変更
		    // コミット前に空にしておくこと
		    String serverName = "POCHI\\SQLEXPRESS";	// サーバ名
		    String dbName = "GroupC";						// データベース名

		    String userName = "sa";							// ユーザ名
		    String password = "Step2154822";				// パスワード

		    connUrl = "jdbc:sqlserver://" + serverName + ";";
		    connUrl += "database=" + dbName + ";";
		    connUrl += "integratedSecurity=false;";
		    connUrl += "user=" + userName + ";";
		    connUrl += "password=" + password + ";";

		}
		catch(Exception objEx) {
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());
		}
	}

	/**
	 * DB接続処理
	 *
	 * @return 接続結果（true:接続成功、false：接続失敗）
	 */
	public boolean dbOpen() {
		try {

		    // 接続開始
			objCon =DriverManager.getConnection(connUrl);

			System.out.println("DB接続成功");

		    // 接続成功
		    return true;
		}
		catch(Exception objEx) {
			// エラー表示
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

			// 接続失敗
			return false;
		}
	}

	/**
	 * DB切断処理
	 *
	 * @return 切断結果（true:切断成功、false：切断失敗）
	 */
	public boolean dbClose() {
		try {

		    // 切断開始
			objCon.close();

			System.out.println("DB切断成功");

		    // 切断成功
		    return true;
		}
		catch(Exception objEx) {
			// エラー表示
			System.err.println(objEx.getClass().getName() + ":" + objEx.getMessage());

			// 切断失敗
			return false;
		}
	}


	/**
	 * 映画の詳細情報の取得
	 *
	 * @param id
	 *           	映画のタイトルID
	 *
	 * @return 詳細情報リスト
	 */
	public ArrayList<String[]> getSyainData(String id){

		ArrayList<String[]> data = new ArrayList<String[]>();

		//Statementを生成
	    Statement stmt;

		try {

			stmt = objCon.createStatement();

	        String sql = "";
	        sql += " SELECT * ";
	        sql += " FROM   映画詳細 ";
	        sql += " title_id = '" + id + "'";

	        // 実行SQL確認
	        System.out.println(sql);

	        // 問い合わせの実行
	        ResultSet rset = stmt.executeQuery(sql);

	        while(rset.next()) {

	        	// 取得するフィールド分の配列生成
	        	String[] strData = new String[7];

	        	strData[0] =rset.getString("poster");
	        	strData[1] =rset.getString("story");
	        	strData[2] =rset.getString("image_01");
	        	strData[3] =rset.getString("image_02");
	        	strData[4] =rset.getString("image_03");
	        	strData[5] =rset.getString("image_04");
	        	strData[6] =rset.getString("image_05");

	        	// リストに追加
	        	data.add(strData);

	        }

	        rset.close();	// ResultSetのクローズ
	        stmt.close();	// Statementのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return data;
	}

	/**
	 * 社員情報更新処理
	 *
	 * @param id
	 *            社員ID
	 * @param name
	 *            社員名（漢字）
	 * @param kana
	 *            社員名（フリガナ）
	 * @param birth
	 *            生年月日
	 * @param ken
	 *            都道府県
	 * @param sei
	 *            性別（M,F）
	 *
	 * @return 更新件数
	 */
	public int updSyainData(String id, String name, String kana, String birth, String ken, String sei){

		// 実行結果件数用変数
		int retCount = 0;

		//Statementを生成
	    Statement stmt;

		try {

			stmt = objCon.createStatement();

	        String sql = "";
	        sql += " UPDATE 社員マスタ  ";
	        sql += " SET 氏名 = '"+ name + "' ,";
	        sql += "     フリガナ = '"+ kana + "' ,";
	        sql += "     生年月日 = '"+ birth + "' ,";
	        sql += "     都道府県 = '"+ ken + "' ,";
	        sql += "     性別 = '"+ sei + "'";

	        sql += " WHERE  社員ID = '"+ id +"'";

	        // 実行SQL確認
	        System.out.println(sql);

	        // 問い合わせの実行
	        retCount = stmt.executeUpdate(sql);

	        stmt.close();	// Statementのクローズ

		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return retCount;
	}

}
