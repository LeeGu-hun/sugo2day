package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.BoardBean;
import board.BoardValidator;
import dao.BoardDao;

@Controller
public class BoardReplyController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("board/boardReply/{num}")
	public String boardRe(@PathVariable("num") int num, Model model) {
		BoardBean board = boardDao.selectByNum(num);
		model.addAttribute("board", board);
		return "board/boardReply";
	}
	
	@RequestMapping(value="board/boardReply", method = RequestMethod.POST)
	public String boardReply(BoardBean board, Errors errors) {
		new BoardValidator().validate(board, errors);
		if(errors.hasErrors()) {
			return "board/boardReply";
		}
		
		try {
			boardDao.replyBoard(board);
			return "board/boardReplyComplete";
		} catch (Exception e) {
			e.printStackTrace();
			return "board/boardReply";
		}
	}
	

	
}
