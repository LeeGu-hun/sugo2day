package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.BoardBean;
import board.BoardDeleteValidator;
import dao.BoardDao;
import exception.PasswordWrongException;

@Controller
public class BoardDeleteController {
	private BoardDao boardDao;
	int chkNum;
	int chkPass;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@RequestMapping("board/boardDelete/{num}")
	public String boardDelete(@PathVariable("num") int num, BoardBean board, Model model) {
		model.addAttribute("board", board);
		return "board/boardDeleteForm";
	}
	
	@RequestMapping("board/boardDeleteSuccess")
	public String boardDeleteSuccess(int num, int pass, BoardBean board, Model model, Errors errors) {
		model.addAttribute("board", board);
		new BoardDeleteValidator().validate(board, errors);
		
		if(errors.hasErrors()) {
			return "board/boardDeleteForm";
		}
		
		try {
			boardDao.delete(num, pass);
			return "board/boardDeleteComplete";
		} catch(PasswordWrongException e) {
			errors.reject("passwordWrong");
			return "board/boardDeleteForm";
		}
	}	
}
