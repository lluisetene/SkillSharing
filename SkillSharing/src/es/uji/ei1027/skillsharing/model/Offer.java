package es.uji.ei1027.skillsharing.model;

import java.util.Date;

public class Offer {

	private int idOffer;
	private String nid;
	private String name;
	private int idSkill;
	private String description;
	private String beginningDate;
	private String endingDate;
	
	public int getIdOffer() {
		
		return idOffer;
		
	}

	public void setIdOffer(int idOffer) {
		
		this.idOffer = idOffer;
		
	}

	public String getNid() {
		
		return nid;
		
	}

	public void setNid(String nid) {
		
		this.nid = nid.toUpperCase();  //La letra del DNI se convertira a mayusculas para coincidir con la BD.
		
	}

	public String getName() {
		
		return name;
		
	}

	public void setName(String name) {
		
		this.name = name;
		
	}

	public int getIdSkill() {
		
		return idSkill;
		
	}

	public void setIdSkill(int idSkill) {
		
		this.idSkill = idSkill;
		
	}

	public String getDescription() {
		
		return description;
		
	}

	public void setDescription(String description) {
		
		this.description = description;
		
	}
	//Este lo convertimos para mostrarlo bien durante su uso y de vuelta a la BD usamos el otro
	public String getBeginningDate(){
		
		return beginningDate;
		
	}
	//Es necesario porque en la base de datos se guarda como DATE
	public Date getBeginningDateBD(){
		
		//Año -1900 porque empieza en 1900, Mes-1 porque va de 0 a 11
		
		return new Date(Integer.parseInt(beginningDate.split("/")[2])-1900, Integer.parseInt(beginningDate.split("/")[1])-1, Integer.parseInt(beginningDate.split("/")[0]));
		
	}

	public void setBeginningDate(String beginningDate) {
		
		this.beginningDate = beginningDate;
		
	}

	
	public String getEndingDate(){
		
		return endingDate;
		
		
	}
	
	public Date getEndingDateBD(){
		
		//Año -1900 porque empieza en 1900, Mes-1 porque va de 0 a 11
		
		return new Date(Integer.parseInt(endingDate.split("/")[2])-1900, Integer.parseInt(endingDate.split("/")[1])-1, Integer.parseInt(endingDate.split("/")[0]));
		
	}

	public void setEndingDate(String endingDate) {
		
		this.endingDate = endingDate;
		
	}

	@Override
	public String toString() {
		
		return "idOffer = " + idOffer + ", nid = " + nid +", name = " + name + ", idSkill = " + idSkill + ", description = " + description + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate;
	
	}
	
}