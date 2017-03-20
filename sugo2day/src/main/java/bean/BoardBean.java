package bean;

import java.util.Date;

public class BoardBean {
	private int NUM;
	private String WRITER;
	private int PASS;
	private String SUBJECT;
	private String CONTENT;
	private String FILES;
	private int RE_REF;
	private int RE_LEV;
	private int RE_SEQ;
	private int READCOUNT;
	private Date REGDATE;
	
	public BoardBean() {	}

	
	public BoardBean(int nUM, String wRITER, int pASS, String sUBJECT, String cONTENT, String fILES, int rE_REF,
			int rE_LEV, int rE_SEQ, int rEADCOUNT, Date rEGDATE) {
		super();
		NUM = nUM;
		WRITER = wRITER;
		PASS = pASS;
		SUBJECT = sUBJECT;
		CONTENT = cONTENT;
		FILES = fILES;
		RE_REF = rE_REF;
		RE_LEV = rE_LEV;
		RE_SEQ = rE_SEQ;
		READCOUNT = rEADCOUNT;
		REGDATE = rEGDATE;
	}



	public int getNUM() {
		return NUM;
	}

	public void setNUM(int nUM) {
		NUM = nUM;
	}

	public String getWRITER() {
		return WRITER;
	}

	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}

	public int getPASS() {
		return PASS;
	}

	public void setPASS(int pASS) {
		PASS = pASS;
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

	public int getRE_REF() {
		return RE_REF;
	}

	public void setRE_REF(int rE_REF) {
		RE_REF = rE_REF;
	}

	public int getRE_LEV() {
		return RE_LEV;
	}


	public void setRE_LEV(int rE_LEV) {
		RE_LEV = rE_LEV;
	}


	public int getRE_SEQ() {
		return RE_SEQ;
	}

	public void setRE_SEQ(int rE_SEQ) {
		RE_SEQ = rE_SEQ;
	}

	public int getREADCOUNT() {
		return READCOUNT;
	}

	public void setREADCOUNT(int rEADCOUNT) {
		READCOUNT = rEADCOUNT;
	}

	public Date getREGDATE() {
		return REGDATE;
	}

	public void setREGDATE(Date rEGDATE) {
		REGDATE = rEGDATE;
	}

}
