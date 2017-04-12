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
	
	// 퀘스트 글 목록보기 (사용 안함)
	@RequestMapping(value="letter/myQuest", method=RequestMethod.POST)
	public String selectAll(LetterWriteBean Wletter, String isquest, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		LetterBean letter = new LetterBean();
		letter.setWriter(authInfo.getName());
				
		System.out.println("letter/myLetter POST type : writer = " + letter.getWriter());
		System.out.println("letter/myLetter POST type : isquest = " + letter.getIsquest());

		List<LetterBean> letters = letterDao.selectQuest(letter);
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
	
}	