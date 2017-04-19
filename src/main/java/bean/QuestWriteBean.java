package bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestWriteBean {
	private Integer q_num;
	private String q_title;
	private String q_descript;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date q_startdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date q_enddate;
	private String q_isprivate;
	private String q_writer;
	
	
	public QuestWriteBean() {
		super();
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

	public void setQ_startdate(String q_startdate) {
		this.q_startdate = transformDate(q_startdate);
	}

	public Date getQ_enddate() {
		return q_enddate;
	}

	public void setQ_enddate(String q_enddate) {
		this.q_enddate = transformDate(q_enddate);
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

	
	public Date transformDate(String date) {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy.mm.dd");
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
        java.util.Date tempDate = null;
        
        try {
        	tempDate = beforeFormat.parse(date);
        } catch (ParseException e) {
        	e.printStackTrace();
        }
       
        String transDate = afterFormat.format(tempDate);
    	Date d = Date.valueOf(transDate);
              
        return d;
        
    }
	
}
