package es.uji.ei1027.skillsharing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.dao.UserLoginDAO;
import es.uji.ei1027.skillsharing.model.UserLogin;
import es.uji.ei1027.skillsharing.validators.UserLoginValidator;


@Controller
@RequestMapping("/login")
public class UserLoginController {
	
	private UserLoginDAO userLoginDao;
	private StudentDAO studentDao;
	private UserLoginValidator userLoginValidator;
	

	@Autowired
	public void setUserLoginDao(StudentDAO studentDao) {
		
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
		
		userLoginValidator.validateSearchUserLogin(userlogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/consult";
		
		model.addAttribute("loginResponse", userLoginDao.getUser(userlogin));
		
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
		
		userLoginValidator.validateUserLogin(userLogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/add";
		
		userLoginDao.addUser(userLogin);
		
		return "redirect:main.html";
	}
	
	
	
	//----------------- actualización -----------------
	@RequestMapping("/update")
	public String editUserLogin(Model model) {
		
		model.addAttribute("userlogin", new UserLogin());
		
		return "login/update";
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String processEditSubmit(@ModelAttribute("userlogin") UserLogin userLogin, BindingResult bindingResult) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.setUserLoginDAO(userLoginDao, studentDao);
		
		userLoginValidator.validateUserLogin(userLogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/update";
		
		userLoginDao.updateUser(userLogin);
		
		return "redirect:main.html";
	}
	
	
	//---------------- eliminación ---------------
	@RequestMapping("/delete")
	public String deleteUserLogin(Model model) {
		
		model.addAttribute("userlogin", new UserLogin());
		
		return "login/delete";
	}
	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String processDeleteSubmit(@ModelAttribute("userlogin") UserLogin userLogin, BindingResult bindingResult) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.setUserLoginDAO(userLoginDao, studentDao);
		
		userLoginValidator.validateSearchUserLogin(userLogin, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login/delete";
		
		userLoginDao.deleteUser(userLogin);
		
		return "redirect:main.html";
	}
	
	
	
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("userlogin", new UserLogin());
		return "login/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("userlogin") UserLogin userLogin, BindingResult bindingResult, HttpSession session) {
		
		userLoginValidator = new UserLoginValidator();
		
		userLoginValidator.validateUserLogin(userLogin, bindingResult);
		
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
