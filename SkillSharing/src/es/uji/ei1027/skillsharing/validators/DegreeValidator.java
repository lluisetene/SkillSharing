package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.model.Degree;

public class DegreeValidator implements Validator {

	private List<Degree> degreesList;
	
	public void setDegreeDAO(DegreeDAO degreeDao) {
		degreesList = degreeDao.getDegrees();
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
			errors.rejectValue("idDegree", "required", "It is empty");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					errors.rejectValue("idDegree", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( degree.getName().trim().equals("") )
			errors.rejectValue("name", "required", "It is empty");
		else if ( degree.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getName().toLowerCase().equals(degree.getName().toLowerCase()) )  {
					errors.rejectValue("name", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( degree.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "It is empty");
		else if ( degree.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Too long");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getNid().toLowerCase().equals(degree.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "It Already Exists");
					break;
				}
			}
		
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Degree degree = (Degree) obj;
		
		if ( degree.getIdDegree() .trim().equals("") )
			errors.rejectValue("idDegree", "required", "It is empty");
		else {
			for ( int i = 0; i < degreesList.size(); i++ )
				if ( degreesList.get(i).getIdDegree().toLowerCase().equals(degree.getIdDegree().toLowerCase()) )  {
					errors.rejectValue("idDegree", "required", "It Already Exists");
					break;
				}
		}
	}

}
