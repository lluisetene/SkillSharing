package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.model.Student;

public class OfferValidator implements Validator {

	private List<Offer> offersList;
	private List<Student> studentsList;
	private List<Collaboration> collaborationsList;
	private List<Skill> skillsList;
	boolean encontrado = false;
	
	public void setOfferDAO(OfferDAO offerDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao) {
		offersList = offerDao.getOffers();
		studentsList = studentDao.getStudents();
		collaborationsList = collaborationDao.getCollaborations();
		skillsList = skillDao.getSkills();
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Offer.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Offer offer = (Offer) obj;
		
		// ------- IDOFFER ------ /
		if ( offer.getIdOffer() .trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "Este IdOffer ya está en uso");
					break;
				}
		}
		
		
		// -------- NID -------- //
		if ( offer.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( offer.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < studentsList.size(); i++ ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(offer.getNid().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			}
			if ( !encontrado )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
			encontrado = false;
		}
		
		
		// -------- NAME ----- //
		if ( offer.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( offer.getName().length() < 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getName().toLowerCase().equals(offer.getName().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( encontrado )
				errors.rejectValue("name", "required", "El nombre introducido ya está en uso");
			encontrado = false;
				
		}
		
		
		// ------- IDSKILL ------ /
		if ( offer.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( offer.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDSkill debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(offer.getIdSkill().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			if ( !encontrado )
				errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
			encontrado = false;
		}			
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {

		Offer offer = (Offer) obj;
		
		
		// ------- IDOFFER ------ /
		if ( offer.getIdOffer().trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idOffer", "required", "Este IDOffer no existe");
			
			
		}
		
		
		// -------- NID -------- //
		if ( offer.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( offer.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < studentsList.size(); i++ ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(offer.getNid().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			}
			if ( !encontrado )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
			encontrado = false;
		}
		
		
		// -------- NAME ----- //
		if ( offer.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( offer.getName().length() < 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		
		for ( int i = 0; i < offersList.size(); i++ )
			if ( offersList.get(i).getName().toLowerCase().equals(offer.getName().toLowerCase()) && offersList.get(i).getIdOffer().equals(offer.getIdOffer()) == false) {
				errors.rejectValue("name", "required", "Este name ya está en uso");
				break;
			}
		
		
		// ------- IDSKILL ------ /
		if ( offer.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( offer.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDSkill debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(offer.getIdSkill().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			if ( !encontrado )
				errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
			encontrado = false;
		}	
		
	}

	@Override
	public void validateDelete(Object obj, Errors errors) {

		Offer offer = (Offer) obj;
		
		//---------- IDOFFER ----------//
		
		for(int i = 0; i < collaborationsList.size(); i++){
			
			if (collaborationsList.get(i).getIdOffer().equals(offer.getIdOffer().trim().toLowerCase())){
				
				errors.rejectValue("idOffer", "required", "No se puede borrar, elimina primero las colaboraciones que tengan esta oferta");
				
			}
			
		}
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Offer offer = (Offer) obj;
		boolean encontrado = false;
		
		//---------- IDOFFER ----------//
		if ( offer.getIdOffer().trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idOffer", "required", "Este IDOffer no existe");
			
			
		}
		
	}

}
