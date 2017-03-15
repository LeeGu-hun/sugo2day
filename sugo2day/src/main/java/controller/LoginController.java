package controller;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.login.LoginCommand;

@Controller
public class LoginController {
	// Bean 객체 불러오고 Setter 만들기
	
	
	// /login 주소에 GET 방식으로 접근 할 시
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String form(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		// Coockie값이 null이 아니면 loginCommand 객체에 email을 cookie 에서 가져온 값으로 저장
		if(rCookie != null) {
			loginCommand.setEmail(rCookie.getValue());
			loginCommand.setRmbEmail(true);
		}
		// GET방식으로 /login 주소로 접근하는 것은 옳지 못한 방법이므로 loginForm으로 이동
		return "login/loginForm";
	}
	
	// /login 주소에 POST 방식으로 접근 할 시
	
	
}
