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
public class BoardModifyController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("board/boardModify/{num}")
	public String boardMod(@PathVariable("num") int num, BoardBean board, Model model) {
		model.addAttribute("board", board);
		return "board/boardModifyForm";
	}
	
	@RequestMapping(value="board/boardModify", method=RequestMethod.POST)
	public String boardModify(BoardBean board, Errors errors) {
		new BoardValidator().validate(board, errors);
		
		if(errors.hasErrors()) {
			return "board/boardModifyForm";
		}
		boardDao.update(board);
		return "board/boardModifyComplete";
	}
}
