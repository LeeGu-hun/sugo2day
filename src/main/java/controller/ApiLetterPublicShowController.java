package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.LetterDao;

@Controller
public class ApiLetterPublicShowController {
	LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}

	@RequestMapping(value="letter/letterChangePriv", method=RequestMethod.POST)
	public String letterChangePublic(
			@RequestParam(value="num") int num,
			@RequestParam(value="isprivate") String isprivate) {
		
		letterDao.changePrivate(num, isprivate);
		return "redirect:/letter/myLetter";		
	}
	

}
