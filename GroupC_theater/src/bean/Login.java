package bean;

public class Login implements java.io.Serializable{

	private String user_id;
	private String email;
	private String user_pass;

	public String getuser_id() {
		return user_id;
	}

	public String getemail() {
		return email;
	}

	public String getuser_pass() {
			return user_pass;
	}

	public void setuser_id(String user_id) {
		this.user_id=user_id;
	}

	public void setemail(String email) {
		this.email=email;
	}

	public void setuser_pass(String user_pass) {
		this.user_pass=user_pass;
	}
}
