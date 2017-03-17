package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import board.BoardCommand;
import board.BoardCommandValidator;
import dao.BoardDao;
import member.login.AuthInfo;

@Controller
public class BoardWriteController {
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@RequestMapping(value = "board/boardWrite", method=RequestMethod.GET)
	public String boardWriteGet(BoardCommand boardCommand, Model model) {
		model.addAttribute("board", boardCommand);
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "board/boardWrite", method=RequestMethod.POST)
	public String boardWrite(BoardCommand boardCommand, Errors errors, Model model, HttpSession session) {
		new BoardCommandValidator().validate(boardCommand, errors);
		if(errors.hasErrors()) {
			return "board/boardWrite";
		}
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		boardCommand.setBoard_writer(authInfo.getId());
		System.out.println(boardCommand.getBoard_subject() + " // Command 객체 저장된 subject");		
		MultipartFile multi = boardCommand.getMultiFile();
		String newFileName = "";
		// 파일이 많을 경우 업로드 파일 리스트
		// List<MultipartFile> files = boardCommand.getFiles();
		
		if(!multi.isEmpty()) {
			System.out.println("If 타느냐");
			String fileName = multi.getOriginalFilename();
			// 파일명이 중복되지 않게 파일명에 시간 추가
			newFileName = System.currentTimeMillis() + "_" + fileName;
			boardCommand.setFileName(newFileName);
						
			String path = boardCommand.getUpDir() + newFileName;
			
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		boardDao.insert(boardCommand);
		return "redirect:/board/boardList";
		
	}
	
}
