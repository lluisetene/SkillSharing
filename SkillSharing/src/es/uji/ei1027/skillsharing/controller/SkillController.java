package es.uji.ei1027.skillsharing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.SkillDAO;
import es.uji.ei1027.skillsharing.model.Skill;
import es.uji.ei1027.skillsharing.validators.SkillValidator;

@Controller
@RequestMapping("/skill")
public class SkillController {
	
	private SkillDAO skillDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	
	@Autowired
	public void setSkillDao(SkillDAO skillDao, OfferDAO offerDao, DemandDAO demandDao) {
		this.skillDao = skillDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		
	}
	
	//---------- página de métodos ---------
	
	@RequestMapping("/main")
	public String mainSkills(Model model) {
		
		return "skill/main";
		
	}
	
	//----------- listado ------------------
	@RequestMapping("/list")
	public String listSkill(Model model) {
		
		model.addAttribute("skills", skillDao.getSkills());
		
		return "skill/list";
		
	}
	
	//----------- búsqueda unitaria ------------------
	@RequestMapping("/consult")
	public String consultSkill(Model model) {
		
		//Guardo en el atributo skill el objeto de tipo skill.
		model.addAttribute("skill", new Skill());
	
		return "skill/consult";
		
	}
	
	@RequestMapping(value="/consult", method=RequestMethod.POST)
	public String processConsultSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult, Model model) {
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateConsult(skill, bindingResult);
		
		if (bindingResult.hasErrors())
		
			return "skill/consult";
		
		model.addAttribute("skillResponse", skillDao.getSkill(skill));
		
		return "skill/consult";
	
	}
	
	//----------- añadir ------------------
	@RequestMapping("/add")
	public String addSkill(Model model) {
		
		model.addAttribute("skill", new Skill());
		
		return"skill/add";
		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult) {
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateAdd(skill, bindingResult);
		
		if (bindingResult.hasErrors())
	
			return "skill/add";
			
		skillDao.addSkill(skill);
		
		return "redirect:main.html";
		
	}
	
	//----------- actualización ------------------
	@RequestMapping("/update")
	public String editSkill(Model model) {
		
		model.addAttribute("skill", new Skill());
		
		return "skill/update";
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String processEditSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult) {
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateUpdate(skill, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "skill/update";
		
		skillDao.updateSkill(skill);
		
		return "redirect:main.html";
	}
	
	//----------- eliminación ------------------
	@RequestMapping("/delete")
	public String deleteSkill(Model model) {
		
		model.addAttribute("skill", new Skill());
		
		return "skill/delete";
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String processDeleteSubmit(@ModelAttribute("skill") Skill skill, BindingResult bindingResult) {
		
		SkillValidator skillValidator = new SkillValidator();
		
		skillValidator.setSkillDAO(skillDao, offerDao, demandDao);
		
		skillValidator.validateDelete(skill, bindingResult);
		
		if (bindingResult.hasErrors())
			
			return "skill/delete";
			
		skillDao.deleteSkill(skill);
		
		return "redirect:main.html";
	
	}
	
}