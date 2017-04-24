package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.QuestBean;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class XmlLetterWriteController {
	private QuestDao questDao;
	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	// Write Form Quest 관련 부분 XML Parse
	@RequestMapping(value="/letter/XmlLetterWrite", method=RequestMethod.GET,
			produces= "application/xml")
	@ResponseBody
	public List<QuestBean> getLetterWriteXml (HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		List<QuestBean> letterW = questDao.selectOpenQ(authInfo.getName());
		
		return letterW;
	}
	
	
	
}
