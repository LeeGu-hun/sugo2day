package member.register;

public class RegisterRequest {
	private String email;
	private String password;
	private String confirmPassword;
	private String name;
	private String birthday;
	private String gender;
	private boolean enterprise;

	
	public boolean isPasswordEqaulToConfirmPassword() {
		return password.equals(confirmPassword);
	}

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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public boolean isEnterprise() {
		return enterprise;
	}

	public void setEnterprise(boolean enterprise) {
		this.enterprise = enterprise;
	}
}
