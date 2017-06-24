package es.uji.ei1027.skillsharing.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Collaboration {
		
	private int idCollaboration;
	private int idOffer;
	private int idDemand;
	private Date beginningDate;
	private Date endingDate;
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
		
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
		
		return formateador.format(beginningDate);
		
	}

	public Date getBeginningDateBD() {
		
		return beginningDate;
		
	}
	
	

	public void setBeginningDate(Date beginningDate) {
		
		this.beginningDate = beginningDate;
		
	}
	
	public String getEndingDate(){
	
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
	
		return formateador.format(endingDate);
	
	}
	
	public Date getEndingDateBD() {
		
		return endingDate;
		
	}

	public void setEndingDate(Date endingDate) {
		
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
	
	public boolean colaboracionCaducada() {
		
	   Date date = new Date();
	   SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
	   String fechaDeHoy[] = ft.format(date).split("-");
	   String finalColaboracion[] = ft.format(endingDate).split("-");
	   
	   if ( Integer.parseInt(finalColaboracion[0]) <= Integer.parseInt(fechaDeHoy[0]) ) 
		   if ( Integer.parseInt(finalColaboracion[1]) <= Integer.parseInt(fechaDeHoy[1]) ) 
			   if ( Integer.parseInt(finalColaboracion[2]) <= Integer.parseInt(fechaDeHoy[2]) )
				   return false;
	   return true;
	  
	}

	@Override
	public String toString() {
		
		return "idCollaboration = " + idCollaboration + ", IdOffer = " + idOffer + ", idDemand = " + idDemand + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate + ", hours = " + hours + ", rate = " + rate;
	
	}
	
}