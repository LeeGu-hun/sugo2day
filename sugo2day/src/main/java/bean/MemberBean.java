package bean;

import java.util.Date;

public class MemberBean {
		
	private Long id;
	private String email;
	private String password;
	private String name;
	private String birthday;
	private String gender;
	private Date registerDate;
	private boolean enterprise;
	
		
	public MemberBean(String email, String password, String name, String birthday, String gender,
			Date registerDate, boolean enterprise) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.registerDate = registerDate;
		this.enterprise = enterprise;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public boolean isEnterprise() {
		return enterprise;
	}
	public void setEnterprise(boolean enterprise) {
		this.enterprise = enterprise;
	}
	
	
}
