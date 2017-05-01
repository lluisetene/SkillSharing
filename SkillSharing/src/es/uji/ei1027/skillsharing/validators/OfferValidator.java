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
			errors.rejectValue("idOffer", "required", "It is empty");
		else if ( offer.getIdOffer() .trim().length() > 5 )
			errors.rejectValue("idOffer", "required", "Too long");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NID -------- //
		if ( offer.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "It is empty");
		else if ( offer.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Too long");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getNid().toLowerCase().equals(offer.getNid().toLowerCase()) ) {
					errors.rejectValue("nid", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( offer.getName().trim().equals("") )
			errors.rejectValue("name", "required", "It is empty");
		else if ( offer.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		
		
		// ------- IDoffer ------ /
		if ( offer.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "It is empty");
		else if ( offer.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "Too long");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdSkill().toLowerCase().equals(offer.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "It Already Exists");
					break;
				}
		}				
	}
	@Override
	public void validateSearch(Object obj, Errors errors) {
		Offer offer = (Offer) obj;
		
		// ------- IDOFFER ------ /
		if ( offer.getIdOffer() .trim().equals("") )
			errors.rejectValue("idOffer", "required", "It is empty");
		else if ( offer.getIdOffer() .trim().length() > 5 )
			errors.rejectValue("idOffer", "required", "Too long");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdOffer().toLowerCase().equals(offer.getIdOffer().toLowerCase()) )  {
					errors.rejectValue("idOffer", "required", "It Already Exists");
					break;
				}
		}
	}

}
