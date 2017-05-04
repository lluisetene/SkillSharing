package es.uji.ei1027.skillsharing.controller;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.CollaborationDAO;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.validators.CollaborationValidator;

@Controller
@RequestMapping("/collaboration")
public class CollaborationController {
	//no acabamos de entender su funcionamiento
	
	private CollaborationDAO collaborationDao;
	
	@Autowired
	public void setCollaborationDao(CollaborationDAO collaborationDao) {
		
		this.collaborationDao = collaborationDao;
		
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
		
		collaborationValidator.setCollaborationDAO(collaborationDao);
		
		collaborationValidator.validateSearch(collaboration, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "collaboration/consult";
		
		model.addAttribute("collaborationResponse", collaborationDao.getCollaboration(collaboration));
		
		return "collaboration/consult";
	
	}
	
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addCollaboration(Model model) {
		
		model.addAttribute("collaboration", new Collaboration());
		
		return"collaboration/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao);
		
		collaborationValidator.validateAdd(collaboration, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "collaboration/add";
		
		collaborationDao.addCollaboration(collaboration);
		
		return "redirect:main.html";
		
	}
	
	
	//----------- actualización ------------------
	@RequestMapping("/update")
	public String editCollaboration(Model model) {
		
		model.addAttribute("collaboration", new Collaboration());
		
		return "collaboration/update";
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String processEditSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao);
		
		collaborationValidator.validateAdd(collaboration, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "collaboration/update";
		
		collaborationDao.updateCollaboration(collaboration);
		
		return "redirect:main.html";
	}
	
	//----------- eliminación ------------------
	@RequestMapping("/delete")
	public String deleteCollaboration(Model model) {
		
		model.addAttribute("collaboration", new Collaboration());
		
		return "collaboration/delete";
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String processDeleteSubmit(@ModelAttribute("collaboration") Collaboration collaboration, BindingResult bindingResult) {
		
		CollaborationValidator collaborationValidator = new CollaborationValidator();
		
		collaborationValidator.setCollaborationDAO(collaborationDao);
		
		collaborationValidator.validateSearch(collaboration, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "collaboration/delete";
		
		collaborationDao.deleteCollaboration(collaboration);
		
		return "redirect:main.html";
	
	}
	
}
