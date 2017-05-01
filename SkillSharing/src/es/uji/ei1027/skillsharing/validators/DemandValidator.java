package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.model.Demand;

public class DemandValidator implements Validator {

	private List<Demand> demandsList;
	
	public void setDemandDAO(DemandDAO demandDao) {
		demandsList = demandDao.getDemands();
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Demand.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Demand demand = (Demand) obj;
		
		// ------- IDDEMAND ------ /
		if ( demand.getIdDemand() .trim().equals("") )
			errors.rejectValue("idDemand", "required", "It is empty");
		else if ( demand.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "Too long");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					errors.rejectValue("idDemand", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( demand.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "It is empty");
		else if ( demand.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Too long");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getNid().toLowerCase().equals(demand.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( demand.getName().trim().equals("") )
			errors.rejectValue("name", "required", "It is empty");
		else if ( demand.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		
		
		// ------- IDDEMAND ------ /
		if ( demand.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "It is empty");
		else if ( demand.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "Too long");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdSkill().toLowerCase().equals(demand.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "It Already Exists");
					break;
				}
		}				
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Demand demand = (Demand) obj;
		
		// ------- IDDEMAND ------ /
		if ( demand.getIdDemand() .trim().equals("") )
			errors.rejectValue("idDemand", "required", "It is empty");
		else if ( demand.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "Too long");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					errors.rejectValue("idDemand", "required", "It Already Exists");
					break;
				}
		}		
	}

}
