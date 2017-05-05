package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Student;

public class OfferValidator implements Validator {

	private List<Offer> offersList;
	private List<Student> studentsList;
	boolean notFound = true;
	
	public void setOfferDAO(OfferDAO offerDao, StudentDAO studentDao) {
		offersList = offerDao.getOffers();
		studentsList = studentDao.getStudents();
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
		System.out.println("------------------------");
		if ( offer.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( offer.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < studentsList.size(); i++ ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(offer.getNid().toLowerCase()) ) {
					notFound = false;
					break;
				}
			}
			if ( notFound )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
			notFound = true;
		}
		
		
		// -------- NAME ----- //
		if ( offer.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( offer.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
//		else {
//			for ( int i = 0; i < offersList.size(); i++ )
//				if ( offersList.get(i).getName().toLowerCase().equals(offer.getName().toLowerCase()) ) {
//					notFound = false;
//					break;
//				}
//			if ( notFound )
//				errors.rejectValue("name", "required", "El Name introducido no existe");
//			notFound = true;
//				
//		}
		
		
		// ------- IDSKILL ------ /
		if ( offer.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( offer.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDOffer debe tener menos de 5 caracteres");
		else {
			for ( int i = 0; i < offersList.size(); i++ )
				if ( offersList.get(i).getIdSkill().toLowerCase().equals(offer.getIdSkill().toLowerCase()) )  {
					notFound = false;
					break;
				}
			if ( notFound )
				errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
			notFound = true;
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
					notFound = false;
					break;
				}
			if ( notFound )
				errors.rejectValue("idOffer", "required", "El IdSkill introducido no existe");
			notFound = true;
		}
	}

}
