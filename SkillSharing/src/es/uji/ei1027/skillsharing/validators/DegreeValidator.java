package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Student;

public class DegreeValidator implements Validator {

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
		
		for ( int i = 0; i < degreesList.size(); i++ )
			if ( degreesList.get(i).getIdDegree() == degree.getIdDegree() )  {
				errors.rejectValue("idDegree", "required", "Este IdDegree ya está en uso");
				break;
			}
		
		
		// -------- NAME ----- //
		if ( degree.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( degree.getName().length() <= 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getName().toLowerCase().equals(degree.getName().toLowerCase()) &&
						degree.getNid().trim().toLowerCase().equals(degreesList.get(i).getNid().trim().toLowerCase()))  {
					errors.rejectValue("name", "required", "Este grado ya contiene al estudiante");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( degree.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( degree.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
		
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
		
		for ( int i = 0; i < degreesList.size(); i++ )
			if ( degreesList.get(i).getIdDegree() == degree.getIdDegree() )  {
				encontrado = true;
				break;
			}
		
		if (!encontrado)
			
			errors.rejectValue("idDegree", "required", "Este IDDegree no existe");
		
		
		
		
		// -------- NAME ----- //
		if ( degree.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( degree.getName().length() <= 5 ){
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		}
	  
		for (int i = 0; i < degreesList.size(); i++){
			
			if (degreesList.get(i).getName().trim().toLowerCase().equals(degree.getName().trim().toLowerCase()) && degreesList.get(i).getIdDegree() != degree.getIdDegree()){
				
				errors.rejectValue("name", "required", "Este nombre de grado ya está en uso");
				break;
			}
			
		}
		
	}


	@Override
	public void validateDelete(Object obj, Errors errors) {

		//Pendiente de borrar
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Degree degree = (Degree) obj;
		boolean encontrado = false;
		
		//---------- IDDEGREE ----------//
		
		for ( int i = 0; i < degreesList.size(); i++ )
			if ( degreesList.get(i).getIdDegree() == degree.getIdDegree() )  {
				encontrado = true;
				break;
			}
		
		if (!encontrado)
			
			errors.rejectValue("idDegree", "required", "Este IDDegree no existe");
		
		
	
	}

}
