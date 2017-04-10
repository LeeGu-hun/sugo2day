package member.login;

public class LoginCommand {
	// 로그인을 하려면 필요한 요청 값
	// 아이디 : email, 암호 : password, 쿠키여부 : rmbEmail
	
	private String email;
	private String password;
	private boolean rmbEmail;
	
	// Getter and Setter 생성
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRmbEmail() {
		return rmbEmail;
	}
	public void setRmbEmail(boolean rmbEmail) {
		this.rmbEmail = rmbEmail;
	}

}
