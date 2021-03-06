package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

import bean.QuestBean;
import bean.QuestWriteBean;

public class QuestDao {
private JdbcTemplate jdbcTemplate;
	
	public QuestDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// QuestBean RowMapper
	private RowMapper<QuestBean> QuestRowMapper = new RowMapper<QuestBean>() {
		@Override
		public QuestBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			QuestBean quest = new QuestBean(
					rs.getInt("q_num"),
					rs.getString("q_title"),
					rs.getString("q_descript"),
					rs.getDate("q_startdate"),
					rs.getDate("q_enddate"),
					rs.getString("q_isprivate"),
					rs.getString("q_writer"));
			return quest;
		}
	};
	
		
	// 퀘스트 등록하기
	@Transactional
	public void regQuest(final QuestWriteBean quest) {
		String sql = "insert into quest (q_num, q_title, q_descript, q_startdate, "
				+ "q_enddate, q_isprivate, q_writer) "
				+ "values (qnum_seq.nextval, ?, ?, ?, ?, ?, ?) ";
		
		jdbcTemplate.update((Connection con) -> {
			PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, quest.getQ_title());
				pstmt.setString(2, quest.getQ_descript());
				pstmt.setDate(3, new java.sql.Date(quest.getQ_startdate().getTime()));
				pstmt.setDate(4,  new java.sql.Date(quest.getQ_enddate().getTime()));
				pstmt.setString(5, quest.getQ_isprivate());
				pstmt.setString(6, quest.getQ_writer());
				return pstmt;
		});
	}
	
	// 전체 퀘스트 보기(Letter에서 사용)
	public List<QuestBean> selectAllQ(String writer) {
		List<QuestBean> results = jdbcTemplate.query(
				"select * from (select * from quest order by q_enddate desc, q_num desc) "
				+ "where q_writer = ? " , QuestRowMapper, writer);
		return results;
	}
	
	// 공개 퀘스트 보기
	public List<QuestBean> selectOpenQ(String writer) {
		List<QuestBean> results = jdbcTemplate.query(
				"select * from (select * from quest order by q_num desc) "
				+ "where q_writer = ? and q_isprivate = 'Y' ", QuestRowMapper, writer);
		return results;
	}
	
	// 비공개 퀘스트 보기
	public List<QuestBean> selectQuestS(String writer) {
		List<QuestBean> results = jdbcTemplate.query(
				"select * from (select * from quest order by q_num desc) "
				+ "where q_writer = ? and q_isprivate = 'N' ", QuestRowMapper, writer);
		return results;
	}
	
	// 공개된 전체 퀘스트 보기(for all user)
	public List<QuestBean> selectQuestPublic() {
		List<QuestBean> results = jdbcTemplate.query(
				"select * from (select * from quest order by q_num desc) "
				+ "where q_isprivate = 'Y' ", QuestRowMapper);
		return results;
	}
	
	// l_questcate를 작성한 작성자 구하기
	public List<Map<String, Object>> getlqcateWriter(String title) {
		String sql = "select distinct q_writer from quest where q_isprivate = 'Y' and q_title = ? ";
		List<Map<String,Object>> results = jdbcTemplate.queryForList(sql, title);
		return results;
	}
	
				
	// 공개, 비공개 설정하기
	public void changePublic(int num, String isprivate) {
		jdbcTemplate.update(
				"update quest set q_isprivate = ? where q_num = ? ", isprivate, num);
	}	
	
	// 퀘스트 삭제하기
	public void deleteQ(String title, String writer) {
		jdbcTemplate.update(
				"delete from quest where q_title = ? and q_writer = ? ", title, writer);
	}
	
}
