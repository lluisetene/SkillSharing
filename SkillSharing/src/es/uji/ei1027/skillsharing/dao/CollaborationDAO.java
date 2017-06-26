package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
			
			collaboration.setIdCollaboration(rs.getInt("idcollaboration"));
			collaboration.setIdOffer(rs.getInt("idoffer"));
			collaboration.setIdDemand(rs.getInt("iddemand"));
			
			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
			
			collaboration.setBeginningDate(formateador.format(rs.getDate("beginningdate")));
			collaboration.setEndingDate(formateador.format(rs.getDate("endingdate")));
			collaboration.setHours(rs.getString("hours"));
			collaboration.setRate(rs.getFloat("rate"));
			
			return collaboration;
		
		}
		
	}
	
	public List<Collaboration> getCollaborations() {
		
		return this.jdbcTemplate.query(" SELECT * FROM COLLABORATION WHERE EXTRACT(MONTH FROM endingdate) >= EXTRACT(MONTH FROM CURRENT_DATE) order by idCollaboration;", new CollaborationMapper());
	
	}
	
	public List<Collaboration> getCollaborationsDistinctRate() {
		
		return this.jdbcTemplate.query(" SELECT distinct on (rate) idcollaboration, idoffer, iddemand, beginningdate, endingdate, hours, rate FROM COLLABORATION WHERE EXTRACT(MONTH FROM endingdate) >= EXTRACT(MONTH FROM CURRENT_DATE) AND rate != '0.0' order by rate, idcollaboration;", new CollaborationMapper());
	
	}
	
	public Collaboration getCollaboration(int idCollaboration) {
		
		return this.jdbcTemplate.queryForObject("select * from collaboration where idcollaboration = ?", new Object[] {idCollaboration}, new CollaborationMapper());
	
	}
	
	public void updateCollaboration(Collaboration collaboration) {
		
		this.jdbcTemplate.update("update collaboration set idoffer = ?, iddemand = ?, beginningdate = ?, endingdate = ?, hours = ?, rate = ? where idcollaboration = ?", collaboration.getIdOffer(), collaboration.getIdDemand(), collaboration.getBeginningDateBD(), collaboration.getEndingDateBD(), collaboration.getHours(), collaboration.getRate(), collaboration.getIdCollaboration());
	
	}
	
	public void deleteCollaboration(int idCollaboration) {
	
		this.jdbcTemplate.update("delete from collaboration where idcollaboration = ?", idCollaboration);
	
	}
	
	public void addCollaboration(Collaboration collaboration) {
	
		this.jdbcTemplate.update("insert into collaboration(idcollaboration, idoffer, iddemand, beginningdate, endingdate, hours, rate) values(?, ?, ?, ?, ?, ?, ?)", collaboration.getIdCollaboration(), collaboration.getIdOffer(), collaboration.getIdDemand(), collaboration.getBeginningDateBD(), collaboration.getEndingDateBD(), collaboration.getHours(), collaboration.getRate());
	
	}
	
	public List<Collaboration> getCollaborations(float rate) {
		
		return this.jdbcTemplate.query("select * from collaboration WHERE EXTRACT(MONTH FROM endingdate) >= EXTRACT(MONTH FROM CURRENT_DATE) and rate = ?", new Object[] {rate}, new CollaborationMapper());
	
	}
	
		
}