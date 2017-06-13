package es.uji.ei1027.skillsharing.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.validators.DemandValidator;


@Controller
@RequestMapping("/demand")
public class DemandController {

	private DemandDAO demandDao;
	private AdminDAO adminDao;
	private DegreeDAO degreeDao;
	private OfferDAO offerDao;
	private StudentDAO studentDao;
	private CollaborationDAO collaborationDao;
	private SkillDAO skillDao;
	private Statistics estadisticas;
	
	
	@Autowired
	public void setDemandDao(DemandDAO demandDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao, OfferDAO offerDao, AdminDAO adminDao, DegreeDAO degreeDao) {
		
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.studentDao = studentDao;
		this.collaborationDao = collaborationDao;
		this.skillDao = skillDao;
		this.degreeDao = degreeDao;
		this.adminDao = adminDao;
		
	}
	
	//Método para convertir el formato String a Date en el formulario
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	  
	    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm"); 
	    binder.registerCustomEditor(Date.class, "hours", new CustomDateEditor(timeFormat, false));

	}
	
	//---------- página de métodos ---------
	
	@RequestMapping("/main")
	public String mainDemands(Model model) {
		
		return "demand/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listDemands(Model model) {
		
		model.addAttribute("demands", demandDao.getDemandsWithNameSkill());
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("demand", new Demand());

		return "demand/list";

	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String processListSubmit(@ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
	
		model.addAttribute("demands", demandDao.getDemandsWithNameSkill());
		model.addAttribute("skills", skillDao.getSkills());
		
		if (demand.getIdSkill().equals("Todas")){

			model.addAttribute("demand", demandDao.getDemandsWithNameSkill());
		}else{
		
			model.addAttribute("demands", demandDao.getDemands2(demand.getIdSkill()));
		}
		return "demand/list";
	
	}

	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultDemand(Model model) {
		
		//Guardo en el atributo demand el objeto de tipo demand.
		model.addAttribute("demand", new Demand());
		
		return "demand/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
		
		DemandValidator demandValidator = new DemandValidator();
		
		demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
		
		demandValidator.validateConsult(demand, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "demand/consult";
		
		model.addAttribute("demandResponse", demandDao.getDemand(demand.getIdDemand()));
		
		return "demand/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addDemand(Model model) {
		
		model.addAttribute("demand", new Demand());
		model.addAttribute("skills", skillDao.getSkills());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return"demand/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("demand") Demand demand, BindingResult bindingResult) {
		
		DemandValidator demandValidator = new DemandValidator();
		
		demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
		
		demandValidator.validateAdd(demand, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "demand/add";
		
		demandDao.addDemand(demand);
		
		return "redirect:../student/main.html";
		
	}
	
	//----------- actualización ------------------
	@RequestMapping(value="/update/{idDemand}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String idDemand) {
		
		model.addAttribute("demand", demandDao.getDemandWithNameSkill(idDemand));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "demand/update"; 
		
	}
	
	@RequestMapping(value="/update/{idDemand}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult) {
		
		DemandValidator demandValidator = new DemandValidator();
		
		demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
		
		demandValidator.validateUpdate(demand, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "demand/update";
		
		 demandDao.updateDemand(demand);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	   //----------- actualización admin -----------------//
		@RequestMapping(value="/updateByAdmin/{idDemand}", method = RequestMethod.GET)
		public String processUpdateByAdminSubmit(Model model, @PathVariable String idDemand) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("demand", demandDao.getDemandWithNameSkill(idDemand));
			model.addAttribute("Skill", demandDao.getDemandWithNameSkill(idDemand).getIdSkill());
			return "demand/updateByAdmin"; 
			
		}
		
		@RequestMapping(value="/updateByAdmin/{idDemand}", method = RequestMethod.POST) 
		public String processUpdateByAdminSubmit(@PathVariable String idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("Skill", demandDao.getDemandWithNameSkill(idDemand).getIdSkill());
			
			DemandValidator demandValidator = new DemandValidator();
			
			demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
			
			demandValidator.validateUpdate(demand, bindingResult);
			
			if (bindingResult.hasErrors()) {
		
				 return "demand/updateByAdmin";
			}
			 demandDao.updateDemand(demand);
			 
			 return "redirect: ../../admin/main.html";
			 
		  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idDemand}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String idDemand) {
		
		model.addAttribute("demand", demandDao.getDemand(idDemand));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "demand/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idDemand}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult) {
		
		DemandValidator demandValidator = new DemandValidator();
		
		demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
		
		demandValidator.validateDelete(demand, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "demand/delete";
		
		 demandDao.deleteDemand(idDemand);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	   //----------- eliminación admin------------------
		@RequestMapping(value="/deleteByAdmin/{idDemand}", method = RequestMethod.GET)
		public String processdeleteByAdminSubmit(Model model, @PathVariable String idDemand) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("demand", demandDao.getDemandWithNameSkill(idDemand));
			model.addAttribute("Skill", demandDao.getDemandWithNameSkill(idDemand).getIdSkill());
			return "demand/deleteByAdmin"; 
			
		}
		
		@RequestMapping(value="/deleteByAdmin/{idDemand}", method = RequestMethod.POST) 
		public String processDeleteByAdminSubmit(@PathVariable String idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("Skill", demandDao.getDemandWithNameSkill(idDemand).getIdSkill());
		
			DemandValidator demandValidator = new DemandValidator();
			
			demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
			
			demandValidator.validateDelete(demand, bindingResult);
			
			if (bindingResult.hasErrors()) {
				 return "demand/deleteByAdmin";
			}
			 demandDao.deleteDemand(idDemand);
			 
			 return "redirect: ../../admin/main.html";
			 
		  }
	
}