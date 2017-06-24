package es.uji.ei1027.skillsharing.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Offer {

	private int idOffer;
	private String nid;
	private String name;
	private int idSkill;
	private String description;
	private Date beginningDate;
	private Date endingDate;
	
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
		
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
		
		return formateador.format(beginningDate);
		
	}
	//Es necesario porque en la base de datos se guarda como DATE
	public Date getBeginningDateBD(){
		
		return beginningDate;
		
	}

	public void setBeginningDate(Date beginningDate) {
		
		this.beginningDate = beginningDate;
		
	}

	
	public String getEndingDate(){
		
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
		
		return formateador.format(endingDate);
		
	}
	
	public Date getEndingDateBD(){
		
		return endingDate;
		
	}

	public void setEndingDate(Date endingDate) {
		
		this.endingDate = endingDate;
		
	}

	@Override
	public String toString() {
		
		return "idOffer = " + idOffer + ", nid = " + nid +", name = " + name + ", idSkill = " + idSkill + ", description = " + description + ", beginningDate = " + beginningDate + ", endingDate = " + endingDate;
	
	}
	
}