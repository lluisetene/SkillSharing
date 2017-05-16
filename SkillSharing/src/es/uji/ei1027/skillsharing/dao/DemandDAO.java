package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Demand;

@Repository
public class DemandDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class DemandMapper implements RowMapper<Demand> {

		@Override
		public Demand mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Demand demand = new Demand();
			
			demand.setIdDemand(rs.getString("iddemand"));
			demand.setNid(rs.getString("nid"));
			demand.setName(rs.getString("name"));
			demand.setIdSkill(rs.getString("idskill"));
			demand.setDescription(rs.getString("description"));
			demand.setBeginningDate(rs.getDate("beginningdate"));
			demand.setEndingDate(rs.getDate("endingdate"));
		
			return demand;
		
		}
		
	}
	
	public List<Demand> getDemands() {
		
		return this.jdbcTemplate.query("select * from demand", new DemandMapper());
	
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
	
}