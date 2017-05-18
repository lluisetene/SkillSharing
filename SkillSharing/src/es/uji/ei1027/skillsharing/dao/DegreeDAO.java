package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Degree;

@Repository
public class DegreeDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class DegreeMapper implements RowMapper<Degree> {

		@Override
		public Degree mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Degree degree = new Degree();
			
			degree.setIdDegree(rs.getString("iddegree"));
			degree.setName(rs.getString("name"));
			degree.setNid(rs.getString("nid"));
			
			return degree;
			
		}

	}
	
	public List<Degree> getDegrees() {
		
		return this.jdbcTemplate.query("select * from degree order by iddegree", new DegreeMapper());
		
	}
	
	public Degree getDegree(String idDegree) {
		
		return this.jdbcTemplate.queryForObject("select * from degree where iddegree = ?", new Object[] {idDegree}, new DegreeMapper());
	
	}
	
	public void updateDegree(Degree degree) {
		
		this.jdbcTemplate.update("update degree set name = ? , nid = ? where iddegree = ?", degree.getName(), degree.getNid(), degree.getIdDegree());
	
	}
	
	public void deleteDegree(String idDegree) {
		
		this.jdbcTemplate.update("delete from degree where iddegree = ? ", idDegree);
	
	}
	
	public void addDegree(Degree degree) {
		
		this.jdbcTemplate.update("insert into degree(iddegree, name, nid) values(?, ?, ?)", degree.getIdDegree(), degree.getName(), degree.getNid());
	
	}
	
}