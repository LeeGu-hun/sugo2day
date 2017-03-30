package board;

import dao.BoardDao;
import exception.BoardNotFoundException;

public class BoardWriterCheck {
	String writer;
	BoardDao boardDao;
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public void match(int num, String writer) {
		int result = boardDao.checkWriter(num, writer);
		if(result == 0) {
			throw new BoardNotFoundException();  
		} else if(result == 1) {
			boardDao.delete(num, writer);
		}
	}

	public void matchMod(int num, String writer) {
		int result = boardDao.checkWriter(num, writer);
		if(result == 0) {
			throw new BoardNotFoundException();
		} 
	}
		

}
