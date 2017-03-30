package survey;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	@RequestMapping(method= RequestMethod.GET)
	public ModelAndView form(Model model){
		List<Question> questions = createQuestions();
		ModelAndView mav = new ModelAndView();
		mav.addObject("questions", questions);
//		model.addAttribute("questions", questions);
		
		Question favLanguage = createQuestions2();
		model.addAttribute("favLanguage", favLanguage);
//		return "survey/surveyForm";
		mav.setViewName("survey/surveyForm");
		List<String> loginTypes = new ArrayList<String>();
		loginTypes.add("일반회원");loginTypes.add("기업회원");
		loginTypes.add("헤드헌터회원");
		mav.addObject("loginTypes",loginTypes);
		return mav;
	
	}
	
	private List<Question> createQuestions(){
		Question q1 = new Question("당신의 역할은 무엇입니까?",
				Arrays.asList("서버","프론트","풀스택"));
		Question q2 = new Question("많이 사용하는 개발도구는 무엇입니까?",
				Arrays.asList("Eclipse","Intelij","Sublime"));
		Question q3 = new Question("하고 싶은 말을 적어주세요?");
				return Arrays.asList(q1,q2,q3);
		}
	
	private Question createQuestions2(){
		Question q1 = new Question("당신의 선호하는 언어는 무엇입니까?",
				Arrays.asList("Java","c++","python"));
				return q1;
		}
	
	@RequestMapping(method= RequestMethod.POST)
	public String submit(AnsweredData data){
		return "survey/submitted";
	
	}

}
