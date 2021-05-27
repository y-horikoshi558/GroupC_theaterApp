package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MovieDetailsBean;

public class MovieDetailsDAO extends DBClass {

	public List<MovieDetailsBean> getMDBean(String id)
	{
		List<MovieDetailsBean> data = new ArrayList<MovieDetailsBean>();

		//PreparedStatementを生成
		PreparedStatement pstmt;

		try {

			//データベースに接続
			dbOpen();

			//ユーザーデータを持ってくるSQLクエリを設定
			/*************************************************/


			String sql = "";
			sql += " SELECT	MM.title_name, MDM.* ";
			sql += " FROM  	映画詳細マスタ as MDM ";
			sql += " INNER JOIN ";
			sql += "		映画マスタ as MM ";
			sql += " ON" ;
			sql += " 		MDM.title_id = MM.title_id ";
			sql += " WHERE MM.title_id = ?";

			//SQLからのレスポンス結果を pstmt に格納
			pstmt = objCon.prepareStatement(sql);

			pstmt.setString(1, id);

			System.out.println(sql);


			/*************************************************/


			//レスポンス結果をrsultset rsetに格納
			ResultSet rset = pstmt.executeQuery();

			while(rset.next()) {

				// beanの利用
				MovieDetailsBean mdb  = new MovieDetailsBean();

				mdb.setTitleId(rset.getString("title_id"));
				mdb.setTitleName(rset.getString("title_name"));
				mdb.setPoster(rset.getString("poster"));
				mdb.setStory(rset.getString("story"));
				mdb.setImage1(rset.getString("image_01"));
				mdb.setImage2(rset.getString("image_02"));
				mdb.setImage3(rset.getString("image_03"));
				mdb.setImage4(rset.getString("image_04"));
				mdb.setImage5(rset.getString("image_05"));

				// リストに追加
				data.add(mdb);

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
