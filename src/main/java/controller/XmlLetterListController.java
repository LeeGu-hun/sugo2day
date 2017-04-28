package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.LetterBean;
import dao.LetterDao;
import xml.Data;

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
	
	// /login 주소에 GET 방식으로 접근 할 시
	@RequestMapping(value="/GetXmlLetter", method = RequestMethod.GET, produces="application/xml")
	public String form(Model model) {
		List<LetterBean> letterBean = letterDao.selectLetterPublic();
		model.addAttribute("data", letterBean);
		return "quest/getXmlLetter";
	}
	
	@RequestMapping(value="/xmlAction", produces="application/xml")
    @ResponseBody
	public ModelAndView xml(){
        ModelAndView mav = new ModelAndView();
        List<Data> data = letterDao.selectDataPublic(); 
        mav.addObject("datas",data);
        mav.setViewName("quest/getXmlLetter");
        
        return mav;
    }
}





		