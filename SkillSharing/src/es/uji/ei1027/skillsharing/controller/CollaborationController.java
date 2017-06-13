package es.uji.ei1027.skillsharing.controller;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

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
import es.uji.ei1027.skillsharing.model.HoursControlBETA;
import es.uji.ei1027.skillsharing.model.NotificarColaboraciones;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.validators.CollaborationValidator;

@Controller
@RequestMapping("/collaboration")
public class CollaborationController {
	
	private CollaborationDAO collaborationDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	private StudentDAO studentDao;
	private AdminDAO adminDao;
	private SkillDAO skillDao;
	private DegreeDAO degreeDao;
	private Statistics estadisticas;
	
	@Autowired
	public void setCollaborationDao(CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao, StudentDAO studentDao, AdminDAO adminDao, SkillDAO skillDao, DegreeDAO degreeDao) {
		
		this.collaborationDao = collaborationDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.studentDao = studentDao;
		this.adminDao = adminDao;
		this.skillDao = skillDao;
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
	public String mainCollaborations(Model model) {
		
		return "collaboration/main";
		
	}

	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listCollaborations(Model model) {
		
		model.addAttribute("collaborations", collaborationDao.getCollaborations());
		
		return "collaboration/list";
		
	}
	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultCollaboration(Model model) {
		
		//Guardo en el atributo collaboration el objeto de tipo collaboration.
		model.addAttribute("collaboration", new Collaboration());
		
		return "collaboration/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateConsult(collaboration, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "collaboration/consult";
		
		model.addAttribute("collaborationResponse", collaborationDao.getCollaboration(collaboration.getIdCollaboration()));
		
		return "collaboration/consult";
	
	}
	
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addCollaboration(Model model) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		List<Collaboration> collaborations= collaborationDao.getCollaborations();
		Collaboration collaboration = new Collaboration();
		String idCollaboration;
		
		if (collaborations.isEmpty()){
			
			idCollaboration = "1";
			collaboration.setIdCollaboration(idCollaboration);
			
		}else{
		
			idCollaboration = String.valueOf(Integer.parseInt(collaborations.get(0).getIdCollaboration()) + 1);
			collaboration.setIdCollaboration(idCollaboration);
		}
		
		model.addAttribute("collaboration", collaboration);
		
		return"collaboration/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateAdd(collaboration, bindingResult);

		HoursControlBETA controlHoras = new HoursControlBETA(studentDao, offerDao, demandDao, collaboration);

		if (bindingResult.hasErrors())
			
			return "collaboration/add";
		
		collaborationDao.addCollaboration(collaboration);
		controlHoras.addHours(collaboration.getHours());
		
		NotificarColaboraciones notificacion = new NotificarColaboraciones();
		String ofertante = studentDao.getStudent(offerDao.getOffer(collaboration.getIdOffer()).getNid()).getMail();
		String demandante = studentDao.getStudent(demandDao.getDemand(collaboration.getIdDemand()).getNid()).getMail();
		String nombreOferta = offerDao.getOffer(collaboration.getIdOffer()).getName();
		String nombreDemanda = demandDao.getDemand(collaboration.getIdDemand()).getName();
		notificacion.notificarColaboracion(ofertante, demandante, collaboration, nombreOferta, nombreDemanda);
		
		return "redirect:../student/main.html";
		
	}
	
	@RequestMapping(value="/valoration/{idCollaboration}", method = RequestMethod.GET)
	public String valoration(Model model, @PathVariable String idCollaboration) {
		
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "collaboration/valoration";
		
	}
	
	@RequestMapping(value="/valoration/{idCollaboration}", method = RequestMethod.POST) 
	public String processValorationSubmit(@PathVariable String idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateUpdate(collaboration, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/valoration";
		
		 collaborationDao.updateCollaboration(collaboration);
		 
		 return "redirect:../../student/main.html"; 
		
	}
	
	
	
	
	//----------- actualización ------------------
	@RequestMapping(value="/update/{idCollaboration}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String idCollaboration){
		
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
	
		return "collaboration/update"; 
		
	}
	
	@RequestMapping(value="/update/{idCollaboration}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateUpdate(collaboration, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/update";
		
		 collaborationDao.updateCollaboration(collaboration);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	  //----------- actualización admin -----------------//
		@RequestMapping(value="/updateByAdmin/{idCollaboration}", method = RequestMethod.GET)
		public String processUpdateByAdminSubmit(Model model, @PathVariable String idCollaboration) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
			
			model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
			model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
			
			return "collaboration/updateByAdmin"; 
			
		}
		
		@RequestMapping(value="/updateByAdmin/{idCollaboration}", method = RequestMethod.POST) 
		public String processUpdateByAdminSubmit(@PathVariable String idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegrees());
			model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
			model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			
			model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
			model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
			
			CollaborationValidator collaborationValidator = new CollaborationValidator();
			
			collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
			
			collaborationValidator.validateUpdate(collaboration, bindingResult);
			
			if (bindingResult.hasErrors()) 
				
				 return "collaboration/updateByAdmin";
			
			 collaborationDao.updateCollaboration(collaboration);
			 
			 return "redirect: ../../admin/main.html";
			 
		  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idCollaboration}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String idCollaboration) {
		
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "collaboration/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idCollaboration}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		HoursControlBETA controlHoras = new HoursControlBETA(studentDao, offerDao, demandDao, collaboration);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/delete";
		
		 controlHoras.removeHours(collaboration.getHours());
		
		 collaborationDao.deleteCollaboration(idCollaboration);
		 
		 return "redirect:../../student/main.html";
		 
	  }
	  
	  //----------- eliminación admin -----------------//
	@RequestMapping(value="/deleteByAdmin/{idCollaboration}", method = RequestMethod.GET)
	public String processDeleteByAdminSubmit(Model model, @PathVariable String idCollaboration) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		return "collaboration/deleteByAdmin"; 
		
	}
	
	@RequestMapping(value="/deleteByAdmin/{idCollaboration}", method = RequestMethod.POST) 
	public String processDeleteByAdminSubmit(@PathVariable String idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegrees());
		model.addAttribute("offersSelect", offerDao.getOffersWithNameSkill());
		model.addAttribute("demandsSelect", demandDao.getDemandsWithNameSkill());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateDelete(collaboration, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/deleteByAdmin";
		
		 collaborationDao.deleteCollaboration(idCollaboration);
		 
		 return "redirect: ../../admin/main.html";
		 
	  }
	
	
}