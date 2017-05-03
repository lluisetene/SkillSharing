package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.model.Offer;

public class OfferValidator implements Validator {

	private List<Offer> offersList;
	
	public void setOfferDAO(OfferDAO offerDao) {
		offersList = offerDao.getOffers();
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
		else if ( offer.getIdOffer() .trim().length() > 5 )
			errors.rejectValue("idOffer", "required", "El IDOffer debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "Este IDOffer ya está en uso");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( offer.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( offer.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getNid().toLowerCase().equals(offer.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "Este NID ya está en uso");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( offer.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( offer.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		
		
		// ------- IDoffer ------ /
		if ( offer.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( offer.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDOffer debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdSkill().toLowerCase().equals(offer.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "Este IDOffer ya está en uso");
					break;
				}
		}				
	}
	@Override
	public void validateSearch(Object obj, Errors errors) {
		Offer offer = (Offer) obj;
		
		// ------- IDOFFER ------ /
		if ( offer.getIdOffer() .trim().equals("") )
			errors.rejectValue("idOffer", "required", "Este campo es obligatorio");
		else if ( offer.getIdOffer() .trim().length() > 5 )
			errors.rejectValue("idOffer", "required", "El IDOffer debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "Este IDOffer ya está en uso");
					break;
				}
		}
	}

}
