package bean;

import java.util.Date;

public class JoinBean {
	private Integer l_num;
	private String l_writer;
	private String l_content;
	private String l_files;
	private Date l_regdate;
	private String l_isquest;
	private String l_isprivate;
	private String l_questcate;
	private Integer q_num;
	private String q_title;
	private String q_descript;
	private Date q_startdate;
	private Date q_enddate;
	private String q_isprivate;
	private String q_writer;
	
	public JoinBean() {
		super();
	}

	public JoinBean(Integer l_num, String l_writer, String l_content, String l_files, Date l_regdate, String l_isquest,
			String l_isprivate, String l_questcate, Integer q_num, String q_title, String q_descript, Date q_startdate,
			Date q_enddate, String q_isprivate, String q_writer) {
		super();
		this.l_num = l_num;
		this.l_writer = l_writer;
		this.l_content = l_content;
		this.l_files = l_files;
		this.l_regdate = l_regdate;
		this.l_isquest = l_isquest;
		this.l_isprivate = l_isprivate;
		this.l_questcate = l_questcate;
		this.q_num = q_num;
		this.q_title = q_title;
		this.q_descript = q_descript;
		this.q_startdate = q_startdate;
		this.q_enddate = q_enddate;
		this.q_isprivate = q_isprivate;
		this.q_writer = q_writer;
	}

	public Integer getL_num() {
		return l_num;
	}

	public void setL_num(Integer l_num) {
		this.l_num = l_num;
	}

	public String getL_writer() {
		return l_writer;
	}

	public void setL_writer(String l_writer) {
		this.l_writer = l_writer;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
	}

	public String getL_files() {
		return l_files;
	}

	public void setL_files(String l_files) {
		this.l_files = l_files;
	}

	public Date getL_regdate() {
		return l_regdate;
	}

	public void setL_regdate(Date l_regdate) {
		this.l_regdate = l_regdate;
	}

	public String getL_isquest() {
		return l_isquest;
	}

	public void setL_isquest(String l_isquest) {
		this.l_isquest = l_isquest;
	}

	public String getL_isprivate() {
		return l_isprivate;
	}

	public void setL_isprivate(String l_isprivate) {
		this.l_isprivate = l_isprivate;
	}

	public String getL_questcate() {
		return l_questcate;
	}

	public void setL_questcate(String l_questcate) {
		this.l_questcate = l_questcate;
	}

	public Integer getQ_num() {
		return q_num;
	}

	public void setQ_num(Integer q_num) {
		this.q_num = q_num;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_descript() {
		return q_descript;
	}

	public void setQ_descript(String q_descript) {
		this.q_descript = q_descript;
	}

	public Date getQ_startdate() {
		return q_startdate;
	}

	public void setQ_startdate(Date q_startdate) {
		this.q_startdate = q_startdate;
	}

	public Date getQ_enddate() {
		return q_enddate;
	}

	public void setQ_enddate(Date q_enddate) {
		this.q_enddate = q_enddate;
	}

	public String getQ_isprivate() {
		return q_isprivate;
	}

	public void setQ_isprivate(String q_isprivate) {
		this.q_isprivate = q_isprivate;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	
}
