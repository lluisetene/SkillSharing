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
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.StudentValidator;

@Controller
@RequestMapping("/student")
public class StudentController {

	private StudentDAO studentDao;
	private CollaborationDAO collaborationDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	private AdminDAO adminDao;
	private SkillDAO skillDao;
	private DegreeDAO degreeDao;
	private Statistics estadisticas;
	
	@Autowired
	public void setStudentDato(StudentDAO studentDao, CollaborationDAO collaborationDao, OfferDAO offerDao, DemandDAO demandDao, AdminDAO adminDao, SkillDAO skillDao, DegreeDAO degreeDao) {
		this.studentDao = studentDao;
		this.collaborationDao = collaborationDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.adminDao = adminDao;
		this.skillDao = skillDao;
		this.degreeDao = degreeDao;
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
	public String mainStudents(Model model, HttpSession sesion) {
		
		model.addAttribute("skills", skillDao);
		model.addAttribute("student", studentDao);
		List<Offer> offersList = offerDao.getOffersWithoutDateRestriction();
		model.addAttribute("listaOfertasColab", offersList);

		List<Demand> demandsList = demandDao.getDemandsWithoutDateRestrict();
		model.addAttribute("listaDemandasColab", demandsList);
		
		Student student = (Student) sesion.getAttribute("studentLogin");
	
		model.addAttribute("collaborationsList", collaborationDao.getCollaborationsStudent(student.getNid()));
		
		estadisticas = studentDao.getEstadisticas();
		estadisticas.setDatos(offerDao.getOffers(), demandDao.getDemands(), collaborationDao.getCollaborations());
		
		model.addAttribute("statistics", estadisticas);
		
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
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao, adminDao);
		
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
	public String processAddSubmit(@ModelAttribute("student") Student student, BindingResult bindingResult, HttpSession session) {
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao, adminDao);
		
		studentValidator.validateAdd(student, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "student/registrarse";
	
		studentDao.addStudent(student);
		
		List<Student> studentList = studentDao.getStudents();
		
		for ( int i = 0; i < studentList.size(); i++ )
			
			if ( studentList.get(i).getNid().equals(student.getNid()) ) {
				
				session.setAttribute("studentLogin", studentList.get(i));
				
				return "redirect:main.html";
				
			}
		
		return "redirect:index.jsp";
		
	}
	
	
	
	@RequestMapping(value="/update/{nid}", method = RequestMethod.GET)
	public String updateStudent(Model model, @PathVariable String nid) {
		
		model.addAttribute("degreesStudent", degreeDao.getStudentDegreeList(nid));
		
		model.addAttribute("student", studentDao.getStudent(nid));
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "student/update";
		
	}
	
	@RequestMapping(value="/update/{nid}", method=RequestMethod.POST)
	public String processUpdateSubmit(Model model, @PathVariable String nid, @ModelAttribute("student") Student student, BindingResult bindingResult) {
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		model.addAttribute("degreesStudent", degreeDao.getStudentDegreeList(nid));
		
		StudentValidator studentValidator = new StudentValidator();

		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao, adminDao);
		
		studentValidator.validateUpdate(student, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "student/update";
		
		studentDao.updateStudent(student);

		return "student/main";
		
	}
	
	
	
	//----------- actualización de administrador ------------------
	@RequestMapping(value="/updateByAdmin/{nid}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String nid) {
		
		model.addAttribute("student", studentDao.getStudent(nid));
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		return "student/updateByAdmin"; 
		
	}
	
	@RequestMapping(value="/updateByAdmin/{nid}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String nid, @ModelAttribute("student") Student student, BindingResult bindingResult, Model model) {
		
		model.addAttribute("student", studentDao.getStudent(nid));
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		StudentValidator studentValidator = new StudentValidator();
		
		studentValidator.setStudentDAO(studentDao, collaborationDao, offerDao, demandDao, adminDao);
		
		studentValidator.validateUpdate(student, bindingResult);
		
		if (bindingResult.hasErrors()){ 
			
			 return "student/updateByAdmin";
		 
		}
		
		
		
		 studentDao.updateStudent(student);
		 
		 return "redirect:../../admin/main.html"; 
		 
	  }


	
	//----------- eliminación ------------------
	@RequestMapping(value="/deleteByAdmin/{nid}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String nid) {
		
		model.addAttribute("student", studentDao.getStudent(nid));
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
	
		return  "student/deleteByAdmin"; 
		
	}
	
	@RequestMapping(value="/deleteByAdmin/{nid}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String nid, @ModelAttribute("student") Student student, BindingResult bindingResult, Model model) {

		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		
		if (bindingResult.hasErrors()) {
			
			return  "student/deleteByAdmin"; 
		}
		
		List<Collaboration> collaborationsList = collaborationDao.getCollaborations();
		
		for(int indice = 0; indice < collaborationsList.size(); indice += 1){
			
			int idOffer = collaborationsList.get(indice).getIdOffer();
			int idDemand = collaborationsList.get(indice).getIdDemand();
			String nidOffer = offerDao.getOffer(idOffer).getNid();
			String nidDemand = demandDao.getDemand(idDemand).getNid();
			
			if (student.getNid().trim().toUpperCase().equals(nidOffer) || student.getNid().trim().toUpperCase().equals(nidDemand)){
				model.addAttribute("Error", true);
				return "student/deleteByAdmin";
			
			}
			
		}
		
		 studentDao.deleteStudent(nid);
		 return "redirect:../../admin/main.html"; 
		 
	  }
	
	@RequestMapping(value="/addDegree", method = RequestMethod.GET)
	public String processDeleteDesdePerfilSubmit(@ModelAttribute("degree") Degree degree) {
		
		degreeDao.addDegree(degree);
		
		return "redirect:../../index.jsp"; 
		
	}
	
	//---------------- eliminación ---------------
	@RequestMapping(value="/delete/{nid}", method = RequestMethod.GET)
	public String processDeleteDesdePerfilSubmit(Model model, @PathVariable String nid, HttpSession session) {

		studentDao.deleteStudent(nid);
		session.invalidate();
		
		return "redirect:../../index.jsp"; 
		
	}

	
}