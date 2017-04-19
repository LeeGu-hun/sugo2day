package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.QuestWriteBean;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class QuestWriteController {
	QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	
	@RequestMapping(value="quest/questWrite", method=RequestMethod.GET)
	public String questWriteG(QuestWriteBean quest, Model model) {
		model.addAttribute("quest", quest);
		return "quest/questManage";
	}
	
	@RequestMapping(value="quest/questWrite", method=RequestMethod.POST)
	public String questWriteP(QuestWriteBean quest, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		quest.setQ_writer(authInfo.getName());
		
		
		try {
			questDao.regQuest(quest);
			return "redirect:/quest/questManage";
		} catch (Exception e) {
			System.out.println("Error! = " + e);
			return "redirect:/main";
		}
		
	}
	
	
	
}
