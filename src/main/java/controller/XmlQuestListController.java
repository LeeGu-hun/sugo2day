package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.QuestBean;
import dao.QuestDao;

@Controller
public class XmlQuestListController {
	private QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	@RequestMapping(value="/letter/XmlQuestList", method=RequestMethod.GET,
			produces="application/xml")
	@ResponseBody
	public List<QuestBean> getQuestListXml() {
		List<QuestBean> questBean = questDao.selectQuestPublic();
		
		return questBean;
	}
		
}
