package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import member.login.AuthInfo;
import member.login.AuthService;
import member.login.LoginCommand;
import member.login.LoginCommandValidator;

@Controller
public class LoginController {
	// Bean 객체 불러오고 Setter 만들기
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

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
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors,
			HttpSession session, HttpServletResponse response) {
		new LoginCommandValidator().validate(loginCommand, errors);
		
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		
		try {
			AuthInfo authInfo = authService.authenticate(loginCommand.getEmail(), loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo);
			
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getEmail());
			rememberCookie.setPath("/");
			
			if(loginCommand.isRmbEmail()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			return "redirect:/letter/myLetter"; 
			
		} catch (IdPasswordNotMatchingException e) {
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		} catch (MemberNotFoundException e) {
			errors.reject("memberNotFound");
			return "login/loginForm";
			
		}
	}
	
}
