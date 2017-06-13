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
	
	public void setCollaborationDAO(CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao, StudentDAO studentDao) {
	
		collaborationsList = collaborationDao.getCollaborations();
		offersList = offerDao.getOffers();
		demandsList = demandDao.getDemands();
		this.studentDao = studentDao;
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
		String idSkillOffer = null;
		String idSkillDemand = null;
		
		for (int i = 0; i < collaborationsList.size(); i++){
			
			if (collaborationsList.get(i).getIdOffer().equals(collaboration.getIdOffer()) && collaborationsList.get(i).getIdDemand().equals(collaboration.getIdDemand())){
				
				errors.rejectValue("idCollaboration", "required", "Las IdOffer e IdDemand ya existen como colaboración");
			
			}
			
		}

		for (int i = 0; i < offersList.size(); i++){
			
			if (offersList.get(i).getIdOffer().equals(collaboration.getIdOffer())){
				
				NIDoferta = offersList.get(i).getNid();
				idSkillOffer = offersList.get(i).getIdSkill();
				
			}
		}
		
		for (int i = 0; i < demandsList.size(); i++){	
			
			if (demandsList.get(i).getIdDemand().equals(collaboration.getIdDemand())){
			
				NIDdemand = demandsList.get(i).getNid();
				idSkillDemand = demandsList.get(i).getIdSkill();
				
		}
			
		}
		System.out.println("idSkillOffer: " + idSkillOffer);
		System.out.println("idSkillDemand: " + idSkillDemand);
		
		if ((NIDoferta != null && NIDdemand != null) && NIDoferta.equals(NIDdemand)){
			
			errors.rejectValue("idCollaboration", "required", "No puedes crear una colaboración en el que la oferta y la demanda sea del mismo estudiante");
			
		}else if((idSkillOffer != null && idSkillDemand != null) && idSkillOffer.split("/")[0].equals(idSkillDemand.split("/")[0]) == false)
	
			errors.rejectValue("idCollaboration", "required", "La oferta y la demanda no tienen la misma habilidad");
		
		//----------Control de horas--------------------//
		if (Integer.parseInt(studentDao.getStudent(NIDdemand).getDemandHours().split(":")[0]) - Integer.parseInt(studentDao.getStudent(NIDdemand).getOfferHours().split(":")[0]) > 20){
			
			errors.rejectValue("idDemand", "required", "El NID " + studentDao.getStudent(NIDdemand) + "no tiene saldo");
			
		}
	
		
		// ------ IDCOLLABORATION -------- //
		if ( collaboration.getIdCollaboration() .trim().equals("") )
			errors.rejectValue("idCollaboration", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdCollaboration().toLowerCase().equals(collaboration.getIdCollaboration().toLowerCase()) )  {
					errors.rejectValue("idCollaboration", "required", "Este IdCollaboration ya está en uso");
					break;
			}
		}
		
		// ------ IDOFFER ----------- //
		if ( collaboration.getIdOffer().trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(collaboration.getIdOffer().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idOffer", "required", "El IdOffer introducido no existe");
				
			}
			encontrado = false;
			
		}
		
		
		// ------- IDDEMAND ----------- //
		if ( collaboration.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "Este IdDemand debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(collaboration.getIdDemand().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idDemand", "required", "El IdDemand introducido no existe");
				
			}
			encontrado = false;
		
		}
		
		
		
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
		boolean encontrado = false;
		boolean valido = false;
		
		
		//---------- IDCOLLABORATION ----------//
		if ( collaboration.getIdCollaboration().trim().equals("") )
			errors.rejectValue("idCollaboration", "required", "Este campo es obligatorio");
		
		else {
			
			for (int i = 0; i < collaborationsList.size(); i++){
				
				if (collaborationsList.get(i).getIdCollaboration().equals(collaboration.getIdCollaboration().trim()) && collaborationsList.get(i).getIdOffer().equals(collaboration.getIdOffer().trim()) && collaborationsList.get(i).getIdDemand().equals(collaboration.getIdDemand().trim())){
					valido = true;
					break;
				}
				
				
			}
			
			if (!valido){
				
				errors.rejectValue("idCollaboration", "required", "Las IdOffer e IdDemand no figuran como colaboración");
				
			}
			
			
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdCollaboration().toLowerCase().equals(collaboration.getIdCollaboration().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idCollaboration", "required", "Este IDCollaboration no existe");
			
			
		}
		
		// ------ IDOFFER ----------- //
		if ( collaboration.getIdOffer().trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(collaboration.getIdOffer().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idOffer", "required", "El IdOffer introducido no existe");
				
			}
			encontrado = false;
			
		}
		
		
		// ------- IDDEMAND ----------- //
		if ( collaboration.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		else if ( collaboration.getIdDemand() .trim().length() > 5 )
			errors.rejectValue("idDemand", "required", "Este IdDemand debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(collaboration.getIdDemand().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idDemand", "required", "El IdDemand introducido no existe");
				
			}
			encontrado = false;
		
		}
	}

	@Override
	public void validateDelete(Object obj, Errors errors) {
		
		//Pendiente de ser borrado
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {
		Collaboration collaboration = (Collaboration) obj;
		
		if ( collaboration.getIdCollaboration() .trim().equals("") )
			errors.rejectValue("idCollaboration", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < collaborationsList.size(); i++ )
				if ( collaborationsList.get(i).getIdCollaboration().toLowerCase().equals(collaboration.getIdCollaboration().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			if ( !encontrado ) {
				errors.rejectValue("idCollaboration", "required", "El IdCollaboration introducido no existe");
				encontrado = false;
			}
		}
		
	}

}