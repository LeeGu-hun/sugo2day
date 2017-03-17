package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.BoardBean;
import dao.BoardDao;
import exception.BoardNotFoundException;


@Controller
public class BoardDetailController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("board/boardDetail/{num}")
	public String boardDetail(@PathVariable("num") int num, Model model) {
		BoardBean board = boardDao.selectByNum(num); 
		model.addAttribute("board", board);
		
		if(board == null) {
			throw new BoardNotFoundException();
		}
		
		boardDao.setReadCountUpdate(num);
		return "board/boardDetail";
	}
	
	@ExceptionHandler(BoardNotFoundException.class)
	public String BoardNotFoundException() {
		return "board/noBoard";
	}

}
