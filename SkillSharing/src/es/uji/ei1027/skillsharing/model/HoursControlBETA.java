package es.uji.ei1027.skillsharing.model;

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
	
	
	public void addHours(String hours){
		
		String NIDOfferer = offerDao.getOffer(collaboration.getIdOffer()).getNid();
		String NIDDemandant = demandDao.getDemand(collaboration.getIdDemand()).getNid();
		Student studentOffer = studentDao.getStudent(NIDOfferer);
		Student studentDemand = studentDao.getStudent(NIDDemandant);
		
		System.out.println("Ofertante: " + studentOffer);
		System.out.println("studentDemand " + studentDemand);
		
		String [] horasActuales = studentOffer.getOfferHours().split(":");
		int horasTengo = Integer.parseInt(horasActuales[0]);
		String [] horasAcumular = hours.split((":"));
		int horasSumar = Integer.parseInt(horasAcumular[0]);
		int sumado = horasTengo + horasSumar;
		String setHoras = String.valueOf(sumado) + ":" + "00"; 
	
		studentOffer.setOfferHours(setHoras);
		studentDao.updateStudent(studentOffer);
		
		String [] horasActuales2 = studentDemand.getDemandHours().split(":");
		int horasTengo2 = Integer.parseInt(horasActuales2[0]);
		String [] horasAcumular2 = hours.split((":"));
		int horasSumar2 = Integer.parseInt(horasAcumular2[0]);
		int sumado2 = horasTengo2 + horasSumar2;
		String setHoras2 = String.valueOf(sumado2) + ":" + "00"; 
		
		studentDemand.setDemandHours(setHoras2);
		studentDao.updateStudent(studentDemand);
	
		
	}

}
	
