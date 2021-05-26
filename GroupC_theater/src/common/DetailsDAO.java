package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.DetailsBean;

public class DetailsDAO extends DBClass{

	public List<DetailsBean> getSilyosaiData() {

		List<DetailsBean> data = new ArrayList<>();

		//PreparedStatementを生成
	    PreparedStatement pstmt;

	    try {

	    	//データベースに接続
	    	dbOpen();

	     //ユーザーデータを持ってくるSQLクエリを設定
	     /*************************************************/


	        String sql = "";
	        sql += " SELECT title_id,date,start,theater,title_name";
	        sql += " FROM  時間管理 inner join 映画マスタ";
	        sql += " WHERE 時間管理.title_id ";
	        sql += " AND  映画マスタ.title_name ";


	      //SQLからのレスポンス結果を pstmt に格納
	        pstmt = objCon.prepareStatement(sql);


	        System.out.println(sql);


	     /*************************************************/


	        //レスポンス結果をrsultset rsetに格納
	        ResultSet rset = pstmt.executeQuery();

	        while(rset.next()) {

      	// beanの利用
	        	DetailsBean mb  = new DetailsBean();

	            mb.setMovieId(rset.getString("title_id"));
	        	mb.setMovieDate(rset.getString("date"));
	        	mb.setMoviestart(rset.getString("start"));
	        	mb.setMovietheater(rset.getString("theater"));
	        	mb.setMovieName(rset.getString("title_name"));


	        	// リストに追加
	        	data.add(mb);

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

