package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.dao.UserLoginDAO;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.model.UserLogin;

public class UserLoginValidator implements ValidatorUserLogin {

	private List<Student> studentsList;
	private List<UserLogin> adminsList;
	boolean enUso = false;
	
	
	public void setUserLoginDAO(UserLoginDAO userLoginDao, StudentDAO studentDao) {
		adminsList = userLoginDao.getUsers();
		studentsList = studentDao.getStudents();
	}
	
	
	@Override
	public boolean supports(Class<?> cls) {
		return UserLogin.class.equals(cls);
	}


	@Override
	public void validateAdd(Object obj, Errors errors) {
		
		UserLogin user = (UserLogin) obj;
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		
		//------ NAME -------//
		if ( user.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( user.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
		
		// ------ MAIL ----- //
		if( user.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getMail().toLowerCase().equals(user.getMail().toLowerCase() )) {
					enUso = true;
					break;
				}
			if ( !enUso )
				for ( int j = 0; j < studentsList.size(); j++ )
					if ( studentsList.get(j).getMail().toLowerCase().equals(user.getMail().toLowerCase()) ) {
						enUso = true;
						break;
					}
			if ( !enUso ) {
				errors.rejectValue("mail", "required", "Este Mail ya está en uso");
				enUso = false;
			}
		}
		
		//-------- USERNAME --------//
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true; //un admin está usando este username
					break;
				}
			
			if ( !enUso ) //si no lo está usando un admin
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
						enUso = true; //un usuario está usando este username
						break;
					}
			
			if ( !enUso ) { 
				errors.rejectValue("username", "required", "Este Username ya está en uso");
				enUso = false;
			}
		}
		
		//---------- PASSWORD -----------//
		if ( user.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( user.getPassword().length() < 6 )
			errors.rejectValue("password",  "required", "La password debe tener más de 6 caracteres");
	}


	@Override
	public void validateUpdate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void validateDelete(Object obj, Errors errors) {
		UserLogin user = (UserLogin) obj;
		
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			if ( !enUso ) { //si no es admin
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
						enUso = true;
						break;
					}
			}
			
			if ( enUso ) {
				errors.rejectValue("username", "required", "El Username introducido no existe");
				enUso = false;
			}
		}
	}


	@Override
	public void validateConsult(Object obj, Errors errors) {
		UserLogin user = (UserLogin) obj;
		
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			if ( !enUso ) { //si no es admin
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
						enUso = true;
						break;
					}
			}
			
			if ( enUso ) {
				errors.rejectValue("username", "required", "El Username introducido no existe");
				enUso = false;
			}
		}
	}


	@Override
	public void validateLogin(Object obj, Errors errors) {
		UserLogin user = (UserLogin) obj;
		//BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		
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
			
			if ( enUso ) 
				errors.rejectValue("username", "required", "El Username introducido no existe");
			
			enUso = false;
			
		}
		
		
		//----------- PASSWORD ----------//
		if (user.getPassword().trim().equals(""))
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getPassword().toLowerCase().equals(user.getPassword().toLowerCase()) ) {
					//if ( passwordEncryptor.checkPassword(user.getPassword().toLowerCase(), adminsList.get(i).getPassword()) ) {
					enUso = true;
					break;
				}
			
						
			if ( !enUso )
				for ( int j = 0; j < studentsList.size(); j++ )
					if ( studentsList.get(j).getPassword().toLowerCase().equals(user.getPassword().toLowerCase()) )  {
					//if ( passwordEncryptor.checkPassword(user.getPassword().toLowerCase(), studentsList.get(j).getPassword().toLowerCase()) ) {
						enUso = true;
						break;
					}
			
				if ( enUso ) 
					errors.rejectValue("password", "required", "Contraseña incorrecta");
				
				enUso = false;
			}

	}
}
