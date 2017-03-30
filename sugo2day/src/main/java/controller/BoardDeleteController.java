package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardWriterCheck;
import dao.BoardDao;
import exception.BoardNotFoundException;
import member.login.AuthInfo;

@Controller
public class BoardDeleteController {
	BoardWriterCheck boardWriterCheck;
	
	public void setBoardWriterCheck(BoardWriterCheck boardWriterCheck) {
		this.boardWriterCheck = boardWriterCheck;
	}

	@RequestMapping("board/boardDelete/{num}")
	public String boardDelete(@PathVariable("num") int num, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		boardWriterCheck.setWriter(authInfo.getName());
		
		try {
			boardWriterCheck.match(num, boardWriterCheck.getWriter());
			return "board/boardDeleteComplete";
		} catch (BoardNotFoundException e) {
			e.printStackTrace();
			return "board/boardCheckFail";
		}
	}
	
	
}
