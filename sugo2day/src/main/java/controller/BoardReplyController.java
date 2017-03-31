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
import dao.BoardDao;
import member.login.AuthInfo;

@Controller
public class BoardReplyController {
	BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("board/boardReply/{num}")
	public String boardRe(@PathVariable("num") Integer num, BoardBean board, Model model) {
		board = boardDao.selectByNum(num);
		model.addAttribute("board", board);
		return "board/boardReplyForm";
	}
	
	@RequestMapping(value="board/boardReply", method = RequestMethod.POST)
	public String boardReply(BoardBean board, Errors errors, HttpSession session, Model model) {
		new BoardValidator().validate(board, errors);
		if(errors.hasErrors()) {
			model.addAttribute("board", board);
			return "board/boardFail";
		}
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		board.setWriter(authInfo.getName());
		
		boardDao.replyBoard(board);
		return "board/boardReplyComplete";
	}
}
