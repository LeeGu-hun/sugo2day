package letter;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.LetterBean;

public class LetterBeanValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return LetterBean.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "isquest", "required");
		ValidationUtils.rejectIfEmpty(errors, "isprivate", "required");
		ValidationUtils.rejectIfEmpty(errors, "subject", "required");
		ValidationUtils.rejectIfEmpty(errors, "content", "required");
	}

}
