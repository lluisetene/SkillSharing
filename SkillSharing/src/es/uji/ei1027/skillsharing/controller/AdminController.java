package es.uji.ei1027.skillsharing.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import es.uji.ei1027.skillsharing.model.Admin;
import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Degree;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.AdminValidator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminDAO adminDao;
	private DegreeDAO degreeDao;
	private SkillDAO skillDao;
	private CollaborationDAO collaborationDao;
	private DemandDAO demandDao;
	private OfferDAO offerDao;
	private StudentDAO studentDao;
	private Statistics estadisticas;

	
	@Autowired
	public void setAdminDao(AdminDAO adminDao, DegreeDAO degreeDao, SkillDAO skillDao, CollaborationDAO collaborationDao, DemandDAO demandDao, OfferDAO offerDao, StudentDAO studentDao) {
		this.adminDao = adminDao;
		this.degreeDao = degreeDao;
		this.skillDao = skillDao;
		this.collaborationDao = collaborationDao;
		this.demandDao = demandDao;
		this.offerDao = offerDao;
		this.studentDao = studentDao;
		studentDao.setDatos(offerDao.getOffers(), demandDao.getDemands(), collaborationDao.getCollaborations());
	}
	
	//-------------------------------------------
	@RequestMapping("/main")
	public String mainUserLogin(Model model) {

		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("studentsList", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("adminsList", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
		model.addAttribute("skillsList", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("degreesList", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("offersList1", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("demandsList1", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("collaborationsDistinctSelect", collaborationDao.getCollaborationsDistinctRate());
		model.addAttribute("collaborationsList", collaborationDao.getCollaborations());
		model.addAttribute("skillDao", skillDao);
		
		model.addAttribute("student", studentDao);
		model.addAttribute("listaOfertasColab", offerDao.getOffersWithoutDateRestriction());
		model.addAttribute("listaDemandasColab", demandDao.getDemandsWithoutDateRestrict());
		
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		return "admin/main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String processListSubmit(@ModelAttribute("studentsSelect") Student student, @ModelAttribute("adminsSelect") Admin admin,  @ModelAttribute("skillsSelect") Skill skill, @ModelAttribute("degreesSelect") Degree degree, @ModelAttribute("offersSelect") Offer offer, @ModelAttribute("demandsSelect") Demand demand, @ModelAttribute("collaborationsSelect") Collaboration collaboration, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("studentsList", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("adminsList", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("skillsList", skillDao.getSkills());
		model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("degreesList", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("offersList", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("demandsList", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("collaborationsDistinctSelect", collaborationDao.getCollaborationsDistinctRate());
		model.addAttribute("collaborationsList", collaborationDao.getCollaborations());
		estadisticas = studentDao.getEstadisticas();
		model.addAttribute("statistics", estadisticas);
		
		
		if (student.getNid() != null){
	
			if (student.getNid().toUpperCase().equals("Todas".toUpperCase())){
				
				model.addAttribute("studentsSelect", studentDao.getStudents());
				model.addAttribute("studentsList", studentDao.getStudents());
				
			}else{	
				
				model.addAttribute("studentsSelect", studentDao.getStudents());
				List<Student> estudiantes = new LinkedList<Student>();
				estudiantes.add(studentDao.getStudent(student.getNid()));
				model.addAttribute("studentsList", estudiantes);
			}
		}
		
		if (admin.getUsername() != null){
		
			if(admin.getUsername().toUpperCase().equals("Todas".toUpperCase())){
		
				model.addAttribute("adminsSelect", adminDao.getAdmins());
				model.addAttribute("adminsList", adminDao.getAdmins());
	
			}else{
				
				model.addAttribute("adminsSelect", adminDao.getAdmins());
				List<Admin> admins = new LinkedList<Admin>();
				admins.add(adminDao.getAdmin(admin.getUsername()));
				model.addAttribute("adminsList", admins);
			
			}
		}
		
		if(skill.getIdSkill() == 0){
	
			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("skillsSelect",skillDao.getSkills());
			model.addAttribute("skillsList", skillDao.getSkills());

		}else{
			
			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("skillsSelect", skillDao.getSkills());
			Skill skill2 = skillDao.getSkill(skill.getIdSkill());
			model.addAttribute("skillsList", skillDao.getSkills(skill2.getName()));
		
		}
		
			
		if(degree.getIdDegree() == 0){
	
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("degreesList", degreeDao.getDegreesDistinctName());

		}else{
	
			List<Degree> degreesList = new LinkedList<Degree>();
			degreesList.add(degreeDao.getDegree(degree.getIdDegree()));
			model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
			model.addAttribute("degreesList", degreesList);
		
		}
	
		

			
		
		if(offer.getIdOffer() == 0){
			
			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			model.addAttribute("offersList1", offerDao.getOffers());

		}else{
			
			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("offersSelect", offerDao.getOffers());
			
			/*Es offer.getIdOffer y no offer.geIDSkill porque la id que cojo en el select idSkill ya la tiene
			la tabla skill y si le pongo la misma me busca en los 2 a al vez.*/
			
			List<Offer> offersList = offerDao.getOffers(skillDao.getSkill(offer.getIdOffer()).getName());
			
			model.addAttribute("offersList1", offersList);
		
		}

	
		if(demand.getIdDemand() == 0){
			
			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			model.addAttribute("demandsList1", demandDao.getDemands());

		}else{

			model.addAttribute("skillsDistinctSelect", skillDao.getSkillsDistinctName());
			model.addAttribute("demandsSelect", demandDao.getDemands());
			
			/*Es demand.getIdDemand y no offer.geIdSkill porque la id que cojo en el select idSkill ya la tiene
			la tabla skill y si le pongo la misma me busca en los 2 a al vez.*/

			List<Demand> demandsList = demandDao.getDemands(skillDao.getSkill(demand.getIdDemand()).getName());
			
			model.addAttribute("demandsList1", demandsList);
		
		}
		
		

		if (collaboration.getRate() == 0){		
			model.addAttribute("student", studentDao);
			model.addAttribute("listaOfertasColab", offerDao.getOffersWithoutDateRestriction());
			model.addAttribute("listaDemandasColab", demandDao.getDemandsWithoutDateRestrict());
			
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("collaborationsList", collaborationDao.getCollaborations());
			model.addAttribute("collaborationDistinctSelect", collaborationDao.getCollaborationsDistinctRate());

		}else{
			model.addAttribute("student", studentDao);
			model.addAttribute("listaOfertasColab", offerDao.getOffersWithoutDateRestriction());
			model.addAttribute("listaDemandasColab", demandDao.getDemandsWithoutDateRestrict());
			
			model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
			model.addAttribute("collaborationsList", collaborationDao.getCollaborations(collaboration.getRate()));
		
		}
		
		
		return "admin/main";
	
	}

	//----------------- configurar perfil -----------------
	@RequestMapping(value="/configurarPerfil/{username}", method = RequestMethod.GET)
	public String processConfigurarPerfilSubmit(Model model, @PathVariable String username) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("admin", adminDao.getAdmin(username));
		
		return "admin/configurarPerfil"; 
		
	}
	
	@RequestMapping(value="/configurarPerfil/{username}", method = RequestMethod.POST) 
	public String processConfigurarPerfilSubmit(@PathVariable String username, @ModelAttribute("admin") Admin admin, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		AdminValidator adminValidator = new AdminValidator();
		
		adminValidator.setAdminDAO(adminDao, studentDao);
		
		adminValidator.validateUpdate(admin, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "admin/configurarPerfil";
		
		 adminDao.updateAdmin(admin);
		 
		 return "redirect:../main.html"; 
		 
	  }

	
	//------------ listado ----------------------------
	@RequestMapping("/list")
	public String listUsersLogin(Model model) {
		
		model.addAttribute("admins", adminDao.getAdmins());
		
		return "admin/list";
	}
	
	//--------- búsqueda unitaria ----------------
	@RequestMapping("/consult")
	public String consultUserLogin(Model model) {
		
		model.addAttribute("admin", new Admin());
		
		return "admin/consult";
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("admin") Admin admin, BindingResult bindingResult, Model model) {
		
		AdminValidator adminValidator = new AdminValidator();
		
		adminValidator.setAdminDAO(adminDao, studentDao);
		
		adminValidator.validateConsult(admin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "admin/consult";
		
		model.addAttribute("adminResponse", adminDao.getAdmin(admin.getUsername()));
		
		return "admin/consult";
	}
	
	
	//----------------- añadir --------------------
	@RequestMapping("/add")
	public String addUserLogin(Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("admin", new Admin());
		
		return "admin/add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("admin") Admin admin, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		AdminValidator adminValidator = new AdminValidator();
		
		adminValidator.setAdminDAO(adminDao, studentDao);
		
		adminValidator.validateAdd(admin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "admin/add";
		
		adminDao.addAdmin(admin);
		
		return "redirect:main.html";
	}
	
	
	
	//----------------- actualización -----------------
	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String username) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("admin", adminDao.getAdmin(username));
		
		return "admin/update"; 
		
	}
	
	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("admin") Admin admin, BindingResult bindingResult, Model model) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		AdminValidator adminValidator = new AdminValidator();
		
		adminValidator.setAdminDAO(adminDao, studentDao);
		
		adminValidator.validateUpdate(admin, bindingResult);
		
		if (bindingResult.hasErrors()) 
			
			 return "admin/update";
		
		 adminDao.updateAdmin(admin);
		 
		 return "redirect:../main.html"; 
		 
	  }
	
	
	//---------------- eliminación ---------------
	@RequestMapping(value="/delete/{username}", method = RequestMethod.GET)
	public String processDeleteSubmit(Model model, @PathVariable String username) {
		
		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		model.addAttribute("admin", adminDao.getAdmin(username));
		
		return  "admin/delete"; 
		
	}
	
	@RequestMapping(value="/delete/{username}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String username, @ModelAttribute("admin") Admin admin, BindingResult bindingResult, Model model) {

		model.addAttribute("studentsSelect", studentDao.getStudents());
		model.addAttribute("adminsSelect", adminDao.getAdmins());
		model.addAttribute("skillsSelect", skillDao.getSkills());
		model.addAttribute("degreesSelect", degreeDao.getDegreesDistinctName());
		model.addAttribute("offersSelect", offerDao.getOffers());
		model.addAttribute("demandsSelect", demandDao.getDemands());
		model.addAttribute("collaborationsSelect", collaborationDao.getCollaborations());
		
		if (bindingResult.hasErrors()) {
			
			return  "admin/delete"; 
		}
		adminDao.deleteAdmin(admin.getUsername());
		
		 return "redirect:../main.html"; 
		 
	  }
	
	//---------------- eliminación ---------------
	@RequestMapping(value="/deleteDesdePerfil/{username}", method = RequestMethod.GET)
	public String processDeleteDesdePerfilSubmit(Model model, @PathVariable String username, HttpSession session) {

		adminDao.deleteAdmin(username);
		session.invalidate();
		
		return "redirect:../../index.jsp"; 
		
	}
	
	
	
}
