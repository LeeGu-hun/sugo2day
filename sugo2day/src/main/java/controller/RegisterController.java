package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import exception.AlreadyExistingMemberException;
import member.register.MemberRegisterService;
import member.register.RegisterRequest;
import member.register.RegisterRequestValidator;

@Controller
public class RegisterController {
	private MemberRegisterService memberRegisterService;
	
	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}
	
	// 가입버튼 눌렀을 때, 약관 동의 페이지 이동 주소 Mapping
	@RequestMapping("/register/registerTerm")
	public String handlerAgree() {
		return "register/registerTerm";
	}
	
	// 약관 동의 페이지를 통하지 않고 가입양식 입력 폼으로 접근 시 약관동의 Page로 redirect
	@RequestMapping(value="/register/registerForm", method=RequestMethod.GET)
	public String handlerFormGet() {
		return "redirect:/register/registerTerm";
	}
	
	// 약관 동의 페이지를 통해 가입 양식 폼으로 접근할 때
	@RequestMapping(value="/register/registerForm", method=RequestMethod.POST)
	public String handlerForm(
			@RequestParam(value="agree", defaultValue="false") Boolean agree, Model model) {
		// 약관 동의를 하지 않으면 되돌아가기
		if(!agree) {
			return "register/registerTerm";
		}
		// 약관 동의를 했으면 registerForm으로 이동
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/registerForm";
	}
	
	// 가입하기를 눌렀을 때,
	@RequestMapping(value="/register/registerSuccess", method=RequestMethod.POST)
	public String handlerSuccess(RegisterRequest regReq, Errors errors) {
		// 전 단계에서 model.addAttribute로 커맨드객체 regReq에 값을 담았다.
		// 작성된 값 검증
		new RegisterRequestValidator().validate(regReq, errors);
		
		// 잘못된 입력일 때 registerForm으로
		if(errors.hasErrors()) {
			return "register/registerForm";
		}
		
		// try-catch 문을 이용하여 중복된 email이 없을 시 등록 성공, 중복된 email이 존재하면 registerForm으로
		// RegisterService 내 method 미구현으로 일시적 주석처리, 추후 method 구현 시 주석 아래 return 문 제거
		
		try {
			memberRegisterService.regist(regReq);
			System.out.println("등록 성공");
			return "register/registerSuccess";
		} catch (AlreadyExistingMemberException ex) {
			errors.rejectValue("email", "duplicate");
			return "register/registerForm";
		}
					
	}
	
	// 비정상적인 경로로 접근 시 되돌려주기
	@RequestMapping(value="/register/registerSuccess", method=RequestMethod.GET)
	public String handlerSuccessGet() {
		return "redirect:/register/registerTerm";
	}
	
}
