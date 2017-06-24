package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Admin;
import es.uji.ei1027.skillsharing.model.Student;

public class AdminValidator implements Validator {

	private List<Admin> adminsList;
	private List<Student> studentsList;
	boolean enUso = false;
	
	
	public void setAdminDAO(AdminDAO adminDao, StudentDAO studentDao) {
		adminsList = adminDao.getAdmins();
		studentsList = studentDao.getStudents();
	}

	@Override
	public boolean supports(Class<?> cls) {
		return Admin.class.equals(cls);
	}
	
	
	@Override
	public void validateAdd(Object obj, Errors errors) {
		
		Admin user = (Admin) obj;
		
		//------ NAME -------//
		if ( user.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( user.getName().length() < 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		
		
		// ------ MAIL ----- //
		if( user.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getMail().toLowerCase().equals(user.getMail().toLowerCase() )) {
					enUso = true;
					break;
				}
			
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getMail().toLowerCase().equals(user.getMail().toLowerCase() )) {
					enUso = true;
					break;
				}
			
			if ( enUso ) {
				errors.rejectValue("mail", "required", "Este mail ya está en uso");
				enUso = false;
			}
		}
		
		//-------- USERNAME --------//
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			
			if ( enUso ) { 
				errors.rejectValue("username", "required", "Este nombre de usuario ya está en uso");
				enUso = false;
			}
			
			else if ( user.getUsername().length() <= 3 )
				errors.rejectValue("username", "required", "El nombre de usuario debe tener más de 3 caracteres");
			
		}
		
		//---------- PASSWORD -----------//
		if ( user.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( user.getPassword().length() <= 6 )
			errors.rejectValue("password",  "required", "La contraseña debe tener más de 6 caracteres");
	}


	@Override
	public void validateUpdate(Object obj, Errors errors) {
Admin user = (Admin) obj;
		
		//------ NAME -------//
		if ( user.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( user.getName().length() < 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
	
		// ------ MAIL ----- //
		if( user.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
		
		for (int i = 0; i < adminsList.size(); i++){
			
			if (adminsList.get(i).getMail().trim().toLowerCase().equals(user.getMail().trim().toLowerCase())){
				
				if (!adminsList.get(i).getUsername().trim().toLowerCase().equals(user.getUsername().trim().toLowerCase())){
					
					errors.rejectValue("mail", "required", "Este email ya está en uso");
					
				}
				
			}
			
		}
		
		for (int i = 0; i < studentsList.size(); i++){
			
			if (studentsList.get(i).getMail().trim().toLowerCase().equals(user.getMail().trim().toLowerCase())){
				
				if (!adminsList.get(i).getUsername().trim().toLowerCase().equals(user.getUsername().trim().toLowerCase())){
					
					errors.rejectValue("mail", "required", "Este email ya está en uso");
					
				}
				
			}
			
		}
		
		//-------- USERNAME --------//
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
			
			
		
		//---------- PASSWORD -----------//
		if ( user.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( user.getPassword().length() <= 6 )
			errors.rejectValue("password",  "required", "La contraseña debe tener más de 6 caracteres");
	}
		
	


	@Override
	public void validateDelete(Object obj, Errors errors) {
		Admin user = (Admin) obj;
		
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().toLowerCase().equals(user.getUsername().toLowerCase()) ) {
					enUso = true;
					break;
				}
			
			
			if ( enUso ) {
				errors.rejectValue("username", "required", "El nombre de usuario introducido no existe");
				enUso = false;
			}
		}
	}


	@Override
	public void validateConsult(Object obj, Errors errors) {
		Admin user = (Admin) obj;
		
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < adminsList.size(); i++ )
				if ( adminsList.get(i).getUsername().equals(user.getUsername()) ) {
					enUso = true;
					break;
				}
			
			if ( !enUso ) {
				errors.rejectValue("username", "required", "El nombre de usuario introducido no existe");
				enUso = false;
			}
		}
	}
	
}
