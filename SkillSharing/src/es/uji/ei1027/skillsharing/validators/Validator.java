package es.uji.ei1027.skillsharing.validators;

import org.springframework.validation.Errors;

public interface Validator {
	
	public boolean supports(Class<?> cls);
	public void validateAdd(Object obj, Errors errors);
	public void validateUpdate(Object obj, Errors errors);
	public void validateDelete(Object obj, Errors errors);
	public void validateConsult(Object obj, Errors errors);
}
