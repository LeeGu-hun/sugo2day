package board;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.BoardBean;
import dao.BoardDao;

public class BoardDeleteValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return BoardBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pass", "required");
				
	}
}
