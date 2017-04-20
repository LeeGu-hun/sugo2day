package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.QuestBean;
import bean.QuestWriteBean;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class ApiQuestDeleteController {
	QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	@RequestMapping(value="quest/questDelete", method=RequestMethod.POST)
	public String questDelete(
			@RequestParam(value="gTitle") String title,
			QuestWriteBean quest, HttpSession session, Model model) {
		
		QuestBean questB= new QuestBean();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		questB.setQ_writer(authInfo.getName());
		
		List<QuestBean> quests = questDao.selectAllQ(questB.getQ_writer());
		
		try {
			questDao.deleteQ(title, questB.getQ_writer());
			model.addAttribute("quests", quests);
			model.addAttribute("quest", quest);
			return "redirect:/quest/questManage";
		} catch (Exception e) {
			System.out.println("Delete Error! = " + e);
			return "redirect:/main";
		}
	}

}
