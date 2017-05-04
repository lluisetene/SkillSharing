package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.model.Demand;

public class DemandValidator implements Validator {

	private List<Demand> demandsList;
	boolean notFound = true;
	
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
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		else if ( demand.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "El IdDemand debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					errors.rejectValue("idDemand", "required", "Este IdDemand ya está en uso");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( demand.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( demand.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getNid().toLowerCase().equals(demand.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "Este NID ya está en uso");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( demand.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( demand.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
		
		// ------- IDSKILL ------ /
		if ( demand.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( demand.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IdSkill debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdSkill().toLowerCase().equals(demand.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "Este IdSkill ya está en uso");
					notFound = false;
					break;
				}
			if ( notFound )
				errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
		}				
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Demand demand = (Demand) obj;
		
		// ------- IDDEMAND ------ /
		if ( demand.getIdDemand() .trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		else if ( demand.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "El IdDemand debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					notFound = false;
					break;
				}
			if ( notFound )
				errors.rejectValue("idDemand", "required", "El IdDemand introducido no existe");
		}		
	}

}
