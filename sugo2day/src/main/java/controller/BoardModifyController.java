package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.BoardBean;
import board.BoardValidator;
import board.BoardWriterCheck;
import dao.BoardDao;
import exception.BoardNotFoundException;
import member.login.AuthInfo;

@Controller
public class BoardModifyController {
	BoardWriterCheck boardWriterCheck;
	BoardDao boardDao;

	
	public void setBoardWriterCheck(BoardWriterCheck boardWriterCheck) {
		this.boardWriterCheck = boardWriterCheck;
	}

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("board/boardModify/{num}")
	public String boardMod(@PathVariable("num") Integer num, BoardBean board, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		boardWriterCheck.setWriter(authInfo.getName());
				
		try {
			boardWriterCheck.matchMod(num, boardWriterCheck.getWriter());
			model.addAttribute("board", board);
			return "board/boardModifyForm";
		} catch (BoardNotFoundException e) {
			e.printStackTrace();
			return "board/boardCheckFail";
		}
	}
	
	@RequestMapping(value="board/boardModifyAct", method=RequestMethod.POST)
	public String boardModify(BoardBean board, Errors errors, Model model) {
		new BoardValidator().validate(board, errors);
		
		if(errors.hasErrors()) {
			model.addAttribute("board", board);
			return "board/boardFail";
		}
		
		boardDao.update(board);
		return "board/boardModifyComplete";	
		
	}
}
