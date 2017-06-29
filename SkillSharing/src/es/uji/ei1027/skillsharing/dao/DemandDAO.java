package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Demand;

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
			
			demand.setIdDemand(rs.getInt("iddemand"));
			demand.setNid(rs.getString("nid"));
			demand.setName(rs.getString("name"));
			demand.setIdSkill(rs.getInt("idskill"));
			demand.setDescription(rs.getString("description"));
			
			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
			
			demand.setBeginningDate(formateador.format(rs.getDate("beginningdate")));
			demand.setEndingDate(formateador.format(rs.getDate("endingdate")));
		
			return demand;
		
		}
		
	}
	
	public List<Demand> getDemands() {
		
		return this.jdbcTemplate.query("SELECT * from demand WHERE endingdate >= CURRENT_DATE order by idDemand DESC;", new DemandMapper());
	
	}
	
	public List<Demand> getDemandsWithoutOwner(String nid){
		
		return this.jdbcTemplate.query("SELECT * from demand WHERE endingdate >= CURRENT_DATE AND nid != ? order by idDemand DESC;", new Object[]{nid}, new DemandMapper());
		
	}
	
	public List<Demand> getDemandsWithoutOwner(String name, String nid){
		
		return this.jdbcTemplate.query("SELECT dem.iddemand, dem.nid, dem.name, dem.idskill, dem.description, dem.beginningDate, dem.endingDate FROM demand AS dem JOIN Skill ON dem.idskill = skill.idskill WHERE skill.name = ? AND endingdate >= CURRENT_DATE AND dem.nid != ?;",new Object[]{name, nid}, new DemandMapper());
		
	}
	
	public List<Demand> getDemands(String name) {
		
		return this.jdbcTemplate.query("SELECT dem.iddemand, dem.nid, dem.name, dem.idskill, dem.description, dem.beginningDate, dem.endingDate FROM demand AS dem JOIN Skill ON dem.idskill = skill.idskill WHERE skill.name = ? AND endingdate >= CURRENT_DATE;",new Object[]{name}, new DemandMapper());
	
	}
	
	public Demand getDemand(int idDemand) {
	
		return this.jdbcTemplate.queryForObject("select * from demand where idDemand = ?", new Object[] {idDemand}, new DemandMapper());
	
	}
	
	public void updateDemand(Demand demand) {
	
		this.jdbcTemplate.update("update demand set nid = ?, name = ?, idskill = ?, description = ?, beginningdate = ?, endingdate = ? where iddemand = ?", demand.getNid(), demand.getName(), demand.getIdSkill(), demand.getDescription(), demand.getBeginningDateBD(), demand.getEndingDateBD(), demand.getIdDemand());
	
	}
	
	public void deleteDemand(int idDemand) {
	
		this.jdbcTemplate.update("delete from demand where idDemand = ?", idDemand);
	
	}
	
	public void addDemand(Demand demand) {
	
		this.jdbcTemplate.update("insert into demand(iddemand, nid, name, idskill, description, beginningdate, endingdate) values(?, ?, ?, ?, ?, ?, ?)", demand.getIdDemand(), demand.getNid(), demand.getName(), demand.getIdSkill(), demand.getDescription(), demand.getBeginningDateBD(), demand.getEndingDateBD());
	
	}
	
}