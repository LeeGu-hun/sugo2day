package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bean.Board;
import board.edit.BoardCommand;
import board.edit.BoardRegisterService;
import board.edit.BoardValidator;
import board.edit.PageMaker;
import dao.BoardDao;
import exception.MemberNotFoundException;
import member.login.AuthInfo;


@Controller
public class BoardController {
	private BoardDao boardDao;
	private BoardRegisterService boardRegSvc;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping(value="/boardList")
	public String boardListGetPost(){
//			@RequestParam(value = "srch", required = false) String srch, 
//			PageMaker pageMaker, Model model) {
//		int count = 0;
//		int limit = 10;
//		pageMaker.setPage(pageMaker.getPage());
//		int point = (pageMaker.getPage() - 1) * 10;
//		count = boardDao.countPage(srch);
//		// 레코드 총 갯수 구함
//		pageMaker.setCount(count); // 페이지 계산
//		List<Board> boards = boardDao.selectPage(srch, point, limit);
//		model.addAttribute("pageMaker", pageMaker);
//		model.addAttribute("boards", boards);
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.GET)
	public String boardWriterGet(BoardCommand boardCommand){
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String boardWriterPost( BoardCommand boardCommand, 
			Errors error , HttpSession session){
		
		new BoardValidator().validate(boardCommand, error);
		if(error.hasErrors())return"board/boardWrite";
		
		//파일이 많을 경우 업로드 파일 리스트
		//List<MultipartFile> files = boardCommand.getFiles();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		boardCommand.setBoard_writer(authInfo.getId());
		
		MultipartFile multi = boardCommand.getBoard_multiFile();
		String newFileName ="";
		if(multi != null){
			//파일명이 중복되지 않게 파일명에 시간추가
			String fileName = multi.getOriginalFilename();
			
			newFileName =
					System.currentTimeMillis() + "_" +fileName;
			String path = boardCommand.getBoard_upDir() + newFileName;
			boardCommand.setBoard_fileName(newFileName);
			try{
				File file = new File(path);
				multi.transferTo(file);
				
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
//		boardDao.insert(boardCommand);
		boardDao.add(boardCommand);
		return "redirect:/boardList";
	}
	
//	@RequestMapping(value="/reply/replyWriter/{num}", method=RequestMethod.GET)
//	public String boardReplyGet(@PathVariable("num") int num, Board board
//			,Model model){
//		
//		board = boardDao.selectByNum(num);
//		model.addAttribute("reply", board);
//		return "board/replyWriter";
//	}
	
//	@RequestMapping(value="/board/reply/{id}", method=RequestMethod.GET)
//	public String reply(Board board ,@PathVariable("id") int boardId, Model model){
//		board = boardDao.selectByNum(boardId);
//		model.addAttribute("board", board);
//		return "board/replyWriter";
//	}
	
//	@RequestMapping(value="/board/reply/{id}", method=RequestMethod.POST)
//	public String boardReplyPost(Board board, Model model){
//		boardDao.replyInsert(board);
//		model.addAttribute("board",board);
//		return "redirect:/boardList";
//	}
	
	@RequestMapping(value="/board/update/{num}", method=RequestMethod.GET)
	public String UpdateAction(@PathVariable("num") int num ,Model model,
			Board board){
		System.out.println(num);
		board = boardDao.selectByNum(num);
		model.addAttribute("board",board );
		return "board/boardUpdate";
	}

	
	@RequestMapping(value="/board/update/{num}", method=RequestMethod.POST)
	public String boardUpdatePost( Board board, @PathVariable("num") int num ,Errors error, Model model){
		
//		boardDao.update(board);
		model.addAttribute("board",board);
	
		return "redirect:/board/detail/"+num;
	}
	@RequestMapping(value="/board/detail/{num}")
	public String detail(
			@PathVariable("num") int num , Model model){
		Board board = boardDao.selectByNum(num);
		 	boardDao.updateReadCount(board);
		if(board == null) throw new MemberNotFoundException();
		model.addAttribute("board",board);
		return "board/boardDetail";
	}
	
	
	@RequestMapping(value = "board/boardReply/{num}")
	public String boardReply(@PathVariable("num") int num, Model model) {
		Board board = boardDao.selectByNum(num);
		model.addAttribute("board", board);
		return "board/replyWriter";
	}

	@RequestMapping(value = "board/boardReply", method = RequestMethod.POST)
	public String boardReply(Board board, BoardCommand boardCommand, Errors errors) {
//		new BoardValidator().validate(board, errors);
//		if (errors.hasErrors()) {
//			return "board/replyWriter";
//		}
////		
//		try {
//		board= boardDao.updateReply(board);
	
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		try {
			boardDao.ReplyBoard(board);
			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		return "redirect:/boardList";
	}
	
//	
//	@RequestMapping("board/boardReply/{num}")
//	public String boardReply1(@PathVariable("num") int num, BoardCommand boardCommand, Model model) {
//		Board board = boardDao.selectByNum(num);
//		model.addAttribute("board", board);
//		return "board/boardReply";
//	}
//	
//	@RequestMapping(value="board/boardReply", method = RequestMethod.POST)
//	public String boardReply1(Board board, BoardCommand boardCommand, Errors errors) {
//		new BoardValidator().validate(board, errors);
//		if(errors.hasErrors()) {
//			return "board/boardReply";
//		}
//		
//		try {
//			boardDao.replyjjh1(board, boardCommand);
//			return "redirect:/board/boardList";
//			//return "board/boardReplyComplete";
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "board/boardReply";
//		}
//	}
	
	
	
}
