package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Demand;
import es.uji.ei1027.skillsharing.model.Offer;

@Repository
public class DemandDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	public DemandDAO(){
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl("jdbc:postgresql://db-aules.uji.es/ei102716ent");
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUsername("ei102716ent");
		dataSource.setPassword("ei102716ent");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
		
	}
	
	private static final class DemandMapper implements RowMapper<Demand> {

		@Override
		public Demand mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Demand demand = new Demand();
			
			demand.setIdDemand(rs.getString("iddemand"));
			demand.setNid(rs.getString("nid"));
			demand.setName(rs.getString("name"));
			demand.setIdSkill(rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6));
			demand.setDescription(rs.getString("description"));
			demand.setBeginningDate(rs.getDate("beginningdate"));
			demand.setEndingDate(rs.getDate("endingdate"));
		
			return demand;
		
		}
		
	}
	
	public List<Demand> getDemands() {
		
		return this.jdbcTemplate.query("SELECT * from demand WHERE endingdate >= CURRENT_DATE order by iddemand DESC;", new DemandMapper());
	
	}
	
	public Demand getDemand(String idDemand) {
	
		return this.jdbcTemplate.queryForObject("select * from demand where idDemand = ?", new Object[] {idDemand}, new DemandMapper());
	
	}
	
	public void updateDemand(Demand demand) {
	
		this.jdbcTemplate.update("update demand set nid = ?, name = ?, idskill = ?, description = ?, beginningdate = ?, endingdate = ? where iddemand = ?", demand.getNid(), demand.getName(), demand.getIdSkill(), demand.getDescription(), demand.getBeginningDate(), demand.getEndingDate(), demand.getIdDemand());
	
	}
	
	public void deleteDemand(String idDemand) {
	
		this.jdbcTemplate.update("delete from demand where idDemand = ?", idDemand);
	
	}
	
	public void addDemand(Demand demand) {
	
		this.jdbcTemplate.update("insert into demand(iddemand, nid, name, idskill, description, beginningdate, endingdate) values(?, ?, ?, ?, ?, ?, ?)", demand.getIdDemand(), demand.getNid(), demand.getName(), demand.getIdSkill(), demand.getDescription(), demand.getBeginningDate(), demand.getEndingDate());
	
	}
	
	public List<Demand> getDemandsWithNameSkill() {
		
		return this.jdbcTemplate.query("select dem.iddemand, dem.nid, dem.name,skill.idSkill, skill.name, skill.level, dem.description, dem.beginningdate, dem.endingdate from demand AS dem JOIN skill ON dem.idskill = skill.idskill WHERE endingdate >= CURRENT_DATE order by iddemand DESC;", new DemandMapper());
	
	}
	
	public List<Demand> getDemands2(String idSkill) {
		
		return this.jdbcTemplate.query("select dem.iddemand, dem.nid, dem.name,skill.idSkill, skill.name, skill.level, dem.description, dem.beginningdate, dem.endingdate from demand AS dem JOIN skill ON dem.idskill = skill.idskill WHERE skill.idSkill = ? AND endingdate >= CURRENT_DATE order by iddemand DESC;", new Object[] {idSkill}, new DemandMapper());
	
	}
	
}