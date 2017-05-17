package es.uji.ei1027.skillsharing.model;

public class Admin {
	
	public String username;
	public String password;
	public String name;
	public String mail;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username.toLowerCase();
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
