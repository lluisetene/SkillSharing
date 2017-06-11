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
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.validators.DegreeValidator;

@Controller
@RequestMapping("/degree")
public class DegreeController {

	private DegreeDAO degreeDao;
	private StudentDAO studentDao;
	private AdminDAO adminDao;
	private SkillDAO skillDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	private CollaborationDAO collaborationDao;
	
	@Autowired
	public void setDegreeDao(DegreeDAO degreeDao, StudentDAO studentDao, AdminDAO adminDao, SkillDAO skillDao, OfferDAO offerDao, DemandDAO demandDao, CollaborationDAO collaborationDao) {
		
		this.degreeDao = degreeDao;
		this.studentDao = studentDao;
		this.adminDao = adminDao;
		this.skillDao = skillDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.collaborationDao = collaborationDao;
		
	}
	
	//---------- página de métodos ---------
	
	@RequestMapping("/main")
	public String mainDegrees(Model model) {
		
		return "degree/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listDegree(Model model) {
		
		model.addAttribute("degrees", degreeDao.getDegrees());
		
		return "degree/list";
		
	}
	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultDemand(Model model) {
		
		//Guardo en el atributo degree el objeto de tipo degree.
		model.addAttribute("degree", new Degree());
		
		return "degree/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("degree") Degree degree, BindingResult bindingResult, Model model) {
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateConsult(degree, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "degree/consult";
		
		model.addAttribute("degreeResponse", degreeDao.getDegreeList(degree.getIdDegree()));
		
		return "degree/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addDegree(Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("degree", new Degree());
		
		//Esto deberia ir en el modelo pero de momento se queda aqui por las pruebas
		//IdDegree automática
		
		List<Degree> degrees= degreeDao.getDegrees();
		Degree degree = new Degree();
		String idDegree;
		
		if (degrees.isEmpty()){
			
			idDegree = "1";
			degree.setIdDegree(idDegree);
			
		}else{
			
			idDegree = String.valueOf(Integer.parseInt(degrees.get(0).getIdDegree()) + 1);
			degree.setIdDegree(idDegree);
		}

		model.addAttribute("degree", degree);
		
		return"degree/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("degree") Degree degree, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateAdd(degree, bindingResult);
		
		if (bindingResult.hasErrors())
	
			return "degree/add";
			
		degreeDao.addDegree(degree);
		
		return "redirect:../admin/main.html";
		
	}
	

	//----------- actualización ------------------
	@RequestMapping(value="/update/{idDegree}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String idDegree) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("degree", degreeDao.getDegree(idDegree));
		
		return "degree/update"; 
		
	}
	
	@RequestMapping(value="/update/{idDegree}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String idDegree, @ModelAttribute("degree") Degree degree, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateUpdate(degree, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "degree/update";
		
		 degreeDao.updateDegree(degree);
		 
		 return "redirect: ../../admin/main.html";
		 
	  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idDegree}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String idDegree) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("degree", degreeDao.getDegree(idDegree));
		
		return "degree/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idDegree}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String idDegree, @ModelAttribute("degree") Degree degree, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		if (bindingResult.hasErrors()) 
			
			 return "degree/delete";
		
		 degreeDao.deleteDegree(idDegree);
		 
		 return "redirect: ../../admin/main.html";
		 
	  }
	
}