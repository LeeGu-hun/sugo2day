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
public class BoardDeleteController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@RequestMapping("/board/boardDelete/{num}")
	public String boardDeleteForm(@PathVariable("num") int num, Model model) {
		BoardBean board = boardDao.selectByNum(num);
		model.addAttribute("board", board);
		return "board/boardDeleteForm";
	}

	@RequestMapping(value = "/board/boardDeleteSuccess", method = RequestMethod.POST)
	public String boardDelete(BoardBean board, int num, int pass, Model model, Errors errors) {
		BoardBean boards = boardDao.selectByNum(num);
		model.addAttribute(boards);
		new BoardValidator().validate(board, errors);
		if (errors.hasErrors()) {
			return "board/boardDeleteForm";
		}

		try {
			boardDao.delete(num, pass);
			return "board/boaddDeleteComplete";
		} catch (Exception e) {
			e.printStackTrace();
			return "board/boardDelteForm";
		}

	}

}
