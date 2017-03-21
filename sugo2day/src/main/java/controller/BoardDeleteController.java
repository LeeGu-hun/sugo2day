package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.BoardBean;
import board.BoardDeleteValidator;
import dao.BoardDao;

@Controller
public class BoardDeleteController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("/board/boardDelete/{num}")
	public String boardDelete(@PathVariable("num") int num, BoardBean board, Model model) {
		model.addAttribute("board", board);
		return "board/boardDeleteForm";
	}
	
	@RequestMapping("/board/boardDeleteForm")
	public String boardDeleteForm(BoardBean board, Errors errors) {
		new BoardDeleteValidator().validate(board, errors);
		boardDao.delete(board.getNum(), board.getPass());
		return "board/boardDeleteComplete";
	}
}
