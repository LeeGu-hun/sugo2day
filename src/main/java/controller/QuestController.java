package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.QuestBean;
import bean.QuestWriteBean;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class QuestController {
	QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	
	@RequestMapping(value="quest/questManage", method=RequestMethod.GET)
	public String questManageL(QuestWriteBean quest, Model model, HttpSession session) {
		QuestBean questB = new QuestBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		questB.setQ_writer(authInfo.getName());
		
		List<QuestBean> quests = questDao.selectAllQ(questB.getQ_writer());
		
			
		model.addAttribute("quests", quests);
		model.addAttribute("quest", quest);
		
		return "quest/myQuestList";
	}
	
}
