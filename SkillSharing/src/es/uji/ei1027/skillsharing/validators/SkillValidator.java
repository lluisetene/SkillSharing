package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Skill;

public class SkillValidator implements ValidatorBeta {

	private List<Skill> skillsList;
	private List<Offer> offerList;
	private List<Demand> demandList;
	
	public void setSkillDAO(SkillDAO skillDao, OfferDAO offerDao, DemandDAO demandDao) {
	
		skillsList = skillDao.getSkills();
		offerList = offerDao.getOffers();
		demandList = demandDao.getDemands();
		
	}

	
	@Override
	public boolean supports(Class<?> cls) {
		return Skill.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		
		Skill skill = (Skill) obj;
		
		//---------- IDSKILL ----------//
		if ( skill.getIdSkill().trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "Este IDSkill ya está en uso");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( skill.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( skill.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
	}

	@Override
	public void validateUpdate(Object obj, Errors errors) {
			
		Skill skill = (Skill) obj;
		boolean encontrado = false;
		
		//---------- IDSKILL ----------//
		if ( skill.getIdSkill().trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idSkill", "required", "Este IDSkill no existe");
			
			
		}
		
		// -------- NAME ----- //
		if ( skill.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( skill.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		
	}

	@Override
	public void validateDelete(Object obj, Errors errors) {

		Skill skill = (Skill) obj;
		boolean encontrado = false;
		
		for (int i = 0; i < offerList.size(); i++){
			
			if (skill.getIdSkill().equals(offerList.get(i).getIdSkill())){
				
				errors.rejectValue("idSkill", "required", "Esta habilidad está siendo usada");
				break;
			}
			
		}
		
		for (int i = 0; i < demandList.size(); i++){
			
			if (skill.getIdSkill().equals(demandList.get(i).getIdSkill())){
				
				errors.rejectValue("idSkill", "required", "Esta habilidad está siendo usada");
				break;
			}
			
		}
		
		if ( skill.getIdSkill().trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
	
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
		
				errors.rejectValue("idSkill", "required", "Este IDSkill no existe");
		}
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Skill skill = (Skill) obj;
		boolean encontrado = false;
		
		//---------- IDSKILL ----------//
		if ( skill.getIdSkill().trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idSkill", "required", "Este IDSkill no existe");
		
		}
	}
}

