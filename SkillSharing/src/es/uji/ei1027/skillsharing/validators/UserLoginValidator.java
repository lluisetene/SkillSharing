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
	private List<UserLogin> usersloginList;
	boolean admin, usuario = false;
	
	
	public void setUserLoginDAO(UserLoginDAO userLoginDao, StudentDAO studentDao) {
		usersloginList = userLoginDao.getUsers();
		studentsList = studentDao.getStudents();
	}
	
	
	@Override
	public boolean supports(Class<?> cls) {
		return UserLogin.class.equals(cls);
	}

	@Override
	public void validateUserLogin(Object obj, Errors errors) {
		
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		
		//---------- USERNAME -----------//
		UserLogin user = (UserLogin) obj;
		
		if (user.getUserName().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < usersloginList.size(); i++ )
				if ( usersloginList.get(i).getUserName().toLowerCase().equals(user.getUserName().toLowerCase()) ) {
					admin = true; //login de un admin
					break;
				}
			
			if ( !admin ) { //si no es admin
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUserName().toLowerCase()) ) {
						usuario = true; //login de un usuario
						break;
					}
			}
			
			if ( !usuario ) //no existe
				errors.rejectValue("username", "required", "El UserName introducido no existe");
			
		}
		
		
		//----------- PASSWORD ----------//
		if (user.getPassword().trim().equals(""))
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else {
			if ( admin )
				for ( int i = 0; i < usersloginList.size(); i++ )
					if ( passwordEncryptor.checkPassword(user.getPassword().toLowerCase(), usersloginList.get(i).getPassword()) ) {
						admin = true;
						break;
					}
						
			else if ( usuario )
				for ( int j = 0; j < studentsList.size(); j++ ) 
					if ( passwordEncryptor.checkPassword(user.getPassword().toLowerCase(), studentsList.get(j).getPassword().toLowerCase()) ) {
						usuario = true;
						break;
					}
			
				if ( !admin && !usuario ) 
					errors.rejectValue("password", "required", "Contraseña incorrecta");
			}

	}


	@Override
	public void validateSearchUserLogin(Object obj, Errors errors) {
		UserLogin user = (UserLogin) obj;
		
		if (user.getUserName().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < usersloginList.size(); i++ )
				if ( usersloginList.get(i).getUserName().toLowerCase().equals(user.getUserName().toLowerCase()) ) {
					admin = true; //login de un admin
					break;
				}
			
			if ( !admin ) { //si no es admin
				for ( int i = 0; i < studentsList.size(); i++ )
					if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUserName().toLowerCase()) ) {
						usuario = true; //login de un usuario
						break;
					}
			}
			
			if ( !usuario ) //no existe
				errors.rejectValue("username", "required", "El UserName introducido no existe");
			
		}
	}
}
