package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.LetterBean;
import dao.LetterDao;

@Controller
public class XmlLetterListController {
	private LetterDao letterDao;
	
	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	// Letter List 보기 부분 XML Parse
	@RequestMapping(value="/letter/XmlLetterList", method=RequestMethod.GET, 
			produces= "application/xml")
	public @ResponseBody List<LetterBean> getLetterListXml (HttpSession session) {
			
		/*AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		List<LetterBean> letterBean = letterDao.selectAll(authInfo.getName());*/
		
		List<LetterBean> letterBean = letterDao.selectLetterPublic();
			
		return letterBean; 
	}

}





		