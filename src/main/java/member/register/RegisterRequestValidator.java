package member.register;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import member.register.RegisterRequest;

public class RegisterRequestValidator implements Validator {
	// email 형식만 허용하는 정규식 패턴
	private static final String emailRegExp = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
			"[A-Za-z0-9-]+(\\A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;
	
	// YYYY-MM-DD 형식만 허용하는 정규식 패턴
	private static final String birthdayRegExp = 
			"^([1-2]{1}[0-9]{1,3})-([0-1]{1}[0-9]{1,2})-([0-2]{1}[0-9]{1,2}|30|31)$";
	
	private Pattern pattern2;
	
	// male, female 만 허용하는 정규식 패턴
	private static final String genderRegExp =
			"^(male|female)$";
	
	private Pattern pattern3;
	
	public RegisterRequestValidator() {
		pattern = Pattern.compile(emailRegExp);
		pattern2 = Pattern.compile(birthdayRegExp);
		pattern3 = Pattern.compile(genderRegExp);
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest) target;
		if(regReq.getEmail()==null || regReq.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getEmail());
			if(!matcher.matches()) {
				errors.rejectValue("email", "bad");
			}
		}
		
		Matcher matcher2 = pattern2.matcher(regReq.getBirthday());
		if(!matcher2.matches()) {
			errors.rejectValue("birthday", "bad");
		}
		
		Matcher matcher3 = pattern3.matcher(regReq.getGender());
		if(!matcher3.matches()) {
			errors.rejectValue("gender", "bad");
		}
		
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		ValidationUtils.rejectIfEmpty(errors, "password", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		
		if(!regReq.getPassword().isEmpty()) {
			if(!regReq.getConfirmPassword().isEmpty()) {
				if(!regReq.isPasswordEqaulToConfirmPassword()) {
					errors.rejectValue("confirmPassword", "nomatch");
				}
			}
		}
		
		ValidationUtils.rejectIfEmpty(errors, "birthday", "required");
		ValidationUtils.rejectIfEmpty(errors, "gender", "required");
	}
	
	
}
