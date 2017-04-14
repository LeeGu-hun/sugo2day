package bean;

import java.util.Date;

public class LetterBean {
	private Integer num;
	private String writer;
	private String content;
	private String files;
	private Date regdate;
	private String isquest;
	private String isprivate;
	private Date startdate;
	private Date enddate;
	private String questcate;
	
	// 기본 생성자
	public LetterBean() {
		super();
	}
	
	public LetterBean(Integer num, String writer, String content, String files, Date regdate,
			String isquest, String isprivate, Date startdate, Date enddate, String questcate) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.files = files;
		this.regdate = regdate;
		this.isquest = isquest;
		this.isprivate = isprivate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.questcate = questcate;
	}


	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getIsquest() {
		return isquest;
	}

	public void setIsquest(String isquest) {
		this.isquest = isquest;
	}

	public String getIsprivate() {
		return isprivate;
	}

	public void setIsprivate(String isprivate) {
		this.isprivate = isprivate;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getQuestcate() {
		return questcate;
	}

	public void setQuestcate(String questcate) {
		this.questcate = questcate;
	}
	
}
