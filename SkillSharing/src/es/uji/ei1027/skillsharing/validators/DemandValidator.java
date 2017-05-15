package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.model.Student;

public class DemandValidator implements ValidatorBeta {

	private List<Demand> demandsList;
	private List<Student> studentsList;
	private List<Collaboration> collaborationsList;
	private List<Skill> skillsList;
	boolean encontrado = false;
	
	public void setDemandDAO(DemandDAO demandDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao) {
		demandsList = demandDao.getDemands();
		studentsList = studentDao.getStudents();
		collaborationsList = collaborationDao.getCollaborations();
		skillsList = skillDao.getSkills();
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
			for ( int i = 0; i < studentsList.size(); i++ ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(demand.getNid().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			}
			if ( !encontrado )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
			encontrado = false;
		}
		
		
		// -------- NAME ----- //
		if ( demand.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( demand.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getName().toLowerCase().equals(demand.getName().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( encontrado )
				errors.rejectValue("name", "required", "El Name introducido ya está en uso");
			encontrado = false;
				
		}
		
		
		// ------- IDSKILL ------ //
		if ( demand.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( demand.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDSkill debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < skillsList.size(); i++ )
				if ( skillsList.get(i).getIdSkill().toLowerCase().equals(demand.getIdSkill().toLowerCase()) )  {
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

		Demand demand = (Demand) obj;
		
		
		// ------- IDDEMAND ------ /
		if ( demand.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDemand", "required", "Este IdDemand no existe");
			
			
		}
		
		
		// -------- NID -------- //
		if ( demand.getNid().trim().equals("") )
			errors.rejectValue("nid", "required", "Este campo es obligatorio");
		else if ( demand.getNid().length() != 9 )
			errors.rejectValue("nid", "required", "Tamaño incorrecto");
		else {
			for ( int i = 0; i < studentsList.size(); i++ ) {
				if ( studentsList.get(i).getNid().toLowerCase().equals(demand.getNid().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			}
			if ( !encontrado )
				errors.rejectValue("nid", "required", "El NID introducido no existe");
			encontrado = false;
		}
		
		
		// -------- NAME ----- //
		if ( demand.getName().trim().equals("") )
			errors.rejectValue("name", "required", "Este campo es obligatorio");
		else if ( demand.getName().length() < 5 )
			errors.rejectValue("name", "required", "El Name debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getName().toLowerCase().equals(demand.getName().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( encontrado )
				errors.rejectValue("name", "required", "El Name introducido ya está en uso");
			encontrado = false;
				
		}
		
		
		// ------- IDSKILL ------ /
		if ( demand.getIdSkill() .trim().equals("") )
			errors.rejectValue("idSkill", "required", "Este campo es obligatorio");
		else if ( demand.getIdSkill() .trim().length() > 5 )
			errors.rejectValue("idSkill", "required", "El IDSkill debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdSkill().toLowerCase().equals(demand.getIdSkill().toLowerCase()) )  {
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

		Demand demand = (Demand) obj;
		boolean encontrado = false;
		
		//---------- IDDEMAND ----------//
		
		for(int i = 0; i < collaborationsList.size(); i++){
			
			if (collaborationsList.get(i).getIdDemand().equals(demand.getIdDemand().trim().toLowerCase())){
				
				encontrado = true;
				break;
				
			}
			
		}
		
		if (encontrado){
			
			errors.rejectValue("idDemand", "required", "Esta demanda está siendo usada");
			
		}
		
		
		if ( demand.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDemand", "required", "Este IdDemand no existe");
			
			
		}
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Demand demand = (Demand) obj;
		boolean encontrado = false;
		
		//---------- IDDEMAND ----------//
		if ( demand.getIdDemand().trim().equals("") )
			errors.rejectValue("idDemand", "required", "Este campo es obligatorio");
		
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getIdDemand().toLowerCase().equals(demand.getIdDemand().toLowerCase()) )  {
					encontrado = true;
					break;
				}
			
			if (!encontrado)
				
				errors.rejectValue("idDemand", "required", "Este IdDemand no existe");
			
			
		}
		
	}

}
