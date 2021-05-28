package common;
import java.sql.Connection;
import java.sql.DriverManager;


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
<<<<<<< HEAD
		    String serverName = "DESKTOP-5A44TTQ\\SQLEXPRESS";	// サーバ名
=======
		    String serverName = "LAPTOP-9ULJU3DP\\SQLEXPRESS";	// サーバ名
>>>>>>> branch 'BrushUp' of https://github.com/y-horikoshi558/GroupC_theaterApp


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

}


