package bean;

import java.util.Date;

public class LetterBean {
	private Integer L_NUM;
	private String L_WRITER;
	private String L_CONTENT;
	private String L_FILES;
	private Date L_REGDATE;
	private String L_ISQUEST;
	private String L_ISPRIVATE;
	private String L_QUESTCATE;
	
	//기본 생성자
	public LetterBean() {
		super();
	}
		
	public LetterBean(Integer l_NUM, String l_WRITER, String l_CONTENT, String l_FILES, Date l_REGDATE,
			String l_ISQUEST, String l_ISPRIVATE, String l_QUESTCATE) {
		super();
		L_NUM = l_NUM;
		L_WRITER = l_WRITER;
		L_CONTENT = l_CONTENT;
		L_FILES = l_FILES;
		L_REGDATE = l_REGDATE;
		L_ISQUEST = l_ISQUEST;
		L_ISPRIVATE = l_ISPRIVATE;
		L_QUESTCATE = l_QUESTCATE;
	}



	public Integer getL_NUM() {
		return L_NUM;
	}
	public void setL_NUM(Integer l_NUM) {
		L_NUM = l_NUM;
	}
	public String getL_WRITER() {
		return L_WRITER;
	}
	public void setL_WRITER(String l_WRITER) {
		L_WRITER = l_WRITER;
	}
	public String getL_CONTENT() {
		return L_CONTENT;
	}
	public void setL_CONTENT(String l_CONTENT) {
		L_CONTENT = l_CONTENT;
	}
	public String getL_FILES() {
		return L_FILES;
	}
	public void setL_FILES(String l_FILES) {
		L_FILES = l_FILES;
	}
	public Date getL_REGDATE() {
		return L_REGDATE;
	}
	public void setL_REGDATE(Date l_REGDATE) {
		L_REGDATE = l_REGDATE;
	}
	public String getL_ISQUEST() {
		return L_ISQUEST;
	}
	public void setL_ISQUEST(String l_ISQUEST) {
		L_ISQUEST = l_ISQUEST;
	}
	public String getL_ISPRIVATE() {
		return L_ISPRIVATE;
	}
	public void setL_ISPRIVATE(String l_ISPRIVATE) {
		L_ISPRIVATE = l_ISPRIVATE;
	}
	public String getL_QUESTCATE() {
		return L_QUESTCATE;
	}
	public void setL_QUESTCATE(String l_QUESTCATE) {
		L_QUESTCATE = l_QUESTCATE;
	}
}
	
