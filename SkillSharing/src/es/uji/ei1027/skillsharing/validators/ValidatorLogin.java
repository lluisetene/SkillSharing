package es.uji.ei1027.skillsharing.validators;

import org.springframework.validation.Errors;

public interface ValidatorLogin {

	public boolean supports(Class<?> cls);
	public void validateLogin(Object obj, Errors errors);
	
}
