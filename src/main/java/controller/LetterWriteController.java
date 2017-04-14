package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bean.LetterWriteBean;
import dao.LetterDao;
import member.login.AuthInfo;

@Controller
public class LetterWriteController {
	
	LetterDao letterDao;
	
	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}

	// 아 머리아프네 이거
	@RequestMapping(value = "letter/letterWrite", method=RequestMethod.GET)
	public String letterWriteGet(LetterWriteBean letter, Model model) {
		model.addAttribute("letter", letter);
		return "my/myPage";
	}
		
	// 글 작성 누를때
	@RequestMapping(value = "letter/letterWrite", method=RequestMethod.POST)
	public String letterWrite(LetterWriteBean letter, Model model, HttpSession session) {
						
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
		
		try {
			letterDao.insert(letter);
			return "redirect:/letter/myLetter";
		} catch (Exception e) {
			System.out.println("Error! = " + e);	
			return "redirect:/main";
		}
	}
	

}
