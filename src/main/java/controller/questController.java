package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.LetterBean;
import bean.LetterWriteBean;
import dao.LetterDao;
import member.login.AuthInfo;

@Controller
public class questController {
	private LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	// 전체 글 목록보기
	@RequestMapping(value="letter/myLetter", method=RequestMethod.GET)
	public String selectDefault(LetterWriteBean Wletter, Model model, HttpSession session) {
		LetterBean letter = new LetterBean();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_WRITER(authInfo.getName());
							
		List<LetterBean> letters = letterDao.selectAll(letter.getL_WRITER());
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
	// 일반글 목록보기
	@RequestMapping(value="letter/myLetterN", method=RequestMethod.GET)
	public String selectNormal(LetterWriteBean Wletter, Model model, HttpSession session){
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_WRITER(authInfo.getName());
		
		List<LetterBean> letters = letterDao.selectNormal(letter.getL_WRITER());
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
		
}	