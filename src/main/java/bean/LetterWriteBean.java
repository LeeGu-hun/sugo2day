package bean;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LetterWriteBean {
	private Integer l_num;
	private String l_writer;
	private String l_content;
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	private Date l_regdate;
	private String l_isquest;
	private String l_isprivate;
	private String l_questcate;
	
	// 기본 생성자
	public LetterWriteBean() {
		super();
	}

	public Integer getL_num() {
		return l_num;
	}

	public void setL_num(Integer l_num) {
		this.l_num = l_num;
	}

	public String getL_writer() {
		return l_writer;
	}

	public void setL_writer(String l_writer) {
		this.l_writer = l_writer;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
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

	public Date getL_regdate() {
		return l_regdate;
	}

	public void setL_regdate(Date l_regdate) {
		this.l_regdate = l_regdate;
	}

	public String getL_isquest() {
		return l_isquest;
	}

	public void setL_isquest(String l_isquest) {
		this.l_isquest = l_isquest;
	}

	public String getL_isprivate() {
		return l_isprivate;
	}

	public void setL_isprivate(String l_isprivate) {
		this.l_isprivate = l_isprivate;
	}

	public String getL_questcate() {
		return l_questcate;
	}

	public void setL_questcate(String l_questcate) {
		this.l_questcate = l_questcate;
	}
	
}
