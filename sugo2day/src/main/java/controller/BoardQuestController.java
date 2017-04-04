package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.QuestBean;
import dao.QuestDao;
import exception.BoardNotFoundException;
import member.login.AuthInfo;
import quest.QuestCommand;
import quest.QuestCommandValidator;

@Controller
public class BoardQuestController {
	private QuestDao questDao;

	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}

	@RequestMapping(value="quest/questList/{num}" , method=RequestMethod.GET)
	public String questBoard(@PathVariable("num") int num , Model model ) {	
		List<QuestBean> questList = questDao.selectById(num);
		List<Integer> countDday = questDao.countDay(num);
//		if(countDday == 0){
//			System.out.println("퀘스트기간이 끝났습니다.");
//		}
		model.addAttribute("quest", questList);
		model.addAttribute("countDday",countDday);
//		List<Integer> countDday = questDao.countDay(num, quest.getNUM());

		return "quest/questList";
	}
	
//	@RequestMapping(value="quest/questList/{num}" , method=RequestMethod.GET)
//	public String questBoard(@PathVariable("num") int num , Model model ) {	
//		List<QuestBean> questList = questDao.selectById(num);
//		int countDday = questDao.countDay(num);
//		if(countDday == 0){
//			System.out.println("퀘스트기간이 끝났습니다.");
//		}
//		model.addAttribute("quest", questList);
//		model.addAttribute("countDday",countDday);
//		
//		return "quest/questList";
//	}
//	@RequestMapping(value="quest/questList/{num}" , method=RequestMethod.GET)
//	public String questBoard(@PathVariable("num") int num ,List<QuestBean> quest , Model model) {
////		model.addAttribute("board", boardCommand);
//		quest= questDao.selectById(num);
////		System.out.println("list->"+quest+"quest"+quest.get);
////		
//		model.addAttribute("quest", quest);
////		System.out.println("questList ->->"+questList);
//		return "quest/questList";
//	}

	@RequestMapping( "quest/questReg")
	public String questReg() {
//		model.addAttribute("board", boardCommand);
		return "quest/questReg";
	}
	
	
	@RequestMapping(value ="quest/questDetail/{num}" , method=RequestMethod.GET)
	public String questDetailGet(@PathVariable("num") int num, Model model,QuestCommand quest){
			model.addAttribute("quest", quest);
			
			if(quest == null) {
				throw new BoardNotFoundException();
			}
			questDao.selectByNum(num);
			return "quest/questDetail";
	}
	
	@RequestMapping(value = "quest/questRegister", method = RequestMethod.GET)
	public String boardWriteGet(QuestCommand quest, Model model) {

		model.addAttribute("quest", quest);
		
		return "/quest/questRegister";
	}

	@RequestMapping(value = "quest/questRegister", method = RequestMethod.POST)
	public String boardWrite(QuestCommand quest, Model model, Errors errors,HttpSession session ){
		
		new QuestCommandValidator().validate(quest, errors);
		try{
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		quest.setNAME(authInfo.getName());
		
		questDao.insert(quest);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/quest/questList/"+quest.getID();

	}
	
}
