package quest;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class QuestCommandValidator implements Validator{
	@Override
	public boolean supports(Class<?> clazz) {
		return LetterCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "NAME", "required");
		ValidationUtils.rejectIfEmpty(errors, "SUBJECT", "required");
		ValidationUtils.rejectIfEmpty(errors, "CONTENT", "required");
		
	}
}
