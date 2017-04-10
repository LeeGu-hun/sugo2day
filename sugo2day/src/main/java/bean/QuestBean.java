package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestBean {
	private Integer NUM;
	private String WRITER;
	private String SUBJECT;
	private String CONTENT;
	private String FILES;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date STARTDATE;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date ENDDATE;
	private int ISQUEST;
	private int ISPRIVATE;
	
	
	public QuestBean(Integer nUM, String wRITER, String sUBJECT, String cONTENT, String fILES, Date sTARTDATE,
			Date eNDDATE, int iSQUEST, int iSPRIVATE) {
		super();
		NUM = nUM;
		WRITER = wRITER;
		SUBJECT = sUBJECT;
		CONTENT = cONTENT;
		FILES = fILES;
		STARTDATE = sTARTDATE;
		ENDDATE = eNDDATE;
		ISQUEST = iSQUEST;
		ISPRIVATE = iSPRIVATE;
	}
	
	public QuestBean() {
	}
	
	public Integer getNUM() {
		return NUM;
	}
	public void setNUM(Integer nUM) {
		NUM = nUM;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public Date getSTARTDATE() {
		return STARTDATE;
	}
	public void setSTARTDATE(Date sTARTDATE) {
		STARTDATE = sTARTDATE;
	}
	public Date getENDDATE() {
		return ENDDATE;
	}
	public void setENDDATE(Date eNDDATE) {
		ENDDATE = eNDDATE;
	}
	public int getISQUEST() {
		return ISQUEST;
	}
	public void setISQUEST(int iSQUEST) {
		ISQUEST = iSQUEST;
	}
	public int getISPRIVATE() {
		return ISPRIVATE;
	}
	public void setISPRIVATE(int iSPRIVATE) {
		ISPRIVATE = iSPRIVATE;
	}

	



	
	
	
	//difficulty 난이도를 추가한다.
	
}