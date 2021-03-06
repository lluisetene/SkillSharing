package es.uji.ei1027.skillsharing.validators;
import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;


public class CollaborationValidator implements Validator {

	private List<Collaboration> collaborationsList;
	private List<Offer> offersList;
	private List<Demand> demandsList;
	private StudentDAO studentDao;
	boolean encontrado = false;
	
	private DemandDAO demandDao;
	
	public void setCollaborationDAO(CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao, StudentDAO studentDao) {
	
		collaborationsList = collaborationDao.getCollaborations();
		offersList = offerDao.getOffers();
		demandsList = demandDao.getDemands();
		this.studentDao = studentDao;
		this.demandDao = demandDao;
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Collaboration.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
		String NIDoferta = null;
		String NIDdemand = null;
		int idSkillOffer = -1;
		int idSkillDemand = -1;
		
		

		for (int i = 0; i < offersList.size(); i++){
			
			if (offersList.get(i).getIdOffer() == collaboration.getIdOffer()){
				
				NIDoferta = offersList.get(i).getNid();
				idSkillOffer = offersList.get(i).getIdSkill();
				
			}
		}
		
		for (int i = 0; i < demandsList.size(); i++){	
			
			if (demandsList.get(i).getIdDemand() ==collaboration.getIdDemand()){
			
				NIDdemand = demandsList.get(i).getNid();
				idSkillDemand = demandsList.get(i).getIdSkill();
				
		}
		}
		
	
		
		// ------ IDCOLLABORATION -------- //
	
		for ( int i = 0; i < collaborationsList.size(); i++ )
			if ( collaborationsList.get(i).getIdCollaboration() == collaboration.getIdCollaboration() )  {
				errors.rejectValue("idCollaboration", "required", "Este IdCollaboration ya está en uso");
				break;
		}

		
		// ------ IDOFFER ----------- //
		
		for ( int i = 0; i < offersList.size(); i++ )
			if ( offersList.get(i).getIdOffer() == collaboration.getIdOffer() ) {
				encontrado = true;
				break;
			}
		if ( !encontrado ) {
			errors.rejectValue("idOffer", "required", "El IdOffer introducido no existe");
			
		}
		encontrado = false;
		
		
		
		
		// ------- IDDEMAND ----------- //
	
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand() == collaboration.getIdDemand()) {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idDemand", "required", "El IdDemand introducido no existe");
				
			}
			encontrado = false;
		
		
		
		
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {
	
	}
	
	
		
		
	

	@Override
	public void validateDelete(Object obj, Errors errors) {
		
		//Pendiente de ser borrado
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
	

		for ( int i = 0; i < collaborationsList.size(); i++ )
			if ( collaborationsList.get(i).getIdCollaboration() == collaboration.getIdCollaboration() )  {
				encontrado = true;
				break;
			}
		if ( !encontrado ) {
			errors.rejectValue("idCollaboration", "required", "El IdCollaboration introducido no existe");
			encontrado = false;
		}
	}


}