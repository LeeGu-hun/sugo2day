package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class LetterWriteBean {
	private Integer num;
	private String writer;
	private String content;
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	private Date regdate;
	private String isquest;
	private String isprivate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate;
	private String questcate;
	
	// 기본 생성자
	public LetterWriteBean() {
		super();
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

	public MultipartFile getMultiFile() {
		return multiFile;
	}

	public void setMultiFile(MultipartFile multiFile) {
		this.multiFile = multiFile;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUpDir() {
		return upDir;
	}

	public void setUpDir(String upDir) {
		this.upDir = upDir;
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

	public void setStartdate(String startdate) {
		this.startdate = transformDate(startdate);
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = transformDate(enddate);
	}
	
	public String getQuestcate() {
		return questcate;
	}

	public void setQuestcate(String questcate) {
		this.questcate = questcate;
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
