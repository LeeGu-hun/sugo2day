package member.login;

// 로그인 성공 후, 인증 상태 정보를 세션에 보관
public class AuthInfo {
	
	private int id;
	private String email;
	private String name;
	

	public AuthInfo(int id, String email, String name) {
		this.id = id;
		this.email = email;
		this.name = name;
	}
	
	
	public int getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getName() {
		return name;
	}
	
}
