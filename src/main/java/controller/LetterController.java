package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import bean.LetterBean;
import bean.LetterWriteBean;
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
	public String letterWriteGet(LetterWriteBean letter, Model model) {
		model.addAttribute("letter", letter);
		return "my/myList";
	}
		
	// 글 작성 누를때
	@RequestMapping(value = "letter/letterWrite", method=RequestMethod.POST)
	public String letterWrite(LetterWriteBean letter, Errors errors, Model model, HttpSession session) {
		System.out.println(letter.getStartdate() + " = startDate");
		System.out.println(letter.getEnddate() + " = endDate");
		
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
		return "redirect:/letter/myLetter";
	}
	

	// 전체 글 목록보기
	@RequestMapping(value="letter/myLetter", method=RequestMethod.GET)
	public String selectDefault(LetterWriteBean Wletter, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		LetterBean letter = new LetterBean();
		letter.setWriter(authInfo.getName());
		String writer = letter.getWriter();

		System.out.println("letter/myLetter Get type : writer = " + writer);
					
		List<LetterBean> letters = letterDao.selectAll(writer);
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
	// 퀘스트 글 목록보기
	@RequestMapping(value="letter/myQuest", method=RequestMethod.POST)
	public String selectAll(LetterWriteBean Wletter, String isquest, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		LetterBean letter = new LetterBean();
		letter.setWriter(authInfo.getName());
		String writer = letter.getWriter();
				
		System.out.println("letter/myLetter POST type : writer = " + letter.getWriter());
		System.out.println("letter/myLetter POST type : isquest = " + letter.getIsquest());

		List<LetterBean> letters = letterDao.selectQuest(letter);
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
	
}	