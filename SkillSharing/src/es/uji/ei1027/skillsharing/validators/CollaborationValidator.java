package es.uji.ei1027.skillsharing.validators;
import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;


public class CollaborationValidator implements Validator {

	private List<Collaboration> collaborationsList;
	
	public void setCollaborationDAO(CollaborationDAO collaborationDao) {
		collaborationsList = collaborationDao.getCollaborations();
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Collaboration.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
		
		// ------ IDCOLLABORATION -------- //
		if ( collaboration.getIdCollaboration() .trim().equals("") )
			errors.rejectValue("idCollaboration", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdCollaboration() .trim().length() > 5 )
			errors.rejectValue("idCollaboration", "required", "El IDCollaboration debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdCollaboration().toLowerCase().equals(collaboration.getIdCollaboration().toLowerCase()) )  {
					errors.rejectValue("idCollaboration", "required", "Este IDCollaboration ya está en uso");
					break;
				}
		}
		
		// ------ IDOFFER ----------- //
		if ( collaboration.getIdOffer().trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdOffer() .trim().length() > 5 )
			errors.rejectValue("idOffer", "required", "El IDOffer debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdOffer().toLowerCase().equals(collaboration.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "Este IDOffer ya está en uso");
					break;
				}
		}
		
		// ------- IDDEMAND ----------- //
		if ( collaboration.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "El IDDemand debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdDemand().toLowerCase().equals(collaboration.getIdDemand().toLowerCase()) )  {
					errors.rejectValue("idDemand", "required", "Este IDDemand ya está en uso");
					break;
				}
		}
		
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
		
		if ( collaboration.getIdCollaboration() .trim().equals("") )
			errors.rejectValue("idCollaboration", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdCollaboration() .trim().length() > 5 )
			errors.rejectValue("idCollaboration", "required", "El IDCollaboration debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdCollaboration().toLowerCase().equals(collaboration.getIdCollaboration().toLowerCase()) )  {
					errors.rejectValue("idCollaboration", "required", "Este IDCollaboration ya está en uso");
					break;
				}
		}
	}

}
