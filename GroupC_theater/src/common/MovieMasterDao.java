package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.MovieBean;

public class MovieMasterDao extends DBClass{

	public List<MovieBean> getMovieData() {

		List<MovieBean> data = new ArrayList<>();

		//PreparedStatementを生成
	    PreparedStatement pstmt;

		try {

			// DB接続
			dbOpen();

	        String sql = "";
	        sql += " SELECT TOP(3) * ";
	        sql += " FROM  映画マスタ inner join 映画詳細マスタ ";
	        sql += " ON  映画マスタ.title_id = 映画詳細マスタ.title_id ";
	        sql += " WHERE	NOT (映画マスタ.screening_start >= getdate() ";
	        sql += " AND	映画マスタ.screening_end >= getdate()) ";

	        pstmt = objCon.prepareStatement(sql);

	        // 実行SQL確認
	        System.out.println(sql);

	        // 問い合わせの実行
	        ResultSet rset = pstmt.executeQuery();

        	// 取得するフィールド:
        	// 0.title_id
        	// 1.title_name
        	// 2.screening_start
        	// 3.screening_start
        	// 4.screening_time
        	// 5.genre_id
        	// 6.poster
        	// 7.story
        	// 8.image_01-05

	        while(rset.next()) {

	        	// beanの利用
	        	MovieBean mb = new MovieBean();

	        	mb.setMovieId(rset.getString("title_id"));
	        	mb.setMovieName(rset.getString("title_name"));
	        	mb.setScreeningStart(rset.getString("screening_start"));
	        	mb.setScreeningEnd(rset.getString("screening_start"));
	        	mb.setScreeningTime(rset.getString("screening_time"));
	        	mb.setGenreId(rset.getString("genre_id"));
	        	mb.setPosterURL(rset.getString("poster"));
	        	mb.setMovieStory(rset.getString("story"));
	        	String[] images = new String[5];
	        	for(int i = 0;i < 5; i ++) {
	        		images[i] = rset.getString("image_0" + (i + 1));
	        	}
	        	mb.setMovieImages(images);

	        	// リストに追加
	        	data.add(mb);

	        }

	        rset.close();	// ResultSetのクローズ
	        pstmt.close();	// PreparedStatementのクローズ
	        dbClose();		// DBのクローズ


		} catch (SQLException e) {
			// エラー表示
			System.err.println(e.getClass().getName() + ":" + e.getMessage());
		}

		return data;
	}

}
