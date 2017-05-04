package es.uji.ei1027.skillsharing.validators;

import org.springframework.validation.Errors;

public interface Validator {
	public boolean supports(Class<?> cls);
	public void validateAdd(Object obj, Errors errors);
	public void validateSearch(Object obj, Errors errors); //nklavnab
}
