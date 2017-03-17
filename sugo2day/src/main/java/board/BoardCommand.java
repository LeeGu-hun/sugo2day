package board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private Long board_writer;
	private int board_pass;
	private String board_subject;
	private String board_content;
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	
		
	public Long getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(Long board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_pass() {
		return board_pass;
	}
	public void setBoard_pass(int board_pass) {
		this.board_pass = board_pass;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
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

}