package es.uji.ei1027.skillsharing.model;

import java.util.Date;

public class Demand {

	private String idDemand;
	private String nid;
	private String name;
	private String idSkill;
	private String description;
	private Date beginningDate;
	private Date endingDate;
	
	public String getIdDemand() {
		
		return idDemand;
		
	}

	public void setIdDemand(String idDemand) {
		
		this.idDemand = idDemand;
		
	}

	public String getNid() {
		
		return nid;
		
	}

	public void setNid(String nid) {
	
		this.nid = nid.toUpperCase(); //La letra del DNI se convertira a mayusculas para coincidir con la BD.
	
	}

	public String getName() {
		
		return name;
		
	}

	public void setName(String name) {
		
		this.name = name;
		
	}

	public String getIdSkill() {
		
		return idSkill;
		
	}

	public void setIdSkill(String idSkill) {
		
		this.idSkill = idSkill;
		
	}

	public String getDescription() {
		
		return description;
		
	}

	public void setDescription(String description) {
		
		this.description = description;
		
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

	@Override
	public String toString() {
		
		return "Demand [idDemand = " + idDemand + ", nid = " + nid +", name = " + name + ", idSkill = " + idSkill + ", description = " + description + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate + "]";
	
	}
	
}