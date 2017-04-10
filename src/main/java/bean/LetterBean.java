package bean;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LetterBean {
	private int num;
	private String writer;
	private String subject;
	private String Content;
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	private Date startdate;
	private Date enddate;
	private int isquest;
	private int isprivate;
	
	// 기본 생성자
	public LetterBean() {
		super();
	}
	
	
	public LetterBean(int num, String writer, String subject, String content, String fileName, Date startdate,
			Date enddate, int isquest, int isprivate) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		Content = content;
		this.fileName = fileName;
		this.startdate = startdate;
		this.enddate = enddate;
		this.isquest = isquest;
		this.isprivate = isprivate;
	}


	// getter & setter
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
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return Content;
	}
	
	public void setContent(String content) {
		Content = content;
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
	
	public int getIsquest() {
		return isquest;
	}
	
	public void setIsquest(int isquest) {
		this.isquest = isquest;
	}
	
	public int getIsprivate() {
		return isprivate;
	}
	
	public void setIsprivate(int isprivate) {
		this.isprivate = isprivate;
	}
	
}
