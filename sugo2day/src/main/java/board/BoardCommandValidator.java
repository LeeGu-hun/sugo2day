package board;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class BoardCommandValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return BoardCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "pass", "required");
		ValidationUtils.rejectIfEmpty(errors, "subject", "required");
		ValidationUtils.rejectIfEmpty(errors, "content", "required");
		
	}
}