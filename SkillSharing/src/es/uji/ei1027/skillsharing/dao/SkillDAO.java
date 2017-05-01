package es.uji.ei1027.skillsharing.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.skillsharing.model.Skill;

@Repository
public class SkillDAO {
	
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	private static final class SkillMapper implements RowMapper<Skill> {
		
		public Skill mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Skill skill = new Skill();
			
			skill.setIdSkill(rs.getString("idSkill"));
			skill.setName(rs.getString("name"));
			skill.setLevel(rs.getString("level"));
			skill.setDescription(rs.getString("description"));
			
			return skill;
			
		}
		
	}
	
	public List<Skill> getSkills() {
		
		return this.jdbcTemplate.query("select * from skill", new SkillMapper());
	
	}
	
	public Skill getSkill(Skill skill) {
	
		return this.jdbcTemplate.queryForObject("select * from skill where idSkill = ?", new Object[] {skill.getIdSkill()}, new SkillMapper());
	
	}
	
	public void updateSkill(Skill skill) {
	
		this.jdbcTemplate.update("update skill set idSkill = ?, name = ?, level = ?, description = ?", skill.getIdSkill(), skill.getName(), skill.getLevel(), skill.getDescription());
	
	}
	
	public void deleteSkill(Skill skill) {
	
		this.jdbcTemplate.update("delete from skill where idSkill = ?", skill.getIdSkill());
	
	}
	
	public void addSkill(Skill skill) {
	
		this.jdbcTemplate.update("insert into skill(idSkill, name, level, description) values(?, ?, ?, ?)", skill.getIdSkill(), skill.getName(), skill.getLevel(), skill.getDescription());
	
	}

}