package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.QuestBean;
import dao.QuestDao;
import member.login.AuthInfo;
import quest.QuestCommand;
import quest.QuestCommandValidator;

@Controller
public class pageController {
	private QuestDao questDao;

	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}

	@RequestMapping( "quest/questList")
	public String questBoard(QuestCommand quest , Model model) {
//		model.addAttribute("board", boardCommand);
		List<QuestBean> questList = questDao.questAll();
		System.out.println("list->"+questList+"quest"+quest.getSUBJECT());
//		
		model.addAttribute("quest", questList);
//		System.out.println("questList ->->"+questList);
		return "quest/questList";
	}

	@RequestMapping( "quest/questReg")
	public String questReg() {
//		model.addAttribute("board", boardCommand);
		return "quest/questReg";
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
		
//		MultipartFile multi = boardCommand.getMultiFile();
//		String newFileName = "";
//		// 파일이 많을 경우 업로드 파일 리스트
//		// List<MultipartFile> files = boardCommand.getFiles();
//
//		if (!multi.isEmpty()) {
//			System.out.println("If 타느냐");
//			String fileName = multi.getOriginalFilename();
//			// 파일명이 중복되지 않게 파일명에 시간 추가
//			newFileName = System.currentTimeMillis() + "_" + fileName;
//			boardCommand.setFileName(newFileName);
//
//			String path = boardCommand.getUpDir() + newFileName;
//
//			try {
//				File file = new File(path);
//				multi.transferTo(file);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		questDao.insert(boardCommand);
		return "quest/questList";

	}
	
}
