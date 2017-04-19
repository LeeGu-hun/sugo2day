package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.LetterBean;
import dao.LetterDao;
import member.login.AuthInfo;

@Controller
public class ApiLetterQShowController {
	LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	@RequestMapping(value="letter/incQList", method=RequestMethod.POST)
	@ResponseBody
	public List<LetterBean> getSelectedJsonLetter(
			@RequestParam(value="num") Integer num,
			@RequestParam(value="title") String title, HttpSession session) {
		
		LetterBean letter = new LetterBean();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());
		
		List<LetterBean> letters = letterDao.changeQList(num, title, letter.getL_writer());
		return letters;	
	}
}
