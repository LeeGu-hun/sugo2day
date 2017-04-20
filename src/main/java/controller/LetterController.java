package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.LetterBean;
import bean.LetterWriteBean;
import bean.QuestBean;
import dao.LetterDao;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class LetterController {
	private LetterDao letterDao;
	private QuestDao questDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}


	// 전체 글 목록보기
	@RequestMapping(value="letter/myLetter", method=RequestMethod.GET)
	public String selectDefault(LetterWriteBean Wletter, Model model, HttpSession session) {
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());;
							
		List<LetterBean> letters = letterDao.selectAll(letter.getL_writer());
		List<QuestBean> quests = questDao.selectOpenQ(letter.getL_writer());
								
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		model.addAttribute("quests", quests);
		
		return "my/myList";
	}
	
	// 일반글 목록보기
	@RequestMapping(value="letter/myLetterN", method=RequestMethod.GET)
	public String selectNormal(LetterWriteBean Wletter, Model model, HttpSession session){
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());
		
		List<LetterBean> letters = letterDao.selectNormal(letter.getL_writer());
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
		
}	