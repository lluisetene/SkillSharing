package es.uji.ei1027.skillsharing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.DegreeDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Degree;
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
		
		model.addAttribute("degreeResponse", degreeDao.getDegree(degree));
		
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
	@RequestMapping("/update")
	public String editDegree(Model model) {
		
		model.addAttribute("degree", new Degree());
		
		return "degree/update";
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String processEditSubmit(@ModelAttribute("degree") Degree degree, BindingResult bindingResult) {
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateUpdate(degree, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "degree/update";
		
		degreeDao.updateDegree(degree);
		
		return "redirect:main.html";
	}
	
	//----------- eliminación ------------------
	@RequestMapping("/delete")
	public String deleteDegree(Model model) {
		
		model.addAttribute("degree", new Degree());
		
		return "degree/delete";
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String processDeleteSubmit(@ModelAttribute("degree") Degree degree, BindingResult bindingResult) {
		
		DegreeValidator degreeValidator = new DegreeValidator();
		
		degreeValidator.setDegreeDAO(degreeDao, studentDao);
		
		degreeValidator.validateDelete(degree, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "degree/delete";
			
		degreeDao.deleteDegree(degree);
		
		return "redirect:main.html";
	
	}
	
}