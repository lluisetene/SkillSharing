package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.model.Skill;

public class SkillValidator implements Validator {

	private List<Skill> skillsList;
	
	public void setSkillDAO(SkillDAO skillDao) {
		skillsList = skillDao.getSkills();
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
			errors.rejectValue("idSkill", "required", "It is empty");
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )  {
					errors.rejectValue("idSkill", "required", "It Already Exists");
					break;
				}
		}
		
		// -------- NAME ----- //
		if ( skill.getName().trim().equals("") )
			errors.rejectValue("name", "required", "It is empty");
		else if ( skill.getName().length() < 5 )
			errors.rejectValue("name", "required", "Too long");
		
	}

	@Override
	public void validateSearch(Object obj, Errors errors) {
		Skill skill = (Skill) obj;
		
		//---------- IDSKILL ----------//
		if ( skill.getIdSkill().trim().equals("") )
			errors.rejectValue("idSkill", "required", "It is empty");
		else {
			int i = 0;
			boolean notFound = true;
			while ( notFound && i < skillsList.size() ) {
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(skill.getIdSkill().toLowerCase()) )
					notFound = false;
				i++;
			}
			
			if ( notFound )
				errors.rejectValue("idSkill", "required", "Data Not Exist");
		}		
	}

}
