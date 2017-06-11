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

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.validators.OfferValidator;

@Controller
@RequestMapping("/offer")
public class OfferController {
	
	private OfferDAO offerDao;
	private StudentDAO studentDao;
	private CollaborationDAO collaborationDao;
	private SkillDAO skillDao;
	private OfferValidator offerValidator;
	private Statistics estadisticas;
	
	@Autowired
	public void setOfferDao(OfferDAO offerDao, StudentDAO studentDao, CollaborationDAO collaborationDao, SkillDAO skillDao) {
		this.offerDao = offerDao;
		this.studentDao = studentDao;
		this.collaborationDao = collaborationDao;
		this.skillDao = skillDao;
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
	public String listOffers(Model model) {
		
		model.addAttribute("offers", offerDao.getOffersWithNameSkill());
		model.addAttribute("skills", skillDao.getSkills());
		model.addAttribute("offer", new Offer());

		return "offer/list";

	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String processListSubmit(@ModelAttribute("offer") Offer offer, BindingResult bindingResult, Model model) {
	
		model.addAttribute("offers", offerDao.getOffersWithNameSkill());
		model.addAttribute("skills", skillDao.getSkills());
		
		if (offer.getIdSkill().equals("Todas")){

			model.addAttribute("offers", offerDao.getOffersWithNameSkill());
		}else{
		
			model.addAttribute("offers", offerDao.getOffers2(offer.getIdSkill()));
		}
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
		
		model.addAttribute("offer", new Offer());
		model.addAttribute("skills", skillDao.getSkills());
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "offer/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("offer") Offer offer, BindingResult bindingResult) {
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateAdd(offer, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "offer/add";
		
		offerDao.addOffer(offer);
		
		return "redirect:main.html";
		
	}
	
	//----------- actualización -----------------//
	@RequestMapping(value="/update/{idOffer}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String idOffer) {
		
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		
		return "offer/update"; 
		
	}
	
	@RequestMapping(value="/update/{idOffer}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult) {
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateUpdate(offer, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "offer/update";
		
		 offerDao.updateOffer(offer);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idOffer}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String idOffer) {
		
		model.addAttribute("offer", offerDao.getOffer(idOffer));
		
		return "offer/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{idOffer}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String idOffer, @ModelAttribute("offer") Offer offer, BindingResult bindingResult) {
		
		offerValidator = new OfferValidator();
		
		offerValidator.setOfferDAO(offerDao, studentDao, collaborationDao, skillDao);
		
		offerValidator.validateDelete(offer, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "offer/delete";
		
		 offerDao.deleteOffer(idOffer);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
	
}