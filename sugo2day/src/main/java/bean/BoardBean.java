package bean;

import java.util.Date;

public class BoardBean {
	private int num;
	private String writer;
	private int pass;
	private String subject;
	private String content;
	private String files;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private int readcount;
	private Date regdate;
	
	public BoardBean() {	}

	public BoardBean(int num, String writer, int pass, String subject, String content, String files, int re_ref,
			int re_lev, int re_seq, int readcount, Date regdate) {
		this.num = num;
		this.writer = writer;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
		this.files = files;
		this.re_ref = re_ref;
		this.re_lev = re_lev;
		this.re_seq = re_seq;
		this.readcount = readcount;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
