package es.uji.ei1027.skillsharing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.model.Admin;
import es.uji.ei1027.skillsharing.validators.AdminValidator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminDAO adminDao;

	
	@Autowired
	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}
	
	//-------------------------------------------
	@RequestMapping("/main")
	public String mainUserLogin(Model model) {
		
		return "admin/main";
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
		
		adminValidator.setAdminDAO(adminDao);
		
		adminValidator.validateConsult(admin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "admin/consult";
		
		model.addAttribute("adminResponse", adminDao.getAdmin(admin.getUsername()));
		
		return "admin/consult";
	}
	
	
	//----------------- añadir --------------------
	@RequestMapping("/add")
	public String addUserLogin(Model model) {
		
		model.addAttribute("admin", new Admin());
		
		return "admin/add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("admin") Admin admin, BindingResult bindingResult) {
		
		AdminValidator adminValidator = new AdminValidator();
		
		adminValidator.setAdminDAO(adminDao);
		
		adminValidator.validateAdd(admin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "admin/add";
		
		adminDao.addAdmin(admin);
		
		return "redirect:main.html";
	}
	
	
	
	//----------------- actualización -----------------
	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String username) {
		
		model.addAttribute("admin", adminDao.getAdmin(username));
		
		return "admin/update"; 
		
	}
	
	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("admin") Admin admin, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) 
			
			 return "admin/update";
		
		 adminDao.updateAdmin(admin);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
	
	//---------------- eliminación ---------------
	@RequestMapping(value="/delete/{username}")
	public String processDeleteSubmit(@PathVariable String username) {
			
		adminDao.deleteAdmin(username);
		
		return "redirect:../list.html";
	
	}
	
	
	
}
