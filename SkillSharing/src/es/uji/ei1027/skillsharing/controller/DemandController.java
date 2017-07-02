package es.uji.ei1027.skillsharing.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.model.Student;
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
	public String listDemands(Model model, HttpSession sesion) {
		
		Student student = (Student) sesion.getAttribute("studentLogin");
		model.addAttribute("demands", demandDao.getDemandsWithoutOwner(student.getNid()));
		model.addAttribute("skills", skillDao.getSkillsDistinctName());
		model.addAttribute("demand", new Demand());
		model.addAttribute("student", studentDao);
		model.addAttribute("skill", skillDao);

		return "demand/list";

	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String processListSubmit(@ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model, HttpSession sesion) {
	
		model.addAttribute("student", studentDao);
		model.addAttribute("skills", skillDao.getSkillsDistinctName());
		model.addAttribute("skill", skillDao);
		Student student = (Student) sesion.getAttribute("studentLogin");
		model.addAttribute("demands", demandDao.getDemandsWithoutOwner(student.getNid()));
		
		if (demand.getIdSkill() == -1){
			
			model.addAttribute("demands", demandDao.getDemandsWithoutOwner(student.getNid()));
			
		}else{
			
		
			List<Demand> demandsList = demandDao.getDemandsWithoutOwner(skillDao.getSkill(demand.getIdSkill()).getName(), student.getNid());
		
			model.addAttribute("demands", demandsList);

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
		
		model.addAttribute("skills", skillDao.getSkills());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		List<Demand> demands= demandDao.getDemands();
		Demand demand = new Demand();
		int idDemand;
		
		if (demands.isEmpty()){
			
			idDemand = 1;
			demand.setIdDemand(idDemand);
			
		}else{
		
			idDemand = demands.get(0).getIdDemand() + 1;
			demand.setIdDemand(idDemand);
		}
		
		model.addAttribute("demand", demand);
		
		return"demand/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model, HttpSession sesion) {
		
		model.addAttribute("skills", skillDao.getSkills());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
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
	public String processUpdateSubmit(Model model, @PathVariable int idDemand) {
		
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		
		model.addAttribute("demand", demandDao.getDemand(idDemand));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "demand/update"; 
		
	}
	
	@RequestMapping(value="/update/{idDemand}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable int idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
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
		public String processUpdateByAdminSubmit(Model model, @PathVariable int idDemand) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			
			model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
			
			model.addAttribute("demand", demandDao.getDemand(idDemand));
			return "demand/updateByAdmin"; 
			
		}
		
		@RequestMapping(value="/updateByAdmin/{idDemand}", method = RequestMethod.POST) 
		public String processUpdateByAdminSubmit(@PathVariable int idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
			
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
	public String processDeleteSubmit(Model model, @PathVariable int idDemand) {
		
		model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		model.addAttribute("demand", demandDao.getDemand(idDemand));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "demand/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idDemand}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable int idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
		
		model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		model.addAttribute("demand", demandDao.getDemand(idDemand));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		DemandValidator demandValidator = new DemandValidator();
		
		demandValidator.setDemandDAO(demandDao, studentDao, collaborationDao, skillDao);
		
		demandValidator.validateDelete(demand, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "demand/delete";
		
		List<Collaboration> collaborationsList = collaborationDao.getCollaborationsWithoutDateRestrict();
		
		for(int i = 0; i < collaborationsList.size(); i++){
			
			if (collaborationsList.get(i).getIdDemand() == demand.getIdDemand()){
				
				model.addAttribute("Error", true);
				return "demand/delete";
			}
			
		}
		
		 demandDao.deleteDemand(idDemand);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	   //----------- eliminación admin------------------
		@RequestMapping(value="/deleteByAdmin/{idDemand}", method = RequestMethod.GET)
		public String processdeleteByAdminSubmit(Model model, @PathVariable int idDemand) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("demand", demandDao.getDemand(idDemand));
			model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
			return "demand/deleteByAdmin"; 
			
		}
		
		@RequestMapping(value="/deleteByAdmin/{idDemand}", method = RequestMethod.POST) 
		public String processDeleteByAdminSubmit(@PathVariable int idDemand, @ModelAttribute("demand") Demand demand, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("Skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
			model.addAttribute("demand", demandDao.getDemand(idDemand));
		
			if (bindingResult.hasErrors()) {
				 return "demand/deleteByAdmin";
			}
			
			List<Collaboration> collaborationsList = collaborationDao.getCollaborationsWithoutDateRestrict();
			for(int i = 0; i < collaborationsList.size(); i++){
				
				if (collaborationsList.get(i).getIdDemand() == demand.getIdDemand()){
					
					model.addAttribute("Error", true);
					return "demand/deleteByAdmin";
				}
				
			}
			
			 demandDao.deleteDemand(idDemand);
			 
			 return "redirect: ../../admin/main.html";
			 
		  }
	
}