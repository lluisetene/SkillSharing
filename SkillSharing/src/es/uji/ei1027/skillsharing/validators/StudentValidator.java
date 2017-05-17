package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Student;

public class StudentValidator implements Validator {

	private List<Student> studentsList;
	private List<Collaboration> collaborationsList;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	
	public void setStudentDAO(StudentDAO studentDAO, CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao) {
		studentsList = studentDAO.getStudents();
		collaborationsList = collaborationDao.getCollaborations();
		this.offerDao = offerDao;
		this.demandDao = demandDao;
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Student.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Student student = (Student) obj;
		
		// -------- NAME ----- //
		if ( student.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( student.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
		
		// -------- NID -------- //
		if ( student.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( student.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getNid().toLowerCase().equals(student.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "Este NID ya está en uso");
					break;
				}
			}
				
		// ------ USERNAME ------ //
		if ( student.getUsername().trim().equals("") )
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else if ( student.getUsername().length() < 3 )
			errors.rejectValue("username", "required", "El Username debe tener más de 3 caracteres");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getUsername().toLowerCase().equals(student.getUsername().toLowerCase()) ) {
					errors.rejectValue("username", "required", "Este Username ya está en uso");
					break;
				}
			}
		
		
		// ----- PASSWORD ---- //
		if ( student.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( student.getPassword().length() < 6 )
			errors.rejectValue("password",  "required", "La password debe tener más de 6 caracteres");
		
		// ------ MAIL ----- //
		if( student.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getMail().toLowerCase().equals(student.getMail().toLowerCase() )) {
					errors.rejectValue("mail", "required", "Este Mail ya está en uso");
					break;
				}
		}
				
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {
		Student student = (Student) obj;
		
		// -------- NAME ----- //
		if ( student.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( student.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
		
		// -------- NID -------- //
		if ( student.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( student.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
				
		// ------ USERNAME ------ //
		if ( student.getUsername().trim().equals("") )
			errors.rejectValue("username", "required", "Este campo es obligatorio");
		else if ( student.getUsername().length() < 3 )
			errors.rejectValue("username", "required", "El Username debe tener más de 3 caracteres");
		

		for ( int i = 0; i < studentsList.size(); i++ )
			if ( studentsList.get(i).getUsername().toLowerCase().equals(student.getUsername().toLowerCase()) && studentsList.get(i).getNid().equals(student.getNid()) == false) {
				errors.rejectValue("username", "required", "Este Username ya está en uso");
				break;
			}
		
		
		
		// ----- PASSWORD ---- //
		if ( student.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "Este campo es obligatorio");
		else if ( student.getPassword().length() < 6 )
			errors.rejectValue("password",  "required", "La password debe tener más de 6 caracteres");
		
		// ------ MAIL ----- //
		if( student.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "Este campo es obligatorio");
					
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {
		Student student = (Student) obj;
		
		if ( student.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( student.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			int i = 0;
			boolean notFound = true;
			while ( notFound && i < studentsList.size() ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(student.getNid().toLowerCase()) )
					notFound = false;
				i++;
			}
			
			if ( notFound )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
		}
					
	}
	
	@Override
	public void validateDelete(Object obj, Errors errors){
	
		Student student = (Student) obj;
		
		for(int indice = 0; indice < collaborationsList.size(); indice += 1){
			
			String idOffer = collaborationsList.get(indice).getIdOffer();
			String idDemand = collaborationsList.get(indice).getIdDemand();
			String nidOffer = offerDao.getOffer(idOffer).getNid();
			String nidDemand = demandDao.getDemand(idDemand).getNid();
			
			if (student.getNid().trim().toUpperCase().equals(nidOffer) || student.getNid().trim().toUpperCase().equals(nidDemand)){
				
				errors.rejectValue("nid", "required", "No se puede borrar, elimina primero las colaboraciones de este estudiante");
				
			}
			
		}
		
	}
	

}
