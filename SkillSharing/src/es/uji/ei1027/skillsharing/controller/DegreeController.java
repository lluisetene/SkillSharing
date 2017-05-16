package es.uji.ei1027.skillsharing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.DegreeValidator;

@Controller
@RequestMapping("/degree")
public class DegreeController {

	private DegreeDAO degreeDao;
	private StudentDAO studentDao;
	
	@Autowired
	public void setDegreeDao(DegreeDAO degreeDao, StudentDAO studentDao) {
		
		this.degreeDao = degreeDao;
		this.studentDao = studentDao;
		
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
		
		model.addAttribute("degreeResponse", degreeDao.getDegree(degree.getIdDegree()));
		
		return "degree/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addDegree(Model model) {
		
		model.addAttribute("degree", new Degree());
		
		return"degree/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("degree") Degree degree, BindingResult bindingResult) {
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateAdd(degree, bindingResult);
		
		if (bindingResult.hasErrors())
	
			return "degree/add";
			
		degreeDao.addDegree(degree);
		
		return "redirect:main.html";
		
	}
	

	//----------- actualización ------------------
	@RequestMapping(value="/update/{idDegree}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String idDegree) {
		
		model.addAttribute("degree", degreeDao.getDegree(idDegree));
		
		return "degree/update"; 
		
	}
	
	@RequestMapping(value="/update/{idDegree}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String idDegree, @ModelAttribute("degree") Degree degree, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) 
			
			 return "degree/update";
		
		 degreeDao.updateDegree(degree);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{idDegree}")
	public String processDeleteSubmit(@PathVariable String idDegree) {
			
		degreeDao.deleteDegree(idDegree);
		
		return "redirect:../list.html";
	
	}
	
}