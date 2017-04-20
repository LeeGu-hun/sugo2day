package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.QuestDao;

@Controller
public class ApiQuestPublicShowController {
	QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	
	@RequestMapping(value="quest/questChangePriv", method=RequestMethod.POST)
	public String questChangePublic(
			@RequestParam(value="num") int num,
			@RequestParam(value="isprivate") String isprivate) {
		
		questDao.changePublic(num, isprivate);
		return "redirect:/quest/questManage";
		
	}
	

}
