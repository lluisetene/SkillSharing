package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.model.Admin;
import es.uji.ei1027.skillsharing.model.Login;


public class LoginValidator implements ValidatorLogin {

	private List<Student> studentsList;
	private List<Admin> adminsList;
	private BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
	boolean enUso = false;
	
	
	public void setLoginDAO(AdminDAO adminDao, StudentDAO studentDao) {
		adminsList = adminDao.getAdmins();
		studentsList = studentDao.getStudents();
	}
	
	
	@Override
	public boolean supports(Class<?> cls) {
		return Login.class.isAssignableFrom(cls);
	}

	@Override
	public void validateLogin(Object obj, Errors errors) {
		Login user = (Login) obj;
		
		//---------- USERNAME -----------//
		if ( user.getUsername().trim().equals("") )
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			if ( !enUso ) {
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
						enUso = true; 
						break;
					}
			}
			
			if ( !enUso ) 
				errors.rejectValue("username", "required", "El Username introducido no existe");
			
			enUso = false;
			
		}
		
		
		//----------- PASSWORD ----------//
		if (user.getPassword().trim().equals(""))
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( passwordEncryptor.checkPassword(user.getPassword(), adminsList.get(i).getPassword()) ) {
					enUso = true;
					break;
				}
			
						
			if ( !enUso )
				for ( int j = 0; j < studentsList.size(); j++ )
					if ( passwordEncryptor.checkPassword(user.getPassword(), studentsList.get(j).getPassword()) ) {
						enUso = true;
						break;
					}
			
				if ( !enUso ) 
					errors.rejectValue("password", "required", "Contraseña incorrecta");
				
				enUso = false;
			}

	}
}
