package es.uji.ei1027.skillsharing.model;

public class Degree {

	private int idDegree;
	private String name;
	private String nid;
	
	public int getIdDegree() {
		
		return idDegree;
		
	}

	public void setIdDegree(int idDegree) {
		
		this.idDegree = idDegree;
		
	}

	public String getName() {
		
		return name;
		
	}

	public void setName(String name) {
		
		this.name = name;
		
	}

	public String getNid() {
		
		return nid;
		
	}

	public void setNid(String nid) {
		
		this.nid = nid.toUpperCase(); //La letra del DNI se convertira a mayusculas para coincidir con la BD.
		
	}


	public String toString() {
		
		return "Degree [idDegree = " + idDegree + ", name = " + name + ", nid = " + nid + "]";
	
	}
	
}