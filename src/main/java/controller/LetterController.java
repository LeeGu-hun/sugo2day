package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.LetterBean;
import dao.LetterDao;
import letter.LetterBeanValidator;
import member.login.AuthInfo;

@Controller
public class LetterController {
	private LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	
	// 아 머리아프네 이거
	@RequestMapping(value = "letter/letterWrite", method=RequestMethod.GET)
	public String letterWriteGet(LetterBean letter, Model model) {
		model.addAttribute("letter", letter);
		return "my/myList";
	}
		
	// 글 작성 누를때
	@RequestMapping(value = "letter/letterRegist", method=RequestMethod.POST)
	public String letterWrite(LetterBean letter, Errors errors, Model model, HttpSession session) {
				
		new LetterBeanValidator().validate(letter, errors);
		if(errors.hasErrors()) {
			return "letter/letterWrite";
		}
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setWriter(authInfo.getName());
		
		MultipartFile multi = letter.getMultiFile();
		String newFileName = "";
		// 파일이 많을 경우 업로드 파일 리스트
		// List<MultipartFile> files = boardCommand.getFiles();
		
		if(!multi.isEmpty()) {
			String fileName = multi.getOriginalFilename();
			// 파일명이 중복되지 않게 파일명에 시간 추가
			newFileName = System.currentTimeMillis() + "_" + fileName;
			letter.setFileName(newFileName);
						
			String path = letter.getUpDir() + newFileName;
			
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		letterDao.insert(letter);
		return "redirect:/letter/letterWrite";
	}
	

	// 전체 글 목록보기
	@RequestMapping("letter/myLetter")
	public String selectAll(LetterBean letters, Model model) {
		List<LetterBean> letter = letterDao.selectAll();
		model.addAttribute("letter", letter);
				
		return "letter/letterWrite";
	}
	
	// 퀘스트 글만 보기
	@RequestMapping("letter/myQuest")
	public String selectQuest(LetterBean letters, Model model) {
		List<LetterBean> letter = letterDao.selectQuest();
		model.addAttribute("letter", letter);
		
		return "letter/letterWrite";
	}
	
}	