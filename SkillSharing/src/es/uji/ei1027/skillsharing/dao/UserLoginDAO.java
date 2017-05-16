package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.UserLogin;

@Repository
public class UserLoginDAO  {

private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class UserLoginMapper implements RowMapper<UserLogin> {

		@Override
		public UserLogin mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			UserLogin user = new UserLogin();
			
			//BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
			
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			//user.setPassword(passwordEncryptor.encryptPassword(rs.getString("password")));
			user.setName(rs.getString("name"));
			user.setMail(rs.getString("mail"));
			
			return user;
		
		}
		
	}
	
	public List<UserLogin> getUsers() {
		
		return this.jdbcTemplate.query("select * from admin", new UserLoginMapper());
	
	}
	
	public UserLogin getUser(String user) {
		
		return this.jdbcTemplate.queryForObject("select * from admin where username = ?", new Object[] {user}, new UserLoginMapper());
	
	}
	
	public void updateUser(UserLogin user) {
	
		this.jdbcTemplate.update("update admin set name = ?, mail = ?, password = ?, where username = ?", user.getName(), user.getMail(), user.getPassword(), user.getUsername());
	
	}
	
	public void deleteUser(String user) {
	
		this.jdbcTemplate.update("delete from admin where username = ?", user);
	
	}
	
	public void addUser(UserLogin user) {
		
		this.jdbcTemplate.update("insert into admin(name, mail, username, password) values(?, ?, ?, ?)", user.getName(), user.getMail(), user.getUsername(), user.getPassword());
	
	}
	
}
