package controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LetterDao;

@Controller
public class ApiLetterManageController {
	LetterDao letterDao;
	
	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}

	@RequestMapping(value="letter/letterOnpriv", method=RequestMethod.POST)
	public @ResponseBody void letterOnpriv(@RequestParam("num") int num,
							@RequestParam("isprivate") String isprivate, HttpServletResponse response) {
		
		response.setContentType("application/json;charset=UTF-8");
        
		try {
        	letterDao.changePrivate(num, isprivate);
        } catch (Exception ex) {
        	System.out.println("Error: 공개여부 변경에 실패");
        }
      
	}

}
