package es.uji.ei1027.skillsharing.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.AdminDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;
import es.uji.ei1027.skillsharing.model.Admin;
import es.uji.ei1027.skillsharing.model.Login;
import es.uji.ei1027.skillsharing.model.Student;
import es.uji.ei1027.skillsharing.validators.LoginValidator;

@Controller
public class LoginController {

	private StudentDAO studentDao;
	private AdminDAO adminDao;
	
	@Autowired
	public void setDaos(StudentDAO studentDao, AdminDAO adminDao) {
		
		this.studentDao = studentDao;
		
		this.adminDao = adminDao;
		
	}

	
	@RequestMapping("/login")
	public String login(Model model) {
		
		model.addAttribute("login", null);
		
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("login") Login login, BindingResult bindingResult, HttpSession session) {
		
		LoginValidator loginValidator = new LoginValidator();
		
		loginValidator.setLoginDAO(adminDao, studentDao);
		
		loginValidator.validateLogin(login, bindingResult);
		
		if ( bindingResult.hasErrors() )
			
			return "login";
		
		List<Admin> adminList = adminDao.getAdmins();
		
		for ( int i = 0; i < adminList.size(); i++ )
			
			if ( adminList.get(i).getUsername().equals(login.getUsername()) ) {
				
				session.setAttribute("login", adminList.get(i));
				
				return "redirect:loginAdministrador";
				
			}
		
		List<Student> studentList = studentDao.getStudents();
		
		for ( int i = 0; i < studentList.size(); i++ )
			
			if ( studentList.get(i).getUsername().equals(login.getUsername()) ) {
				
				session.setAttribute("login", studentList.get(i));
				
				return "redirect:loginStudent";
				
			}
			
		return "redirect:index.jsp";
	}
	
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index.jsp";
		
	}
	
	
}
