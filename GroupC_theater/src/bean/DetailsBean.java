package bean;

public class DetailsBean {

	private String title_id;
	private String date;
	private String start;
	private String theater;
	private String title_name;

	public String gettitle_id() {
		return title_id;
	}
	public void setMovieId(String title_id) {
		this.title_id = title_id;
	}
	public String getdate() {
		return date;
	}
	public void setMovieDate(String date) {
		this.date = date;
	}
	public String getstart() {
		return start;
	}
	public void setMoviestart(String start) {
		this.start = start;
	}
	public String gettheater() {
		return theater;
	}
	public void setMovietheater(String theater ) {
		this.theater = theater;
	}
	public String gettitle_name() {
		return title_name;
	}
	public void setMovieName(String title_name ) {
		this.title_name = title_name;
	}

}
