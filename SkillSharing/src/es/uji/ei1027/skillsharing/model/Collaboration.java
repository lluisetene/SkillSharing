package es.uji.ei1027.skillsharing.model;

import java.util.Date;

public class Collaboration {
		
	private String idCollaboration;
	private String idOffer;
	private String idDemand;
	private Date beginningDate;
	private Date endingDate;
	private Date hours;
	private float rate;
	
	public String getIdCollaboration() {
		
		return idCollaboration;
		
	}

	public void setIdCollaboration(String idCollaboration) {
		
		this.idCollaboration = idCollaboration;
		
	}

	public String getIdOffer() {
		
		return idOffer;
		
	}

	public void setIdOffer(String idOffer) {
		
		this.idOffer = idOffer;
		
	}

	public String getIdDemand() {
		
		return idDemand;
		
	}

	public void setIdDemand(String idDemand) {
		
		this.idDemand = idDemand;
		
	}

	public Date getBeginningDate() {
		
		return beginningDate;
		
	}

	public void setBeginningDate(Date beginningDate) {
		
		this.beginningDate = beginningDate;
		
	}

	public Date getEndingDate() {
		
		return endingDate;
		
	}

	public void setEndingDate(Date endingDate) {
		
		this.endingDate = endingDate;
		
	}

	public Date getHours() {
		
		return hours;
		
	}

	public void setHours(Date hours) {
		
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
		
		return "Collaboration [idCollaboration = " + idCollaboration + ", IdOffer = " + idOffer + ", idDemand = " + idDemand + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate + ", hours = " + hours + ", rate = " + rate + "]";
	
	}
	
}