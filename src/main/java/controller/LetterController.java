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
public class LetterController {
	private LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	// 전체 글 목록보기
	@RequestMapping(value="letter/myLetter", method=RequestMethod.GET)
	public String selectDefault(LetterWriteBean Wletter, Model model, HttpSession session) {
		LetterBean letter = new LetterBean();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setWriter(authInfo.getName());
							
		List<LetterBean> letters = letterDao.selectAll(letter.getWriter());
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
		
}	