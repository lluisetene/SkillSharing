package es.uji.ei1027.skillsharing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.validators.SkillValidator;

@Controller
@RequestMapping("/skill")
public class SkillController {
	
	private SkillDAO skillDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	private StudentDAO studentDao;
	private DegreeDAO degreeDao;
	private AdminDAO adminDao;
	private CollaborationDAO collaborationDao;
	
	@Autowired
	public void setSkillDao(SkillDAO skillDao, OfferDAO offerDao, DemandDAO demandDao, StudentDAO studentDao, DegreeDAO degreeDao, AdminDAO adminDao, CollaborationDAO collaborationDao) {
		this.skillDao = skillDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.studentDao = studentDao;
		this.degreeDao = degreeDao;
		this.adminDao = adminDao;
		this.collaborationDao = collaborationDao;
		
	}
	
	//---------- página de métodos ---------
	
	@RequestMapping("/main")
	public String mainSkills(Model model) {
		
		return "skill/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listSkill(Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		
		return "skill/list";
		
	}
	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultSkill(Model model) {
		
		//Guardo en el atributo skill el objeto de tipo skill.
		model.addAttribute("skill", new Skill());
	
		return "skill/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult, Model model) {
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateConsult(skill, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "skill/consult";
		
		model.addAttribute("skillResponse", skillDao.getSkill(skill.getIdSkill()));
		
		return "skill/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addSkill(Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		//Esto deberia ir en el modelo pero de momento se queda aqui por las pruebas
		//IdSkill automática
		
		List<Skill> skills= skillDao.getSkills();
		Skill skill = new Skill();
		int idSkill;
		
		if (skills.isEmpty()){
			
			idSkill = 1;
			skill.setIdSkill(idSkill);
			
		}else{
		
			idSkill = skills.get(0).getIdSkill() + 1;
			skill.setIdSkill(idSkill);
		}
		model.addAttribute("skill", skill);
		//----------------------------------------
		
		return"skill/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateAdd(skill, bindingResult);
		
		if (bindingResult.hasErrors())
	
			return "skill/add";
			
		skillDao.addSkill(skill);
		
		 return "redirect:../admin/main.html";
		
	}
	
	//----------- actualización ------------------
	@RequestMapping(value="/update/{idSkill}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable int idSkill) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("skill", skillDao.getSkill(idSkill));
		
		return "skill/update"; 
		
	}
	
	@RequestMapping(value="/update/{idSkill}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable int idSkill, @ModelAttribute("skill") Skill skill, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateUpdate(skill, bindingResult);
		
		
		if (bindingResult.hasErrors()) 
			
			 return "skill/update";
		
		 skillDao.updateSkill(skill);
		 
		 return "redirect:../../admin/main.html";
		 
	  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idSkill}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable int idSkill) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("skill", skillDao.getSkill(idSkill));
		
		return "skill/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idSkill}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable int idSkill, @ModelAttribute("skill") Skill skill, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		if (bindingResult.hasErrors()) 
			
			 return "skill/delete";
		
		List<Offer> offerList = offerDao.getOffersWithoutDateRestriction();
		
		for (int i = 0; i < offerList.size(); i++){
			
			if (skill.getIdSkill() == offerList.get(i).getIdSkill()){
				
				model.addAttribute("Error", true);
				return "skill/delete";
			}
			
		}
		
		List<Demand> demandList = demandDao.getDemandsWithoutDateRestrict();
		
		for (int i = 0; i < demandList.size(); i++){
			
			if (skill.getIdSkill() == demandList.get(i).getIdSkill()){
				
				model.addAttribute("Error", true);
				return "skill/delete";
			}
			
		}
		 skillDao.deleteSkill(idSkill);
		 
		 return "redirect:../../admin/main.html";
		 
	  }
	
}