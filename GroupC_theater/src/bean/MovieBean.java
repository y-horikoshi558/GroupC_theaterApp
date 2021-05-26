package bean;

public class MovieBean {

	// フィールド:
	// 0.title_id
	// 1.title_name
	// 2.screening_start
	// 3.screening_end
	// 4.screening_time
	// 5.genre_id
	// 6.poster
	// 7.story
	// 8.image_01-05

	// 映画ID
	private String movieId;

	// タイトル
	private String movieName;

	//上映開始
	private String screening_start;

	//上映終了
	private String screening_end;

	//上映時間
	private String screening_time;

	//ジャンルID
	private String genre_id;

	// ポスター画像URL
	private String poster_url;

	//概要
	private String story;

	//画像url
	private String[] images = new String [5];

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getScreeningStart() {
		return screening_start;
	}

	public void setScreeningStart(String screening_Start) {
		this.screening_start = screening_Start;
	}

	public String getScreeningEnd() {
		return screening_end;
	}

	public void setScreeningEnd(String screening_End) {
		this.screening_end = screening_End;
	}

	public String getScreeningTime() {
		return screening_time;
	}

	public void setScreeningTime(String screeningTime) {
		this.screening_time =screeningTime;
	}

	public String getGenreId() {
		return genre_id;
	}

	public void setGenreId(String genreID) {
		this.genre_id = genreID;
	}

	public String getPosterURL() {
		return poster_url;
	}

	public void setPosterURL(String posterURL) {
		this.poster_url = posterURL;
	}

	public String getMovieStory() {
		return story;
	}

	public void setMovieStory(String movieStory) {
		this.story = movieStory;
	}

	public String[] getMovieImages() {
		return images;
	}

	public void setMovieImages(String[] Images) {
		for(int i=0; i < 5; i++) {
			this.images[i] = Images[i];
		}
	}
}
