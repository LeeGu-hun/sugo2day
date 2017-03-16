package board.edit;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private Long board_writer;
	private String board_subject;
	private String board_content;
	private MultipartFile board_multiFile;
	private List<MultipartFile> board_files;
	private String board_fileName;
	private String board_upDir;
	
	public Long getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(Long board_writer) {
		this.board_writer = board_writer;
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
	public MultipartFile getBoard_multiFile() {
		return board_multiFile;
	}
	public void setBoard_multiFile(MultipartFile board_multiFile) {
		this.board_multiFile = board_multiFile;
	}
	public List<MultipartFile> getBoard_files() {
		return board_files;
	}
	public void setBoard_files(List<MultipartFile> board_files) {
		this.board_files = board_files;
	}
	public String getBoard_fileName() {
		return board_fileName;
	}
	public void setBoard_fileName(String board_fileName) {
		this.board_fileName = board_fileName;
	}
	public String getBoard_upDir() {
		return board_upDir;
	}
	public void setBoard_upDir(String board_upDir) {
		this.board_upDir = board_upDir;
	}
	
}