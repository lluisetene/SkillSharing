package es.uji.ei1027.skillsharing.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import es.uji.ei1027.skillsharing.model.Student;
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
	@RequestMapping(value="/addOffer/{idOffer}", method = RequestMethod.GET)
	public String addCollaborationOffer(Model model, @PathVariable int idOffer, HttpSession sesion) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		List<Demand> demandas = demandDao.getDemands();
		
		boolean encontrada = false;
		
		for (int i=0; i < demandas.size(); i++){
			
			if (demandas.get(i).getIdSkill() == offerDao.getOffer(idOffer).getIdSkill()){
				
				model.addAttribute("demanda", demandDao.getDemand(demandas.get(i).getIdDemand()));
				encontrada = true;
				break;
				
			}
			
		}
		
		if (!encontrada){
			
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
			
			Student student = (Student) sesion.getAttribute("studentLogin");
			demand.setNid(student.getNid());
			demand.setName(offerDao.getOffer(idOffer).getName());
			demand.setIdSkill(offerDao.getOffer(idOffer).getIdSkill());
			demand.setBeginningDate(offerDao.getOffer(idOffer).getBeginningDate());
			demand.setEndingDate(offerDao.getOffer(idOffer).getEndingDate());
			
			//El añadir demanda no he de acerlo aqui porque si cancela la añadiria igualmente.
			model.addAttribute("demanda", demand);
			
		}
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		List<Collaboration> collaborations= collaborationDao.getCollaborations();
		Collaboration collaboration = new Collaboration();
		int idCollaboration;
		
		if (collaborations.isEmpty()){
			
			idCollaboration = 1;
			collaboration.setIdCollaboration(idCollaboration);
			
		}else{
		
			idCollaboration = collaborations.get(0).getIdCollaboration() + 1;
			collaboration.setIdCollaboration(idCollaboration);
		}
		
		model.addAttribute("collaboration", collaboration);
		
		return"collaboration/add";
		
	}
	
	@RequestMapping(value="/addOffer/{idOffer}", method=RequestMethod.POST)
	public String processAddOfferSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, HttpSession sesion, Model model, @PathVariable int idOffer) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(idOffer).getIdSkill()));
		
		List<Demand> demandas = demandDao.getDemands();
		boolean encontrada = false;
		
		for (int i=0; i < demandas.size(); i++){
			
			if (demandas.get(i).getIdSkill() == offerDao.getOffer(idOffer).getIdSkill()){
				
				model.addAttribute("demanda", demandDao.getDemand(demandas.get(i).getIdDemand()));
				encontrada = true;
				break;
				
			}
			
		}
		
		if (!encontrada){
			
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
			
			Student student = (Student) sesion.getAttribute("studentLogin");
			demand.setNid(student.getNid());
			demand.setName(offerDao.getOffer(idOffer).getName());
			demand.setIdSkill(offerDao.getOffer(idOffer).getIdSkill());
			demand.setBeginningDate(offerDao.getOffer(idOffer).getBeginningDate());
			demand.setEndingDate(offerDao.getOffer(idOffer).getEndingDate());
			
			//El añadir demanda no he de acerlo aqui porque si cancela la añadiria igualmente.
			demandDao.addDemand(demand);
			model.addAttribute("demanda", demand);
			
		}
		
		
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateAdd(collaboration, bindingResult);

		//HoursControlBETA controlHoras = new HoursControlBETA(studentDao, offerDao, demandDao, collaboration);

		if (bindingResult.hasErrors()) 

			return "collaboration/add";
		
		
		
		collaborationDao.addCollaboration(collaboration);
		//controlHoras.addHours(collaboration.getHours());
		
		/*NotificarColaboraciones notificacion = new NotificarColaboraciones();
		String ofertante = studentDao.getStudent(offerDao.getOffer(collaboration.getIdOffer()).getNid()).getMail();
		String demandante = studentDao.getStudent(demandDao.getDemand(collaboration.getIdDemand()).getNid()).getMail();
		String nombreOferta = offerDao.getOffer(collaboration.getIdOffer()).getName();
		String nombreDemanda = demandDao.getDemand(collaboration.getIdDemand()).getName();
		notificacion.notificarColaboracion(ofertante, demandante, collaboration, nombreOferta, nombreDemanda);*/
		
		return "redirect:../../student/main.html";
		
	}
	
	@RequestMapping(value="/addDemand/{idDemand}", method = RequestMethod.GET)
	public String addCollaborationDemand(Model model, @PathVariable int idDemand, HttpSession sesion) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("demanda", demandDao.getDemand(idDemand));
		model.addAttribute("skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		
		List<Offer> ofertas = offerDao.getOffers();
		
		boolean encontrada = false;
		
		for (int i=0; i < ofertas.size(); i++){
			
			if (ofertas.get(i).getIdSkill() == demandDao.getDemand(idDemand).getIdSkill()){
				
				model.addAttribute("offer", offerDao.getOffer(ofertas.get(i).getIdOffer()));
				encontrada = true;
				break;
				
			}
			
		}
		
		if (!encontrada){
			
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
			
			Student student = (Student) sesion.getAttribute("studentLogin");
			offer.setNid(student.getNid());
			offer.setName(demandDao.getDemand(idDemand).getName());
			offer.setIdSkill(demandDao.getDemand(idDemand).getIdSkill());
			offer.setBeginningDate(demandDao.getDemand(idDemand).getBeginningDate());
			offer.setEndingDate(demandDao.getDemand(idDemand).getEndingDate());
			
			//El añadir demanda no he de acerlo aqui porque si cancela la añadiria igualmente.
			model.addAttribute("offer", offer);
			
		}
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		List<Collaboration> collaborations= collaborationDao.getCollaborations();
		Collaboration collaboration = new Collaboration();
		int idCollaboration;
		
		if (collaborations.isEmpty()){
			
			idCollaboration = 1;
			collaboration.setIdCollaboration(idCollaboration);
			
		}else{
		
			idCollaboration = collaborations.get(0).getIdCollaboration() + 1;
			collaboration.setIdCollaboration(idCollaboration);
		}
		
		model.addAttribute("collaboration", collaboration);
		
		return"collaboration/add";
		
	}
	
	@RequestMapping(value="/addDemand/{idDemand}", method=RequestMethod.POST)
	public String processAddDemandSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, HttpSession sesion, Model model, @PathVariable int idDemand) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("demanda", demandDao.getDemand(idDemand));
		model.addAttribute("skill", skillDao.getSkill(demandDao.getDemand(idDemand).getIdSkill()));
		
		List<Offer> ofertas = offerDao.getOffers();
		
		boolean encontrada = false;
		
		for (int i=0; i < ofertas.size(); i++){
			
			if (ofertas.get(i).getIdSkill() == demandDao.getDemand(idDemand).getIdSkill()){
				
				model.addAttribute("offer", offerDao.getOffer(ofertas.get(i).getIdOffer()));
				encontrada = true;
				break;
				
			}
			
		}
		
		if (!encontrada){
			
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
			
			Student student = (Student) sesion.getAttribute("studentLogin");
			offer.setNid(student.getNid());
			offer.setName(demandDao.getDemand(idDemand).getName());
			offer.setIdSkill(demandDao.getDemand(idDemand).getIdSkill());
			offer.setBeginningDate(demandDao.getDemand(idDemand).getBeginningDate());
			offer.setEndingDate(demandDao.getDemand(idDemand).getEndingDate());
			
			//El añadir demanda no he de acerlo aqui porque si cancela la añadiria igualmente.
			offerDao.addOffer(offer);
			model.addAttribute("offer", offer);
			
		}
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateAdd(collaboration, bindingResult);

		//HoursControlBETA controlHoras = new HoursControlBETA(studentDao, offerDao, demandDao, collaboration);

		if (bindingResult.hasErrors()) 

			return "collaboration/add";
		
		
		
		collaborationDao.addCollaboration(collaboration);
		//controlHoras.addHours(collaboration.getHours());
		
		/*NotificarColaboraciones notificacion = new NotificarColaboraciones();
		String ofertante = studentDao.getStudent(offerDao.getOffer(collaboration.getIdOffer()).getNid()).getMail();
		String demandante = studentDao.getStudent(demandDao.getDemand(collaboration.getIdDemand()).getNid()).getMail();
		String nombreOferta = offerDao.getOffer(collaboration.getIdOffer()).getName();
		String nombreDemanda = demandDao.getDemand(collaboration.getIdDemand()).getName();
		notificacion.notificarColaboracion(ofertante, demandante, collaboration, nombreOferta, nombreDemanda);*/
		
		return "redirect:../../student/main.html";
		
	}
	
	@RequestMapping(value="/valoration/{idCollaboration}", method = RequestMethod.GET)
	public String valoration(Model model, @PathVariable int idCollaboration) {
		
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "collaboration/valoration";
		
	}
	
	@RequestMapping(value="/valoration/{idCollaboration}", method = RequestMethod.POST) 
	public String processValorationSubmit(@PathVariable int idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/valoration";
		
		 collaborationDao.updateCollaboration(collaboration);
		 
		 return "redirect:../../student/main.html"; 
		
	}
	
	
	
	
	//----------- actualización ------------------
	@RequestMapping(value="/update/{idCollaboration}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable int idCollaboration){
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		
		
		
		
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offer", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demanda", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
	
		return "collaboration/update"; 
		
	}
	
	@RequestMapping(value="/update/{idCollaboration}", method = RequestMethod.POST) 
	public String processUpdateSubmit(Model model, @PathVariable int idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("skill", skillDao.getSkill(skillDao.getSkill(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offer", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demanda", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
		
		collaborationValidator.validateUpdate(collaboration, bindingResult);
		
		if (bindingResult.hasErrors()) {
	
			 return "collaboration/update";
		}
		
		 collaborationDao.updateCollaboration(collaboration);
		 
		 return "redirect:../../student/main.html"; 
		 
	  }
	  
	  //----------- actualización admin -----------------//
		@RequestMapping(value="/updateByAdmin/{idCollaboration}", method = RequestMethod.GET)
		public String processUpdateByAdminSubmit(Model model, @PathVariable int idCollaboration) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
			
			model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
			model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
			
			return "collaboration/updateByAdmin"; 
			
		}
		
		@RequestMapping(value="/updateByAdmin/{idCollaboration}", method = RequestMethod.POST) 
		public String processUpdateByAdminSubmit(@PathVariable int idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
			
			model.addAttribute("studentsSelect", studentDao.getStudents());
			model.addAttribute("adminsSelect", adminDao.getAdmins());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			
			model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
			model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
			
			CollaborationValidator collaborationValidator = new CollaborationValidator();
			
			collaborationValidator.setCollaborationDAO(collaborationDao, offerDao, demandDao, studentDao);
			
			collaborationValidator.validateUpdate(collaboration, bindingResult);
			
			if (bindingResult.hasErrors()) {
				
				 return "collaboration/updateByAdmin";
			}
			
			 collaborationDao.updateCollaboration(collaboration);
			 
			 return "redirect: ../../admin/main.html";
			 
		  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idCollaboration}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable int idCollaboration) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offer", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demanda", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "collaboration/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idCollaboration}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable int idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("offers", offerDao.getOffers());
		model.addAttribute("demands", demandDao.getDemands());
		model.addAttribute("skill", skillDao.getSkill(offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()).getIdSkill()));
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		model.addAttribute("offer", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demanda", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		
		//HoursControlBETA controlHoras = new HoursControlBETA(studentDao, offerDao, demandDao, collaboration);
		
		if (bindingResult.hasErrors()) 
			
			 return "collaboration/delete";
		
		// controlHoras.removeHours(collaboration.getHours());
		
		 collaborationDao.deleteCollaboration(idCollaboration);
		 
		 return "redirect:../../student/main.html";
		 
	  }
	  
	  //----------- eliminación admin -----------------//
	@RequestMapping(value="/deleteByAdmin/{idCollaboration}", method = RequestMethod.GET)
	public String processDeleteByAdminSubmit(Model model, @PathVariable int idCollaboration) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("collaboration", collaborationDao.getCollaboration(idCollaboration));
		
		model.addAttribute("offerName", offerDao.getOffer(collaborationDao.getCollaboration(idCollaboration).getIdOffer()));
		model.addAttribute("demandName", demandDao.getDemand(collaborationDao.getCollaboration(idCollaboration).getIdDemand()));
		
		return "collaboration/deleteByAdmin"; 
		
	}
	
	@RequestMapping(value="/deleteByAdmin/{idCollaboration}", method = RequestMethod.POST) 
	public String processDeleteByAdminSubmit(@PathVariable int idCollaboration, @ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
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