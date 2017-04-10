package member.edit;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ChangePwdCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return ChangePwdCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ChangePwdCommand changePwdCmd = (ChangePwdCommand) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "newPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmNewPassword", "required");
		
		if(!changePwdCmd.getNewPassword().isEmpty()) {
			if(!changePwdCmd.getConfirmNewPassword().isEmpty()) {
				if(!changePwdCmd.isPasswordEqaulToConfirmNewPassword()) {
					errors.rejectValue("confirmNewPassword", "nomatch");
				}
			}
		}
	}

	
}
