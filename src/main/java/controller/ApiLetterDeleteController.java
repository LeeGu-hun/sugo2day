package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.LetterBean;
import bean.LetterWriteBean;
import bean.QuestBean;
import dao.LetterDao;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class ApiLetterDeleteController {
	private LetterDao letterDao;
	private QuestDao questDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}

	@RequestMapping(value="letter/letterDelete", method=RequestMethod.POST)
	public String letterDelete(
			@RequestParam(value="gNum") Integer num,
			LetterWriteBean Wletter, HttpSession session, Model model) {
		
		LetterBean letter = new LetterBean();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());
		
		List<LetterBean> letters = letterDao.selectAll(letter.getL_writer());
		List<QuestBean> quests = questDao.selectOpenQ(letter.getL_writer());
		
		try {
			letterDao.deleteL(num, letter.getL_writer());
			model.addAttribute("letters", letters);
			model.addAttribute("letter", Wletter);
			model.addAttribute("quests", quests);
			return "redirect:/letter/myLetter";
		} catch (Exception e) {
			System.out.println("Delete Error! = " + e);
			return "redirect:/main";
		}
	}

}
