package es.uji.ei1027.skillsharing.model;

import java.util.Date;
import java.util.List;

import es.uji.ei1027.skillsharing.dao.DemandDAO;
import es.uji.ei1027.skillsharing.dao.OfferDAO;
import es.uji.ei1027.skillsharing.dao.StudentDAO;

public class HoursControlBETA {
	
	private StudentDAO studentDao;
	private OfferDAO offerDao;
	private DemandDAO demandDao;
	private Collaboration collaboration;
	
	public HoursControlBETA (StudentDAO studentDao, OfferDAO offerDao, DemandDAO demandDao, Collaboration collaboration) {
		
		this.studentDao = studentDao;
		this.offerDao = offerDao;
		this.demandDao = demandDao;
		this.collaboration = collaboration;
		
	}
	
	public void addHours(Date hours){
		
		String NIDOfferer = offerDao.getOffer(collaboration.getIdOffer()).getNid();
		String NIDDemandant = demandDao.getDemand(collaboration.getIdDemand()).getNid();
		List<Student> studentsCollaboration = studentDao.getStudents();
		
		
		for (int indice = 0; indice < studentsCollaboration.size(); indice += 1){
			
			Student student = studentsCollaboration.get(indice);
			
			if (student.getNid().trim().toUpperCase().equals(NIDOfferer.trim().toUpperCase())){
				
				Date horasTenidas = student.getOfferHours();
				int nuevasHoras = student.getOfferHours().getHours() + hours.getHours();
				horasTenidas.setHours(nuevasHoras);
				
				student.setOfferHours(horasTenidas);
				studentDao.updateStudent(student);
				
				
			}else if (student.getNid().trim().toUpperCase().equals(NIDDemandant.trim().toUpperCase())){
				
				Date horasTenidas = student.getDemandHours();
				int nuevasHoras = student.getDemandHours().getHours() + hours.getHours();
				horasTenidas.setHours(nuevasHoras);
				
				student.setDemandHours(horasTenidas);
				studentDao.updateStudent(student);
				
			}
			
		}
		
	}
	
	public void removeHours(Date hours){
		
		String NIDOfferer = offerDao.getOffer(collaboration.getIdOffer()).getNid();
		String NIDDemandant = demandDao.getDemand(collaboration.getIdDemand()).getNid();
		List<Student> studentsCollaboration = studentDao.getStudents();
		
		
		for (int indice = 0; indice < studentsCollaboration.size(); indice += 1){
			
			Student student = studentsCollaboration.get(indice);
			
			if (student.getNid().trim().toUpperCase().equals(NIDOfferer.trim().toUpperCase())){
				
				Date horasTenidas = student.getOfferHours();
				int nuevasHoras = student.getOfferHours().getHours() - hours.getHours();
				horasTenidas.setHours(nuevasHoras);
				
				student.setOfferHours(horasTenidas);
				studentDao.updateStudent(student);
				
				
			}else if (student.getNid().trim().toUpperCase().equals(NIDDemandant.trim().toUpperCase())){
				
				Date horasTenidas = student.getDemandHours();
				int nuevasHoras = student.getDemandHours().getHours() - hours.getHours();
				horasTenidas.setHours(nuevasHoras);
				
				student.setDemandHours(horasTenidas);
				studentDao.updateStudent(student);
				
			}
			
		}
		
	}

}
