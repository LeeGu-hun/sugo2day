package bean;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LetterWriteBean {
	private Integer num;
	private String writer;
	private String subject;
	private String content;
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	private Date regdate;
	private String isquest;
	private String isprivate;
	private Date startdate;
	private Date enddate;
	
	// 기본 생성자
	public LetterWriteBean() {
		super();
	}
	
	public LetterWriteBean(Integer num, String writer, String subject, String content, String fileName, Date regdate,
			String isquest, String isprivate, Date startdate, Date enddate) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.fileName = fileName;
		this.regdate = regdate;
		this.isquest = isquest;
		this.isprivate = isprivate;
		this.startdate = startdate;
		this.enddate = enddate;
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

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	
	
}
