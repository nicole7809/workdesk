package workdesk.member.model;

import java.sql.Timestamp;

public class SignDataBean {
	private String id;
	private Timestamp signin;
	private Timestamp signout;
	private String name;
	private String attend_status;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttend_status() {
		return attend_status;
	}
	


	public void setAttend_status(String attend_status) {
		this.attend_status = attend_status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getSignin() {
		return signin;
	}

	public void setSignin(Timestamp signin) {
		this.signin = signin;
	}

	public Timestamp getSignout() {
		return signout;
	}

	public void setSignout(Timestamp signout) {
		this.signout = signout;
	}

	
	


}
