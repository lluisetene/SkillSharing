package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Admin;

@Repository
public class AdminDAO  {

	private JdbcTemplate jdbcTemplate;
	private BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	public AdminDAO(){
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl("jdbc:postgresql://db-aules.uji.es/ei102716ent");
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUsername("ei102716ent");
		dataSource.setPassword("ei102716ent");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class AdminMapper implements RowMapper<Admin> {

		@Override
		public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Admin admin = new Admin();
			
			admin.setUsername(rs.getString("username"));
			admin.setPassword(rs.getString("password"));
			admin.setName(rs.getString("name"));
			admin.setMail(rs.getString("mail"));
			
			return admin;
		
		}
		
	}
	
	public List<Admin> getAdmins() {
		
		return this.jdbcTemplate.query("select * from admin order by username", new AdminMapper());
	
	}
	
	public Admin getAdmin(String admin) {
		
		return this.jdbcTemplate.queryForObject("select * from admin where username = ?", new Object[] {admin}, new AdminMapper());
	
	}
	
	public void updateAdmin(Admin admin) {
	
		this.jdbcTemplate.update("update admin set name = ?, mail = ?, password = ? where username = ?", admin.getName(), admin.getMail(), passwordEncryptor.encryptPassword(admin.getPassword()), admin.getUsername());
	
	}
	
	public void deleteAdmin(String admin) {
	
		this.jdbcTemplate.update("delete from admin where username = ?", admin);
	
	}
	
	public void addAdmin(Admin admin) {
		
		this.jdbcTemplate.update("insert into admin(name, mail, username, password) values(?, ?, ?, ?)", admin.getName(), admin.getMail(), admin.getUsername(), passwordEncryptor.encryptPassword(admin.getPassword()));
	
	}
	
}
