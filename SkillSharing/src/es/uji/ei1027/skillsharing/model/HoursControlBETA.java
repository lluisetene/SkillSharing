package es.uji.ei1027.skillsharing.model;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	
	public void addHours(String hours, HttpSession sesion){
		
		Student student = (Student)sesion.getAttribute("studentLogin");
		Student studentOffer = null;
		Student studentDemand = null;
		
		if (offerDao.getOffer(collaboration.getIdOffer()).getNid().trim().toUpperCase().equals(student.getNid().trim().toUpperCase())){
		
			studentOffer = student;
			studentDemand = studentDao.getStudent(demandDao.getDemand(collaboration.getIdDemand()).getNid());
			
		}else if (demandDao.getDemand(collaboration.getIdDemand()).getNid().trim().toUpperCase().equals(student.getNid().trim().toUpperCase())){
			
			studentDemand = student;
			studentOffer = studentDao.getStudent(offerDao.getOffer(collaboration.getIdOffer()).getNid());
			
		}
		String [] horasActuales = studentOffer.getOfferHours().split(":");
		int horasTengo = Integer.parseInt(horasActuales[0]);
		String [] horasAcumular = collaboration.getHours().split((":"));
		int horasSumar = Integer.parseInt(horasAcumular[0]);
		int sumado = horasTengo + horasSumar;
		String setHoras = String.valueOf(sumado) + ":" + "00"; 
	
		studentOffer.setOfferHours(setHoras);
		studentDao.updateStudent(studentOffer);
		
		String [] horasActuales2 = studentDemand.getDemandHours().split(":");
		int horasTengo2 = Integer.parseInt(horasActuales2[0]);
		String [] horasAcumular2 = collaboration.getHours().split((":"));
		int horasSumar2 = Integer.parseInt(horasAcumular2[0]);
		int sumado2 = horasTengo2 + horasSumar2;
		String setHoras2 = String.valueOf(sumado2) + ":" + "00"; 
		
		studentDemand.setDemandHours(setHoras2);
		studentDao.updateStudent(studentDemand);
	
		
	}

}
	
