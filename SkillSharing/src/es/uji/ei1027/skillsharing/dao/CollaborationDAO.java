package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Collaboration;

@Repository
public class CollaborationDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class CollaborationMapper implements RowMapper<Collaboration> {

		@Override
		public Collaboration mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Collaboration collaboration = new Collaboration();
			
			collaboration.setIdCollaboration(rs.getString("idcollaboration"));
			collaboration.setIdOffer(rs.getString("idoffer"));
			collaboration.setIdDemand(rs.getString("iddemand"));
			collaboration.setBeginningDate(rs.getDate("beginningDate"));
			collaboration.setEndingDate(rs.getDate("endingDate"));
			collaboration.setHours(rs.getTime("hours"));
			collaboration.setRate(rs.getFloat("rate"));
			
			return collaboration;
		
		}
		
	}
	
	public List<Collaboration> getCollaborations() {
		
		return this.jdbcTemplate.query("select * from collaboration", new CollaborationMapper());
	
	}
	
	public Collaboration getCollaboration(Collaboration collaboration) {
		
		return this.jdbcTemplate.queryForObject("select * from collaboration where idcollaboration = ?", new Object[] {collaboration.getIdCollaboration()}, new CollaborationMapper());
	
	}
	
	public void updateCollaboration(Collaboration collaboration) {
		
		this.jdbcTemplate.update("update collaboration set idoffer = ?, iddemand = ?, beginningdate = ?, endingdate = ?, hours = ?, rate = ? where idcollaboration = ?", collaboration.getIdOffer(), collaboration.getIdDemand(), collaboration.getBeginningDate(), collaboration.getEndingDate(), collaboration.getHours(), collaboration.getRate(), collaboration.getIdCollaboration());
	
	}
	
	public void deleteCollaboration(Collaboration collaboration) {
	
		this.jdbcTemplate.update("delete from collaboration where idcollaboration = ?", collaboration.getIdCollaboration());
	
	}
	
	public void addCollaboration(Collaboration collaboration) {
	
		this.jdbcTemplate.update("insert into collaboration(idcollaboration, idoffer, iddemand, beginningdate, endingdate, hours, rate) values(?, ?, ?, ?, ?, ?, ?)", collaboration.getIdCollaboration(), collaboration.getIdOffer(), collaboration.getIdDemand(), collaboration.getBeginningDate(), collaboration.getEndingDate(), collaboration.getHours(), collaboration.getRate());
	
	}
		
}