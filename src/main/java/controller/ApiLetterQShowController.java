package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

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
			@RequestParam(value = "questcate") String questcate, HttpSession session) {
		
		LetterBean letter = new LetterBean();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setWriter(authInfo.getName());
		
		List<LetterBean> letters = letterDao.changeQList(questcate, letter.getWriter());
		return letters;	
	}
}
