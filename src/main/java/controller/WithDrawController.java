package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.MemberBean;
import dao.MemberDao;
import member.login.AuthInfo;

@Controller
public class WithDrawController {
	MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	@RequestMapping(value="/edit/withDrawAgree", method=RequestMethod.GET)
	public String withDrawAgree() {
		return "edit/withDrawAgree";
	}
	
	@RequestMapping(value="/edit/withDrawAgree", method=RequestMethod.POST)
	public String withdrawAgree(@RequestParam(value="agree") Boolean agree, Model model, HttpSession session) {
		if(agree.equals(null)) {
			return "edit/failPage";
		}
		if(!agree) {
			return "edit/failPage";
		}
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		MemberBean member = memberDao.selectByEmail(authInfo.getEmail());
		
		memberDao.delete(member);
		session.invalidate();
		return "edit/withDrawComplete";		
		
	}
	
	
}
