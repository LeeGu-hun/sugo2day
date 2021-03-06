package bean;

import java.sql.Date;

public class QuestBean {
	private Integer q_num;
	private String q_title;
	private String q_descript;
	private Date q_startdate;
	private Date q_enddate;
	private String q_isprivate;
	private String q_writer;
	
	
	public QuestBean() {
		super();
	}

	public QuestBean(Integer q_num, String q_title, String q_descript, Date q_startdate, Date q_enddate,
			String q_isprivate, String q_writer) {
		super();
		this.q_num = q_num;
		this.q_title = q_title;
		this.q_descript = q_descript;
		this.q_startdate = q_startdate;
		this.q_enddate = q_enddate;
		this.q_isprivate = q_isprivate;
		this.q_writer = q_writer;
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
