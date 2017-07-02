package es.uji.ei1027.skillsharing.validators;

import java.util.List;

import org.springframework.validation.Errors;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.model.Student;

public class DemandValidator implements Validator {

	private List<Demand> demandsList;
	private List<Student> studentsList;
	private List<Collaboration> collaborationsList;
	private List<Skill> skillsList;
	boolean encontrado = false;
	private StudentDAO studentDao;
	private DemandDAO demandDao;
	
	public void setDemandDAO(DemandDAO demandDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao) {
		demandsList = demandDao.getDemands();
		studentsList = studentDao.getStudents();
		collaborationsList = collaborationDao.getCollaborations();
		skillsList = skillDao.getSkills();
		this.studentDao = studentDao;
		this.demandDao = demandDao;
	}
	
	@Override
	public boolean supports(Class<?> cls) {
		return Demand.class.equals(cls);
	}

	@Override
	public void validateAdd(Object obj, Errors errors) {
		Demand demand = (Demand) obj;
		
		
		// ------- IDDEMAND ------ /

		for ( int i = 0; i < demandsList.size(); i++ )
			if ( demandsList.get(i).getIdDemand() == demand.getIdDemand() )  {
				errors.rejectValue("idDemand", "required", "Este IdDemand ya está en uso");
				break;
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
		else if ( demand.getName().length() <= 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		else {
			for ( int i = 0; i < demandsList.size(); i++ )
				if ( demandsList.get(i).getName().toLowerCase().equals(demand.getName().toLowerCase()) ) {
					encontrado = true;
					break;
				}
			if ( encontrado )
				errors.rejectValue("name", "required", "El nombre introducido ya está en uso");
			encontrado = false;
				
		}
		

		
		// ------- IDSKILL ------ //
		
		for ( int i = 0; i < skillsList.size(); i++ )
			if ( skillsList.get(i).getIdSkill() == demand.getIdSkill() )  {
				encontrado = true;
				break;
			}
		if ( !encontrado )
			errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
		encontrado = false;
	}				

	@Override
	public void validateUpdate(Object obj, Errors errors) {

		Demand demand = (Demand) obj;
		
		
		// ------- IDOFFER ------ /
		
		for ( int i = 0; i < demandsList.size(); i++ )
			if ( demandsList.get(i).getIdDemand() == demand.getIdDemand() )  {
				encontrado = true;
				break;
			}
		
		if (!encontrado)
			
			errors.rejectValue("idDemand", "required", "Este IDDemand no existe");
		
		encontrado = false;
		
		
		
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
		else if ( demand.getName().length() <= 5 )
			errors.rejectValue("name", "required", "El nombre debe tener más de 5 caracteres");
		
		for ( int i = 0; i < demandsList.size(); i++ )
			if ( demandsList.get(i).getName().toLowerCase().equals(demand.getName().toLowerCase()) && demandsList.get(i).getIdDemand() == demand.getIdDemand() == false) {
				errors.rejectValue("name", "required", "Este nombre ya está en uso");
				break;
			}
		
		// ------- IDSKILL ------ /
		
		
		for ( int i = 0; i < skillsList.size(); i++ )
			if ( skillsList.get(i).getIdSkill() == demand.getIdSkill() )  {
				encontrado = true;
				break;
			}
		if ( !encontrado )
			errors.rejectValue("idSkill", "required", "El IdSkill introducido no existe");
		encontrado = false;
	}	
		


	@Override
	public void validateDelete(Object obj, Errors errors) {
		
		
	}

	@Override
	public void validateConsult(Object obj, Errors errors) {

		Demand demand = (Demand) obj;
		boolean encontrado = false;
		
		//---------- IDDEMAND ----------//
	
		for ( int i = 0; i < demandsList.size(); i++ )
			if ( demandsList.get(i).getIdDemand() == demand.getIdDemand() )  {
				encontrado = true;
				break;
			}
		
		if (!encontrado)
			
			errors.rejectValue("idDemand", "required", "Este IdDemand no existe");
		
		
	}
		

}
