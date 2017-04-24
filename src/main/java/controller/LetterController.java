package controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.LetterBean;
import bean.LetterWriteBean;
import bean.QuestBean;
import dao.LetterDao;
import dao.QuestDao;
import member.login.AuthInfo;

@Controller
public class LetterController {
	private LetterDao letterDao;
	private QuestDao questDao;
	
	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}


	// 전체 글 목록보기(Only for me)
	@RequestMapping(value="letter/myLetter", method=RequestMethod.GET)
	public String selectDefault(LetterWriteBean Wletter, Model model, HttpSession session) {
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());;
							
		List<LetterBean> letters = letterDao.selectAll(letter.getL_writer());
		List<QuestBean> quests = questDao.selectOpenQ(letter.getL_writer());
								
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		model.addAttribute("quests", quests);
		
		return "my/myList";
	}
	
	// 일반글 목록보기(Only for me)
	@RequestMapping(value="letter/myLetterN", method=RequestMethod.GET)
	public String selectNormal(LetterWriteBean Wletter, Model model, HttpSession session){
		LetterBean letter = new LetterBean();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		letter.setL_writer(authInfo.getName());
		
		List<LetterBean> letters = letterDao.selectNormal(letter.getL_writer());
		model.addAttribute("letters", letters);
		model.addAttribute("letter", Wletter);
		
		return "my/myList";
	}
	
	// 전체 글 보기(For all user, isprivate is = 'y')
	@RequestMapping("/main")
	public String ctxMain(HttpSession session, Model model) {				
		List<LetterBean> letters = letterDao.selectLetterPublic();
		List<QuestBean> quests = questDao.selectQuestPublic();		

		model.addAttribute("letters", letters);
		model.addAttribute("quests", quests);
		
		// 퀘스트 관련글 에서 l_questcate 만 중복없이 가져와서 저장
		List<Map<String, Object>> lCates = letterDao.getlqcate();
		// lCates를 tempList에 String 타입으로 저장
		List<String> tempList = new ArrayList<String>();
		for(Map<String, Object> i:lCates) {
			for(Map.Entry<String, Object> entry:i.entrySet()) {
				tempList.add(entry.getValue().toString());				
			}
		}		
		// 각각의 퀘스트 관련글이 작성된 횟수 저장
		List<Integer> maxValues = new ArrayList<Integer>(); 
		for(int i=0; i<tempList.size(); i++) {
			maxValues.add(letterDao.countHotQL(tempList.get(i)));
		}
		
		// lCates 와 작성된 횟수를 HashMap에 담기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for(int i=0; i<tempList.size(); i++) {
			map.put(tempList.get(i), maxValues.get(i));
		}
		
		TreeMap<String, Integer> hotQ = new TreeMap<String, Integer>();
		hotQ = (TreeMap<String, Integer>) sortByValues(map);
		
		System.out.println(hotQ);
		
		model.addAttribute("map", hotQ);
		return "defaultPage";
		
	}
	
	public static <K, V extends Comparable<V>> Map<K, V> sortByValues(final Map<K, V> map) {
		Comparator<K> valueComparator = new Comparator<K>() {
			@Override
			public int compare(K o1, K o2) {
				int compare = map.get(o2).compareTo(map.get(o1));
				if(compare == 0) 
					return 1;
				else
					return compare;
			}
		};
		Map<K, V> sortedByValues = new TreeMap<K, V>(valueComparator);
		sortedByValues.putAll(map);
		return sortedByValues;
	}	
	
}	