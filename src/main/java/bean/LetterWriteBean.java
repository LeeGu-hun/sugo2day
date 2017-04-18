package bean;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LetterWriteBean {
	private Integer L_NUM;
	private String L_WRITER;
	private String L_CONTENT;
	
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	
	private Date L_REGDATE;
	private String L_ISQUEST;
	private String L_ISPRIVATE;
	private String L_QUESTCATE;
	
	// 기본 생성자
	public LetterWriteBean() {
		super();
	}

	public Integer getL_NUM() {
		return L_NUM;
	}

	public void setL_NUM(Integer l_NUM) {
		L_NUM = l_NUM;
	}

	public String getL_WRITER() {
		return L_WRITER;
	}

	public void setL_WRITER(String l_WRITER) {
		L_WRITER = l_WRITER;
	}

	public String getL_CONTENT() {
		return L_CONTENT;
	}

	public void setL_CONTENT(String l_CONTENT) {
		L_CONTENT = l_CONTENT;
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

	public Date getL_REGDATE() {
		return L_REGDATE;
	}

	public void setL_REGDATE(Date l_REGDATE) {
		L_REGDATE = l_REGDATE;
	}

	public String getL_ISQUEST() {
		return L_ISQUEST;
	}

	public void setL_ISQUEST(String l_ISQUEST) {
		L_ISQUEST = l_ISQUEST;
	}

	public String getL_ISPRIVATE() {
		return L_ISPRIVATE;
	}

	public void setL_ISPRIVATE(String l_ISPRIVATE) {
		L_ISPRIVATE = l_ISPRIVATE;
	}

	public String getL_QUESTCATE() {
		return L_QUESTCATE;
	}

	public void setL_QUESTCATE(String l_QUESTCATE) {
		L_QUESTCATE = l_QUESTCATE;
	}
	
	
	
	
}
