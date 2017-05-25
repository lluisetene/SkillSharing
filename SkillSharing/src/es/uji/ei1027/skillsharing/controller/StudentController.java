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
import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.StudentValidator;

@Controller
@RequestMapping("/student")
public class StudentController {

	private StudentDAO studentDao;
	private CollaborationDAO collaborationDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	
	
	@Autowired
	public void setStudentDato(StudentDAO studentDao, CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao) {
		this.studentDao = studentDao;
		this.collaborationDao = collaborationDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
	}
	
	//Método para convertir el formato String a Date en el formulario
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		
	    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm"); 
	    binder.registerCustomEditor(Date.class, "offerHours", new CustomDateEditor(timeFormat, false));
	    binder.registerCustomEditor(Date.class, "demandHours", new CustomDateEditor(timeFormat, false));
	    
	}
	
	//---------- página de métodos ---------
	
	@RequestMapping("/main")
	public String mainStudents(Model model) {
		
		return "student/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listStudent(Model model) {
		
		model.addAttribute("students", studentDao.getStudents());
		
		return "student/list";
		
	}
	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultStudent(Model model) {
		
		//Guardo en el atributo student el objeto de tipo student.
		model.addAttribute("student", new Student());
		
		return "student/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult, Model model) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao);
		
		studentValidator.validateConsult(student, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "student/consult";
		
		model.addAttribute("studentResponse", studentDao.getStudent(student.getNid()));
		
		return "student/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/registrarse")
	public String addStudent(Model model) {
		
		model.addAttribute("student", new Student());
		
		return"student/registrarse";
		
	}
	
	@RequestMapping(value="/registrarse", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao);
		
		studentValidator.validateAdd(student, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "student/registrarse";
	
		studentDao.addStudent(student);
		
		return "redirect:main.html";
		
	}
	
	//----------- actualización ------------------
	@RequestMapping(value="/update/{nid}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String nid) {
		
		model.addAttribute("student", studentDao.getStudent(nid));
		
		return "student/update"; 
		
	}
	
	@RequestMapping(value="/update/{nid}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String nid, @ModelAttribute("student") Student student, BindingResult bindingResult) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao);
		
		studentValidator.validateUpdate(student, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "student/update";
		
		 studentDao.updateStudent(student);
		 
		 return "redirect:../list.html"; 
		 
	  }


	
	//----------- eliminación ------------------
	@RequestMapping(value="/delete/{nid}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String nid) {
		
		model.addAttribute("student", studentDao.getStudent(nid));
		
		return "student/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{nid}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String nid, @ModelAttribute("student") Student student, BindingResult bindingResult) {
	
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao);
		
		studentValidator.validateDelete(student, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "student/delete";
		
		 studentDao.deleteStudent(nid);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
}