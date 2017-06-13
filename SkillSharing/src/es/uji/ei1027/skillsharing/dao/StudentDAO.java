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

import es.uji.ei1027.skillsharing.model.Collaboration;
import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;
import es.uji.ei1027.skillsharing.model.Statistics;
import es.uji.ei1027.skillsharing.model.Student;

@Repository
public class StudentDAO {

	private JdbcTemplate jdbcTemplate;
	private BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
	private Statistics estadisticas = new Statistics();
	
	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	public StudentDAO(){
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl("jdbc:postgresql://db-aules.uji.es/ei102716ent");
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUsername("ei102716ent");
		dataSource.setPassword("ei102716ent");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class StudentMapper implements RowMapper<Student> {

		@Override
		public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Student student = new Student();
			
			student.setNid(rs.getString("nid"));
			student.setName(rs.getString("name"));
			student.setUsername(rs.getString("username"));
			student.setPassword(rs.getString("password"));
			student.setMail(rs.getString("mail"));
			student.setCourse(rs.getInt("course"));
			student.setOfferHours(rs.getString("offerHours"));
			student.setDemandHours(rs.getString("demandHours"));
			student.setBanned(rs.getBoolean("banned"));
			
			return student;
		
		}
		
	}
	
	public List<Student> getStudents() {
		
		return this.jdbcTemplate.query("select * from student order by nid ASC;", new StudentMapper());
	
	}
	
	public Student getStudent(String nid) {
		
		return this.jdbcTemplate.queryForObject("select * from student where nid = ?", new Object[] {nid}, new StudentMapper());
	
	}
	
	public void updateStudent(Student student) {
	
		
		this.jdbcTemplate.update("update student set name = ?, username = ?, password = ?, mail = ?, course = ?, offerhours = ?, demandhours = ?, banned = ? where nid = ?", student.getName(), student.getUsername(), student.getPassword(), student.getMail(), student.getCourse(), student.getOfferHours(), student.getDemandHours(), student.getBanned(), student.getNid());
	
	}

	public void deleteStudent(String nid) {
	
		this.jdbcTemplate.update("delete from student where nid = ?", nid);
	
	}
	
	public void addStudent(Student student) {
		
		this.jdbcTemplate.update("insert into student(nid, name, username, password, mail, course, offerhours, demandhours, banned) values(?, ?, ?, ?, ?, ?, ?, ?, ?)", student.getNid(), student.getName(), student.getUsername(), passwordEncryptor.encryptPassword(student.getPassword()), student.getMail(), student.getCourse(), student.getOfferHours(), student.getDemandHours(), student.getBanned());
	
	}
	
	public Statistics getEstadisticas() {
		
		return estadisticas;
		
	}
	
	public void setDatos(List<Offer> ofertas, List<Demand> demandas, List<Collaboration> colaboraciones) {
		estadisticas.setDatos(ofertas, demandas, colaboraciones);
	}
	
		
}