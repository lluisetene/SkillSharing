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

import es.uji.ei1027.skillsharing.model.Student;

@Repository
public class StudentDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class StudentMapper implements RowMapper<Student> {

		@Override
		public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Student student = new Student();
			
			BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
			
			student.setNid(rs.getString("nid"));
			student.setName(rs.getString("name"));
			student.setUsername(rs.getString("username"));
			student.setPassword(/*passwordEncryptor.encryptPassword*/(rs.getString("password")));
			student.setMail(rs.getString("mail"));
			student.setCourse(rs.getInt("course"));
			student.setOfferHours(rs.getTime("offerHours"));
			student.setDemandHours(rs.getTime("demandHours"));
			student.setBanned(rs.getBoolean("banned"));
			
			return student;
		
		}
		
	}
	
	public List<Student> getStudents() {
		
		return this.jdbcTemplate.query("select * from student order by nid", new StudentMapper());
	
	}
	
	public Student getStudent(Student student) {
		
		return this.jdbcTemplate.queryForObject("select * from student where nid = ?", new Object[] {student.getNid()}, new StudentMapper());
	
	}
	
	public void updateStudent(Student student) {
	
		this.jdbcTemplate.update("update student set name = ?, username = ?, password = ?, mail = ?, course = ?, offerhours = ?, demandhours = ?, banned = ? where nid = ?", student.getName(), student.getUsername(), student.getPassword(), student.getMail(), student.getCourse(), student.getOfferHours(), student.getDemandHours(), student.getBanned(), student.getNid());
	
	}
	
	public void deleteStudent(Student student) {
	
		this.jdbcTemplate.update("delete from student where nid = ?", student.getNid());
	
	}
	
	public void addStudent(Student student) {
		
		this.jdbcTemplate.update("insert into student(nid, name, username, password, mail, course, offerhours, demandhours, banned) values(?, ?, ?, ?, ?, ?, ?, ?, ?)", student.getNid(), student.getName(), student.getUsername(), student.getPassword(), student.getMail(), student.getCourse(), student.getOfferHours(), student.getDemandHours(), student.getBanned());
	
	}
		
}