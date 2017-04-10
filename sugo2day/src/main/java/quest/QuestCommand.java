package quest;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestCommand {
	private Integer NUM;
	private String NAME;
	private String SUBJECT;
	private String CONTENT;
	private String PROB;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date STARTDATE;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ENDDATE;
	private Integer DIFFICULTY;
		
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
	public String getPROB() {
		return PROB;
	}
	public void setPROB(String pROB) {
		PROB = pROB;
	}
	public Date getSTARTDATE() {
		return STARTDATE;
	}
	public void setSTARTDATE(String sTARTDATE) {
		STARTDATE = transformDate(sTARTDATE);
	}
	public Date getENDDATE() {
		return ENDDATE;
	}
	public void setENDDATE(String eNDDATE) {
		ENDDATE = transformDate(eNDDATE);
	}
	
	public Integer getDIFFICULTY() {
		return DIFFICULTY;
	}
	public void setDIFFICULTY(Integer dIFFICULTY) {
		DIFFICULTY = dIFFICULTY;
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
	 public Date transformDate(String date)
	    {
	        SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
	        
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
