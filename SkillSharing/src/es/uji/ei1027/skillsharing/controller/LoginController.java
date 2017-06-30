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
		
		model.addAttribute("login", new Login());
	
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("login") Login login, BindingResult bindingResult, HttpSession session, Model model) {
	
		LoginValidator loginValidator = new LoginValidator();
		
		loginValidator.setLoginDAO(adminDao, studentDao);
		
		loginValidator.validateLogin(login, bindingResult);
		
		if ( bindingResult.hasErrors() ){
		
			return "login";
		}
		
		List<Admin> adminList = adminDao.getAdmins();
		
		for ( int i = 0; i < adminList.size(); i++ ){
			
			if ( adminList.get(i).getUsername().toLowerCase().equals(login.getUsername().toLowerCase()) ) {
				
				session.setAttribute("adminLogin", adminList.get(i));
				
				return "redirect:admin/main.html";
				
			}
		}
		List<Student> studentList = studentDao.getStudents();
		
		for ( int i = 0; i < studentList.size(); i++ )
			
			if ( studentList.get(i).getUsername().equals(login.getUsername()) ) {
				
				Student student = studentList.get(i);
				
				if (student.getBanned() == true){
					
					model.addAttribute("banned", true);
					return "login";
					
				}
				
				session.setAttribute("studentLogin", studentList.get(i));
				
				return "redirect:student/main.html";
				
			}
			
		return "redirect:index.jsp";
	}
	
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index.jsp";
		
	}
	
	
}
