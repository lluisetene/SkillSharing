package es.uji.ei1027.skillsharing.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Collaboration {
		
	private int idCollaboration;
	private int idOffer;
	private int idDemand;
	private String beginningDate;
	private String endingDate;
	private String hours;
	private float rate;
	
	public int getIdCollaboration() {
		
		return idCollaboration;
		
	}

	public void setIdCollaboration(int idCollaboration) {
		
		this.idCollaboration = idCollaboration;
		
	}

	public int getIdOffer() {
		
		return idOffer;
		
	}

	public void setIdOffer(int idOffer) {
		
		this.idOffer = idOffer;
		
	}

	public int getIdDemand() {
		
		return idDemand;
		
	}

	public void setIdDemand(int idDemand) {
		
		this.idDemand = idDemand;
		
	}
	
	public String getBeginningDate(){
		
		return beginningDate;
		
	}

	public Date getBeginningDateBD() {
		
	//Año -1900 porque empieza en 1900, Mes-1 porque va de 0 a 11
		
		return new Date(Integer.parseInt(beginningDate.split("/")[2])-1900, Integer.parseInt(beginningDate.split("/")[1])-1, Integer.parseInt(beginningDate.split("/")[0]));
		
	}
	
	

	public void setBeginningDate(String beginningDate) {
		
		this.beginningDate = beginningDate;
		
	}
	
	public String getEndingDate(){
	
		return endingDate;
	
	}
	
	public Date getEndingDateBD() {
		
		//Año -1900 porque empieza en 1900, Mes-1 porque va de 0 a 11
		
		return new Date(Integer.parseInt(endingDate.split("/")[2])-1900, Integer.parseInt(endingDate.split("/")[1])-1, Integer.parseInt(endingDate.split("/")[0]));
		
	}

	public void setEndingDate(String endingDate) {
		
		this.endingDate = endingDate;
		
	}

	public String getHours() {
		
		return hours;
		
	}

	public void setHours(String hours) {
		
		this.hours = hours;
		
	}

	public float getRate() {
		
		return rate;
		
	}

	public void setRate(float rate) {
		
		this.rate = rate;
		
	}
	
	@Override
	public String toString() {
		
		return "idCollaboration = " + idCollaboration + ", IdOffer = " + idOffer + ", idDemand = " + idDemand + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate + ", hours = " + hours + ", rate = " + rate;
	
	}
	
}