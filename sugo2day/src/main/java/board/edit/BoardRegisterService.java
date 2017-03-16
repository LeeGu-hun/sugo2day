package board.edit;

import bean.Board;
import dao.BoardDao;

public class BoardRegisterService {
	private BoardDao boardDao;

	public BoardRegisterService(BoardDao memberDao2) {
		this.boardDao = memberDao2;
	}
	public void regist(Board board){
		Board board1 = boardDao.selectByNum(board.getBoard_num());		
		Board newboard = new Board(board.getBoard_num(), board.getBoard_writer(),board.getBoard_subject() ,board.getBoard_content(), 
				board.getBoard_file(), board.getBoard_re_ref(),board.getBoard_re_ref() ,board.getBoard_re_seq(), 0, null);
		boardDao.insert(newboard);
	}
}
