package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("my/myPage")
	public String myPageCall() {
		return "my/myPage";
	}
}
