package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Offer;

@Repository
public class OfferDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class OfferMapper implements RowMapper<Offer> {

		@Override
		public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Offer offer = new Offer();
			
			offer.setIdOffer(rs.getString("idoffer"));
			offer.setNid(rs.getString("nid"));
			offer.setName(rs.getString("name"));
			offer.setIdSkill(rs.getString("idskill"));
			offer.setDescription(rs.getString("description"));
			offer.setBeginningDate(rs.getDate("beginningdate"));
			offer.setEndingDate(rs.getDate("endingdate"));
			
			return offer;
			
		}
		
	}
	
	public List<Offer> getOffers() {
		
		return this.jdbcTemplate.query("select * from offer", new OfferMapper());
	
	}
	
	public Offer getOffer(Offer offer) {
	
		return this.jdbcTemplate.queryForObject("select * from offer where idOffer = ?", new Object[] {offer.getIdOffer()}, new OfferMapper());
	
	}
	
	public void updateOffer(Offer offer) {

		this.jdbcTemplate.update("update offer set nid = ?, name = ?, idskill = ?, description = ?, beginningdate = ?, endingdate = ? where idoffer = ?", offer.getNid(), offer.getName(), offer.getIdSkill(), offer.getDescription(), offer.getBeginningDate(), offer.getEndingDate(), offer.getIdOffer());
	
	}
	
	public void deleteOffer(Offer offer) {
	
		this.jdbcTemplate.update("delete from offer where idOffer = ?", offer.getIdOffer());
	
	}
	
	public void addOffer(Offer offer) {
	
		this.jdbcTemplate.update("insert into offer(idoffer, nid, name, idskill, description, beginningdate, endingdate) values(?, ?, ?, ?, ?, ?, ?)", offer.getIdOffer(), offer.getNid(), offer.getName(), offer.getIdSkill(), offer.getDescription(), offer.getBeginningDate(), offer.getEndingDate());
	
	}
	
	public Offer getOffer(String idOffer) {
		
		return this.jdbcTemplate.queryForObject("select * from offer where idOffer = ?", new Object[] {idOffer}, new OfferMapper());
	
	}

}