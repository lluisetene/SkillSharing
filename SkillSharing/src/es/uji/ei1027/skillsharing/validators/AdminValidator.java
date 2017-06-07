package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.model.Admin;

public class AdminValidator implements Validator {

	private List<Admin> adminsList;
	boolean enUso = false;
	
	
	public void setAdminDAO(AdminDAO adminDao) {
		adminsList = adminDao.getAdmins();
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
			
			if ( enUso ) {
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
					enUso = true;
					break;
				}
			
			
			if ( enUso ) { 
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
Admin user = (Admin) obj;
		
		//------ NAME -------//
		if ( user.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( user.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
		
		// ------ MAIL ----- //
		if( user.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
	
		
		//-------- USERNAME --------//
		if (user.getUsername().trim().equals(""))
			errors.rejectValue("username", "required", "Este campo es obligatorio");
			
			
		
		//---------- PASSWORD -----------//
		if ( user.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( user.getPassword().length() < 6 )
			errors.rejectValue("password",  "required", "La password debe tener más de 6 caracteres");
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
				errors.rejectValue("username", "required", "El Username introducido no existe");
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
				errors.rejectValue("username", "required", "El Username introducido no existe");
				enUso = false;
			}
		}
	}
	
}
