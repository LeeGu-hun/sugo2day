package bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

public class LetterBean {
	private Integer num;
	private String writer;
	private String subject;
	private String content;
	private String files;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date startdate;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date enddate;
	private String isquest;
	private String isprivate;
	private String showQ;
	
	// 기본 생성자
	public LetterBean() {
		super();
	}
	
	public LetterBean(Integer num, String writer, String subject, String content, String files, Date startdate,
			Date enddate, String isquest, String isprivate) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.files = files;
		this.startdate = startdate;
		this.enddate = enddate;
		this.isquest = isquest;
		this.isprivate = isprivate;
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

	public String getShowQ() {
		return showQ;
	}

	public void setShowQ(String showQ) {
		this.showQ = showQ;
	}

	
	public Date transDate(Date d, String times){
		if(d != null){
			SimpleDateFormat transFormat; 
			transFormat = new SimpleDateFormat("yyyyMMdd");
			String toWord = transFormat.format(d) + times;
			transFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			try { d = (Date) transFormat.parse(toWord);
			} catch (Exception e) { e.printStackTrace(); }
		}
		return d;
	}
	
	//날짜 chan
	public Date transformDate(String date) {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
        
        java.util.Date tempDate;
        Date d;
        
        try {
            tempDate = beforeFormat.parse(date);
            String transDate = afterFormat.format(tempDate);
            d = Date.valueOf(transDate);
            return d;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
	}
	
}
