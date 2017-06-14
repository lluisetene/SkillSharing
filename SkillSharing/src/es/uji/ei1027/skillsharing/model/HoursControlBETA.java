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
		
		System.out.println("addHours: " + hours);
		
		String NIDOfferer = offerDao.getOffer(collaboration.getIdOffer()).getNid();
		String NIDDemandant = demandDao.getDemand(collaboration.getIdDemand()).getNid();
		List<Student> studentsCollaboration = studentDao.getStudents();
		
		
		for (int indice = 0; indice < studentsCollaboration.size(); indice += 1){
			
			Student student = studentsCollaboration.get(indice);
			
			if (student.getNid().trim().toUpperCase().equals(NIDOfferer.trim().toUpperCase())){
			
				String [] horasActuales = student.getOfferHours().split(":");
				int horasTengo = Integer.parseInt(horasActuales[0]);
				String [] horasAcumular = hours.split((":"));
				int horasSumar = Integer.parseInt(horasAcumular[0]);
				int sumado = horasTengo + horasSumar;
				String setHoras = String.valueOf(sumado) + ":" + "00"; 
				
				student.setOfferHours(setHoras);
				studentDao.updateStudent(student);
				
			}else if (student.getNid().trim().toUpperCase().equals(NIDDemandant.trim().toUpperCase())){
				
				String [] horasActuales = student.getDemandHours().split(":");
				int horasTengo = Integer.parseInt(horasActuales[0]);
				String [] horasAcumular = hours.split((":"));
				int horasSumar = Integer.parseInt(horasAcumular[0]);
				int sumado = horasTengo + horasSumar;
				String setHoras = String.valueOf(sumado) + ":" + "00"; 
				
				student.setDemandHours(setHoras);
				studentDao.updateStudent(student);
			
			}
		}
		
	}
	
	public void removeHours(String hours){
		
		System.out.println("removeHours: " + hours);
		
		String NIDOfferer = offerDao.getOffer(collaboration.getIdOffer()).getNid();
		String NIDDemandant = demandDao.getDemand(collaboration.getIdDemand()).getNid();
		List<Student> studentsCollaboration = studentDao.getStudents();
		
		
		for (int indice = 0; indice < studentsCollaboration.size(); indice += 1){
			
			Student student = studentsCollaboration.get(indice);
			
			if (student.getNid().trim().toUpperCase().equals(NIDOfferer.trim().toUpperCase())){
				
				
				String [] horasActuales = student.getOfferHours().split(":");
				int horasTengo = Integer.parseInt(horasActuales[0]);
				String [] horasAcumular = hours.split((":"));
				int horasSumar = Integer.parseInt(horasAcumular[0]);
				int sumado = horasTengo - horasSumar;
				String setHoras = String.valueOf(sumado) + ":" + "00"; 
				
				student.setOfferHours(setHoras);
				studentDao.updateStudent(student);
				
				
			}else if (student.getNid().trim().toUpperCase().equals(NIDDemandant.trim().toUpperCase())){
				
				String [] horasActuales = student.getDemandHours().split(":");
				int horasTengo = Integer.parseInt(horasActuales[0]);
				String [] horasAcumular = hours.split((":"));
				int horasSumar = Integer.parseInt(horasAcumular[0]);
				int sumado = horasTengo - horasSumar;
				String setHoras = String.valueOf(sumado) + ":" + "00"; 
				
				student.setDemandHours(setHoras);
				studentDao.updateStudent(student);
			}
			
		}
		
	}
}
	
