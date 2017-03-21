package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.BoardBean;
import board.PageMaker;
import dao.BoardDao;

@Controller
public class BoardListController {
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@RequestMapping("/board/boardList")
	public String boardList(@RequestParam(value="srch", required=false) String srch, PageMaker pageMaker, Model model) {
		int count = 0;
		int limit = 10;
		System.out.println(pageMaker.getPage() + " // 1st page");
		pageMaker.setPage(pageMaker.getPage());
		int point = (pageMaker.getPage()-1) * 10;
		count = boardDao.countPage(srch);
		pageMaker.setCount(count);
		
		/*System.out.println(point + "// startPart");
		System.out.println(limit + "// limit");*/
		
		List<BoardBean> boards = boardDao.selectPage(srch, point, limit);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boards", boards);
		
		return "board/boardList";
	}
}
