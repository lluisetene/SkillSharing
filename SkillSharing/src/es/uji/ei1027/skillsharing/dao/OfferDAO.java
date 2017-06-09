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

import es.uji.ei1027.skillsharing.model.Offer;

@Repository
public class OfferDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
	
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	public OfferDAO(){
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl("jdbc:postgresql://db-aules.uji.es/ei102716ent");
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUsername("ei102716ent");
		dataSource.setPassword("ei102716ent");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class OfferMapper implements RowMapper<Offer> {

		@Override
		public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Offer offer = new Offer();
			
			offer.setIdOffer(rs.getString("idoffer"));
			offer.setNid(rs.getString("nid"));
			offer.setName(rs.getString("name"));
			offer.setIdSkill(rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6));
			offer.setDescription(rs.getString("description"));
			offer.setBeginningDate(rs.getDate("beginningdate"));
			offer.setEndingDate(rs.getDate("endingdate"));
			
			return offer;
			
		}
		
	}
	
	public List<Offer> getOffers() {
										
		return this.jdbcTemplate.query("SELECT * from offer WHERE endingdate >= CURRENT_DATE order by idoffer DESC;", new OfferMapper());
	
	}
	
	public Offer getOffer(String idOffer) {
	
		return this.jdbcTemplate.queryForObject("select * from offer where idOffer = ?", new Object[] {idOffer}, new OfferMapper());
	
	}
	
	public void updateOffer(Offer offer) {

		this.jdbcTemplate.update("update offer set nid = ?, name = ?, idskill = ?, description = ?, beginningdate = ?, endingdate = ? where idoffer = ?", offer.getNid(), offer.getName(), offer.getIdSkill(), offer.getDescription(), offer.getBeginningDate(), offer.getEndingDate(), offer.getIdOffer());
	
	}
	
	public void deleteOffer(String idOffer) {
	
		this.jdbcTemplate.update("delete from offer where idOffer = ?", idOffer);
	
	}
	
	public void addOffer(Offer offer) {
	
		this.jdbcTemplate.update("insert into offer(idoffer, nid, name, idskill, description, beginningdate, endingdate) values(?, ?, ?, ?, ?, ?, ?)", offer.getIdOffer(), offer.getNid(), offer.getName(), offer.getIdSkill(), offer.getDescription(), offer.getBeginningDate(), offer.getEndingDate());
	
	}
	
	public List<Offer> getOffersWithNameSkill() {
		
		return this.jdbcTemplate.query("select off.idoffer, off.nid, off.name,skill.idSkill, skill.name, skill.level, off.description, off.beginningdate, off.endingdate from offer AS off JOIN skill ON off.idskill = skill.idskill WHERE endingdate >= CURRENT_DATE order by idoffer DESC;", new OfferMapper());
	
	}
	
	public List<Offer> getOffers2(String idSkill) {
		
		return this.jdbcTemplate.query("select off.idoffer, off.nid, off.name,skill.idSkill, skill.name, skill.level, off.description, off.beginningdate, off.endingdate from offer AS off JOIN skill ON off.idskill = skill.idskill WHERE skill.idSkill = ? AND endingdate >= CURRENT_DATE order by idoffer DESC;", new Object[] {idSkill}, new OfferMapper());
	
	}

}