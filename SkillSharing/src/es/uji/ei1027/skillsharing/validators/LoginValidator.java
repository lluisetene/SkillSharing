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
	boolean admin = false; 
	boolean student = false;
	
	
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
		Student estudiante = new Student();
		Admin administrador = new Admin();
		boolean passCorrecta = false;
		
		//---------- USERNAME -----------//
		if ( user.getUsername().trim().equals("") )
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ ){
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					administrador = adminsList.get(i);
					admin = true;
					break;
				}
			}
			if ( admin == false ) {
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
						estudiante = studentsList.get(i);
						
						student = true; 
						break;
					}
			}
			if ( admin == false && student == false ) 
				errors.rejectValue("username", "required", "El nombre de usuario introducido no existe");
			
			else {
				passCorrecta = false;
			}
		}
			//----------- PASSWORD ----------//
			if (user.getPassword().trim().equals(""))
				errors.rejectValue("password", "required", "Este campo es obligatorio");
			else {
				if ( admin == true ) {
					if ( passwordEncryptor.checkPassword(user.getPassword(), administrador.getPassword()) )
						passCorrecta = true;
				} else {
					if ( student == true )
						if ( passwordEncryptor.checkPassword(user.getPassword(), estudiante.getPassword()) )
							passCorrecta = true;
				}
				
				if ( passCorrecta == false ) 
					errors.rejectValue("password", "required", "Contraseña incorrecta");
				else
					passCorrecta = false;
			}
			
		
	
			
		}
			
		
}
