package es.uji.ei1027.skillsharing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.dao.UserLoginDAO;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.model.UserLogin;
import es.uji.ei1027.skillsharing.validators.UserLoginValidator;

@Controller
@RequestMapping("/login")
public class UserLoginController {
	
	private UserLoginDAO userLoginDao;
	private StudentDAO studentDao;
	private UserLoginValidator userLoginValidator;
	

	@Autowired
	public void setUserLoginDao(UserLoginDAO userLoginDao, StudentDAO studentDao) {
		this.userLoginDao = userLoginDao;
		this.studentDao = studentDao;
	}
	
	//-------------------------------------------
	@RequestMapping("/main")
	public String mainUserLogin(Model model) {
		
		return "login/main";
	}
	
	//------------ listado ----------------------------
	@RequestMapping("/list")
	public String listUsersLogin(Model model) {
		
		model.addAttribute("userslogin", userLoginDao.getUsers());
		
		return "login/list";
	}
	
	//--------- búsqueda unitaria ----------------
	@RequestMapping("/consult")
	public String consultUserLogin(Model model) {
		
		model.addAttribute("userlogin", new UserLogin());
		
		return "login/consult";
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("userlogin") UserLogin userlogin, BindingResult bindingResult, Model model) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.setUserLoginDAO(userLoginDao, studentDao);
		
		userLoginValidator.validateConsult(userlogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/consult";
		
		model.addAttribute("loginResponse", userLoginDao.getUser(userlogin.getUsername()));
		
		return "login/consult";
	}
	
	
	//----------------- añadir --------------------
	@RequestMapping("/add")
	public String addUserLogin(Model model) {
		
		model.addAttribute("userlogin", new UserLogin());
		
		return "login/add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("userlogin") UserLogin userLogin, BindingResult bindingResult) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.setUserLoginDAO(userLoginDao, studentDao);
		
		userLoginValidator.validateAdd(userLogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/add";
		
		userLoginDao.addUser(userLogin);
		
		return "redirect:main.html";
	}
	
	
	
	//----------------- actualización -----------------
	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String processUpdateSubmit(Model model, @PathVariable String username) {
		
		model.addAttribute("userlogin", userLoginDao.getUser(username));
		
		return "login/update"; 
		
	}
	
	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("userlogin") UserLogin userlogin, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) 
			
			 return "login/update";
		
		 userLoginDao.updateUser(userlogin);
		 
		 return "redirect:../list.html"; 
		 
	  }
	
	
	//---------------- eliminación ---------------
	@RequestMapping(value="/delete/{username}")
	public String processDeleteSubmit(@PathVariable String username) {
			
		userLoginDao.deleteUser(username);
		
		return "redirect:../list.html";
	
	}
	
	
	
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("userlogin", new UserLogin());
		return "login/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("userlogin") UserLogin userLogin, BindingResult bindingResult, HttpSession session) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.validateLogin(userLogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/main";
			
		//autenticado correctamente. se guardan los datos del usuario autenticado en la sesión
		session.setAttribute("userlogin", userLogin);
			
		return "redirect:main.html";
	}
	
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}
	
}
