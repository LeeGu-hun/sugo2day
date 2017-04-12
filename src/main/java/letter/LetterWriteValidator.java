package letter;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.LetterWriteBean;

public class LetterWriteValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return LetterWriteBean.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "subject", "required");
		ValidationUtils.rejectIfEmpty(errors, "content", "required");
	}

}
