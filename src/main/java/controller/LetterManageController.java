package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.JoinBean;
import bean.LetterBean;
import dao.LetterDao;
import member.login.AuthInfo;

@Controller
public class LetterManageController {
	LetterDao letterDao;
	
	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}

	@RequestMapping(value="letter/letterManage", method=RequestMethod.GET)
	public String letterManagerV(Model model, HttpSession session) {
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());
		
		List<JoinBean> letters = letterDao.selectQuest(letter.getL_writer());
		model.addAttribute("letterM", letters);
		
		return "my/myQuestManager";
	}
	
}
