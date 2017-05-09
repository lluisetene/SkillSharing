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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.StudentValidator;

@Controller
@RequestMapping("/student")
public class StudentController {

	private StudentDAO studentDao;
	
	
	@Autowired
	public void setStudentDato(StudentDAO studentDao) {
		this.studentDao = studentDao;
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
		
		studentValidator.setStudentDAO(studentDao);
		
		studentValidator.validateConsult(student, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "student/consult";
		
		model.addAttribute("studentResponse", studentDao.getStudent(student));
		
		return "student/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addStudent(Model model) {
		
		model.addAttribute("student", new Student());
		
		return"student/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao);
		
		studentValidator.validateAdd(student, bindingResult);
		
		if (bindingResult.hasErrors())

			return "student/add";
		
		studentDao.addStudent(student);
		
		return "redirect:main.html";
		
	}
	
	//----------- actualización ------------------
	@RequestMapping("/update")
	public String editStudent(Model model) {
		
		model.addAttribute("student", new Student());
		
		return "student/update";
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String processEditSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult) {

		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao);
		
		studentValidator.validateUpdate(student, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "student/update";
			
		return "redirect:main.html";
	}
	
	//----------- eliminación ------------------
	@RequestMapping("/delete")
	public String deleteStudent(Model model) {
		
		model.addAttribute("student", new Student());
		
		return "student/delete";
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String processDeleteSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao);
		
		studentValidator.validateDelete(student, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "student/delete";
		
			
			studentDao.deleteStudent(student);
		
		return "redirect:main.html";
	
	}
	
}