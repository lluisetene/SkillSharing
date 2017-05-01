package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Student;

public class StudentValidator implements Validator {

	private List<Student> studentsList;
	
	public void setStudentDAO(StudentDAO studentDAO) {
		studentsList = studentDAO.getStudents();
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
			errors.rejectValue("name", "required", "It is empty");
		else if ( student.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		
		
		// -------- NID -------- //
		if ( student.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "It is empty");
		else if ( student.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Too long");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getNid().toLowerCase().equals(student.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "It Already Exists");
					break;
				}
			}
				
		// ------ USERNAME ------ //
		if ( student.getUsername().trim().equals("") )
			errors.rejectValue("username", "required", "It is empty");
		else if ( student.getUsername().length() < 3 )
			errors.rejectValue("username", "required", "Too long");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getUsername().toLowerCase().equals(student.getUsername().toLowerCase()) ) {
					errors.rejectValue("username", "required", "It Already Exists");
					break;
				}
			}
		
		
		// ----- PASSWORD ---- //
		if ( student.getPassword().trim().equals("") )
			errors.rejectValue("password", "required", "It is empty");
		else if ( student.getPassword().length() < 6 )
			errors.rejectValue("password",  "required", "Too long");
			
		
		// ------ MAIL ----- //
		if( student.getMail().trim().equals("") )
			errors.rejectValue("mail", "required", "It is empty");
		else {
			for ( int i = 0; i < studentsList.size(); i++ )
				if ( studentsList.get(i).getMail().toLowerCase().equals(student.getMail().toLowerCase() )) {
					errors.rejectValue("mail", "required", "It Already Exists");
					break;
				}
		}
				
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Student student = (Student) obj;
		
		if ( student.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "It is empty");
		else {
			int i = 0;
			boolean notFound = true;
			while ( notFound && i < studentsList.size() ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(student.getNid().toLowerCase()) )
					notFound = false;
				i++;
			}
			
			if ( notFound )
				errors.rejectValue("nid", "required", "Data Not Exist");
		}
					
	}

}
