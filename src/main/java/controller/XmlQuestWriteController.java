package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.QuestDao;

@Controller
public class XmlQuestWriteController {
	private QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	@RequestMapping(value="/letter/XmlQuestWrite", method=RequestMethod.POST,
			produces="application/xml")
	@ResponseBody
	public void getQuestWriteXml() {
		//To-do (Title 중복체크는 J-query로 처리해서 여기서 딱히 뭘 해줄건 없는듯) 
	}
	
}
