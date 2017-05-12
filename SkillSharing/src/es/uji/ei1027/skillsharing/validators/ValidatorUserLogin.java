package es.uji.ei1027.skillsharing.validators;

import org.springframework.validation.Errors;

public interface ValidatorUserLogin {
	public boolean supports(Class<?> cls);
	public void validateUserLogin(Object obj, Errors errors);
	public void validateSearchUserLogin(Object obj, Errors errors);
}
