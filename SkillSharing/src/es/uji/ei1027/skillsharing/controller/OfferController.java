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
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.OfferValidator;

@Controller
@RequestMapping("/offer")
public class OfferController {
	
	private DemandDAO demandDao;
	private AdminDAO adminDao;
	private DegreeDAO degreeDao;
	private OfferDAO offerDao;
	private StudentDAO studentDao;
	private CollaborationDAO collaborationDao;
	private SkillDAO skillDao;
	private OfferValidator offerValidator;
	private Statistics estadisticas;
	
	@Autowired
	public void setOfferDao(OfferDAO offerDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao, DemandDAO demandDao, AdminDAO adminDao, DegreeDAO degreeDao) {
		this.offerDao = offerDao;
		this.studentDao = studentDao;
		this.collaborationDao = collaborationDao;
		this.skillDao = skillDao;
		this.demandDao = demandDao;
		this.adminDao = adminDao;
		this.degreeDao = degreeDao;
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
	public String mainOffers(Model model) {
		
		return "offer/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listOffers(Model model, HttpSession sesion) {
		
		model.addAttribute("student", studentDao);
		Student student = (Student) sesion.getAttribute("studentLogin");
		model.addAttribute("offers", offerDao.getOffersWithoutOwner(student.getNid()));
		model.addAttribute("skills", skillDao.getSkillsDistinctName());
		model.addAttribute("offer", new Offer());
		model.addAttribute("skill", skillDao);

		return "offer/list";

	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String processListSubmit(@ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model, HttpSession sesion) {
	
		model.addAttribute("student", studentDao);
		Student student = (Student) sesion.getAttribute("studentLogin");
		model.addAttribute("offers", offerDao.getOffersWithoutOwner(student.getNid()));
		model.addAttribute("skills", skillDao.getSkillsDistinctName());
		model.addAttribute("skill", skillDao);
		List<Offer> offersList = offerDao.getOffersWithoutOwner(skillDao.getSkill(offer.getIdSkill()).getName(), student.getNid());
		
		model.addAttribute("offers", offersList);
		
		return "offer/list";
	
	}

	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultOffer(Model model) {
		
		//Guardo en el atributo offer el objeto de tipo offer.
		model.addAttribute("offer", new Offer());
		
		return "offer/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateConsult(offer, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "offer/consult";
		
		model.addAttribute("offerResponse", offerDao.getOffer(offer.getIdOffer()));
		
		return "offer/consult";
	
	}
	
	
	
	
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addOffer(Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		List<Offer> offers= offerDao.getOffers();
		Offer offer = new Offer();
		int idOffer;
		
		if (offers.isEmpty()){
			
			idOffer = 1;
			offer.setIdOffer(idOffer);
			
		}else{
		
			idOffer = offers.get(0).getIdOffer() + 1;
			offer.setIdOffer(idOffer);
		}
		model.addAttribute("offer", offer);
		return "offer/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateAdd(offer, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "offer/add";
		
		offerDao.addOffer(offer);
		
		
		return "redirect:../student/main.html";
		
	}
	
	//----------- actualización -----------------//
	@RequestMapping(value="/update/{idOffer}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable int idOffer) {
	
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		model.addAttribute("offer", offerDao.getOffer(idOffer));

		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "offer/update"; 
		
	}
	
	@RequestMapping(value="/update/{idOffer}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable int idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateUpdate(offer, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "offer/update";
		
		 offerDao.updateOffer(offer);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	  //----------- actualización admin -----------------//
	@RequestMapping(value="/updateByAdmin/{idOffer}", method = RequestMethod.GET)
	public String processUpdateByAdminSubmit(Model model, @PathVariable int idOffer) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		
		return "offer/updateByAdmin"; 
		
	}
	
	@RequestMapping(value="/updateByAdmin/{idOffer}", method = RequestMethod.POST) 
	public String processUpdateByAdminSubmit(@PathVariable int idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateUpdate(offer, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "offer/updateByAdmin";
		
		 offerDao.updateOffer(offer);
		 
		 return "redirect: ../../admin/main.html";
		 
	  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idOffer}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable int idOffer) {
		
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		model.addAttribute("offer", offerDao.getOffer(idOffer));

		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "offer/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idOffer}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable int idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateDelete(offer, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "offer/delete";
		
		 offerDao.deleteOffer(idOffer);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	  //----------- eliminación admin------------------
	@RequestMapping(value="/deleteByAdmin/{idOffer}", method = RequestMethod.GET)
	public String processdeleteByAdminSubmit(Model model, @PathVariable int idOffer) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		return "offer/deleteByAdmin"; 
		
	}
	
	@RequestMapping(value="/deleteByAdmin/{idOffer}", method = RequestMethod.POST) 
	public String processDeleteByAdminSubmit(@PathVariable int idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("Skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
	
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateDelete(offer, bindingResult);
		
		if (bindingResult.hasErrors()) {
			 return "offer/deleteByAdmin";
		}
		 offerDao.deleteOffer(idOffer);
		 
		 return "redirect: ../../admin/main.html";
		 
	  }
	
	
}