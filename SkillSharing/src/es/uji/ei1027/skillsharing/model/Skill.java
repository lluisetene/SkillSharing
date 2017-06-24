package es.uji.ei1027.skillsharing.model;

public class Skill {
	
	private int idSkill;
	private String name;
	private String level;
	private String description;

	public int getIdSkill() {
		
		return idSkill;
		
	}

	public void setIdSkill(int idSkill) {
		
		this.idSkill = idSkill;
		
	}

	public String getName() {
		
		return name;
		
	}

	public void setName(String name) {
		
		this.name = name;
		
	}

	public String getLevel() {
		
		return level;
		
	}

	public void setLevel(String level) {
		
		this.level = level;
		
	}

	public String getDescription() {
		
		return description;
		
	}

	public void setDescription(String description) {
		
		this.description = description;
		
	}
	
	@Override
	public String toString() {
		
		return "idSkill = " + idSkill + ", name = " + name +", level = " + level + ", description = " + description;
	
	}

}