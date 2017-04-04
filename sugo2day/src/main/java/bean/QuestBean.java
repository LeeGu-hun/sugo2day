package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestBean {
	private Integer NUM;
	private String NAME;
	private String SUBJECT;
	private String CONTENT;
	private String PROB;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date STARTDATE;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date ENDDATE;
	private Integer DIFFICULTY;
	private int ID;
	

	public QuestBean(Integer nUM, String nAME, String sUBJECT, String cONTENT, String pROB,
			Date sTARTDATE, Date eNDDATE,Integer dIFFICULTY,int iD) {
		super();
		NUM = nUM;
		NAME = nAME;
		SUBJECT = sUBJECT;
		CONTENT = cONTENT;
		PROB = pROB;
		STARTDATE = sTARTDATE;
		ENDDATE = eNDDATE;
		DIFFICULTY = dIFFICULTY;
		ID=iD;
	}

	public QuestBean() {	}

	public Integer getNUM() {
		return NUM;
	}

	public void setNUM(Integer nUM) {
		NUM = nUM;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
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

	public String getPROB() {
		return PROB;
	}

	public void setPROB(String pROB) {
		PROB = pROB;
	}
	
	public Integer getDIFFICULTY() {
		return DIFFICULTY;
	}
	
	public void setDIFFICULTY(Integer dIFFICULTY) {
		DIFFICULTY = dIFFICULTY;
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}
	//difficulty 난이도를 추가한다.
	
}