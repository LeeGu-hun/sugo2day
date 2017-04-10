package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

import bean.QuestBean;
import quest.QuestCommand;

public class QuestDao {
	private JdbcTemplate jdbcTemplate;

	public QuestDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 중복 코드 처리
	private RowMapper<QuestBean> QuestRowMapper = new RowMapper<QuestBean>() {
		@Override
		public QuestBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			QuestBean quest = new QuestBean(
					rs.getInt("NUM"),
					rs.getString("NAME"),
					rs.getString("SUBJECT"),
					rs.getString("CONTENT"),
					rs.getString("PROB"),
					rs.getDate("STARTDATE"),
					rs.getDate("ENDDATE"),
					rs.getInt("DIFFICULTY"));
			return quest;
		}
	};
	
	
//			@Transactional
//			public void insert(final QuestCommand quest) {
//				jdbcTemplate.update((Connection con) -> {
//						PreparedStatement pstmt = con.prepareStatement(
//								"insert into QUEST (NUM, NAME,SUBJECT, CONTENT,  "
//								+ "PROB , STARTDATE , ENDDATE ) "
//								+ "values (QUEST_NUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ? ,?) ");
//						pstmt.setString(1, quest.getNAME());
//						pstmt.setString(2, quest.getSUBJECT());
//						pstmt.setInt(3, quest.getDIFFICULTY());
//						pstmt.setString(4, quest.getCONTENT());
//						pstmt.setString(5, quest.getPROB());
//						pstmt.setDate(6, new java.sql.Date(quest.getSTARTDATE().getTime()));
//						pstmt.setDate(7, new java.sql.Date(quest.getENDDATE().getTime()));
//						return pstmt;
//					});
//				
//			
//			}
			@Transactional
			public void insert(final QuestCommand quest) {
				jdbcTemplate.update((Connection con) -> {
						PreparedStatement pstmt = con.prepareStatement(
								"insert into QUEST (NUM, NAME,SUBJECT, CONTENT,  "
								+ "PROB , STARTDATE , ENDDATE, DIFFICULTY ) "
								+ "values (QUEST_NUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ");
						pstmt.setString(1, quest.getNAME());
						pstmt.setString(2, quest.getSUBJECT());
						pstmt.setString(3, quest.getCONTENT());
						pstmt.setString(4, quest.getPROB());
						pstmt.setDate(5, new java.sql.Date(quest.getSTARTDATE().getTime()));
						pstmt.setDate(6, new java.sql.Date(quest.getENDDATE().getTime()));
						pstmt.setInt(7, quest.getDIFFICULTY());
						return pstmt;
					});
				
			
			}
			public List<QuestBean> questAll(){
				List<QuestBean> quest = jdbcTemplate.
						query("SELECT * FROM QUEST ", QuestRowMapper);
				
				return quest;
			}
			
			
			
				
}
