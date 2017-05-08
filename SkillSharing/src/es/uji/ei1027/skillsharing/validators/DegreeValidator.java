package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Student;

public class DegreeValidator implements ValidatorBeta {

	private List<Degree> degreesList;
	private List<Student> studentList;
	boolean notFound = true;
	
	public void setDegreeDAO(DegreeDAO degreeDao, StudentDAO studentDao) {
		degreesList = degreeDao.getDegrees();
		studentList = studentDao.getStudents();
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Degree.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Degree degree = (Degree) obj;
		
		
		// ----- IDDEGREE ------ //
		if ( degree.getIdDegree() .trim().equals("") )
			errors.rejectValue("idDegree", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					errors.rejectValue("idDegree", "required", "Este IdDegree ya está en uso");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( degree.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( degree.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getName().toLowerCase().equals(degree.getName().toLowerCase()) )  {
					errors.rejectValue("name", "required", "Este Name ya está en uso");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( degree.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( degree.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getNid().toLowerCase().equals(degree.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "Este NID ya está en uso");
					notFound = false;
					break;
				}
			
			for (int i = 0; i < studentList.size(); i++){
				
				if (degree.getNid().equals(studentList.get(i).getNid())){
					
					notFound = false;
					break;
					
				}else{
					
					notFound = true;
					
				}
				
			}
			
			if (notFound){
				
				errors.rejectValue("nid", "required", "Este NID no existe");
				
			}
			
		}
		
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {
		
		Degree degree = (Degree) obj;
		boolean encontrado = false;
		
		//---------- IDDEGREE ----------//
		if ( degree.getIdDegree().trim().equals("") )
			errors.rejectValue("idDegree", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDegree", "required", "Este IDDegree no existe");
			
			
		}
		
		// -------- NAME ----- //
		if ( degree.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( degree.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getName().toLowerCase().equals(degree.getName().toLowerCase()) )  {
					errors.rejectValue("name", "required", "Este Name ya está en uso");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( degree.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( degree.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else{	
			for (int i = 0; i < studentList.size(); i++){
				
				if (degree.getNid().equals(studentList.get(i).getNid())){
					
					notFound = false;
					break;
					
				}else{
					
					notFound = true;
					
				}
				
			}
			
			if (notFound){
				
				errors.rejectValue("nid", "required", "Este NID no existe");
				
			}
		}
		
	}


	@Override
	public void validateDelete(Object obj, Errors errors) {

		Degree degree = (Degree) obj;
		boolean encontrado = false;
		
		//---------- IDDEGREE ----------//
		if ( degree.getIdDegree().trim().equals("") )
			errors.rejectValue("idDegree", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDegree", "required", "Este IDDegree no existe");
			
			
		}
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Degree degree = (Degree) obj;
		boolean encontrado = false;
		
		//---------- IDDEGREE ----------//
		if ( degree.getIdDegree().trim().equals("") )
			errors.rejectValue("idDegree", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDegree", "required", "Este IDDegree no existe");
			
			
		}
		
	}

}
