package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import bean.QuestBean;
import quest.LetterCommand;

public class LetterDao {
	private JdbcTemplate jdbcTemplate;

	public LetterDao(DataSource dataSource) {
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
					rs.getString("WRITER"),
					rs.getString("SUBJECT"),
					rs.getString("CONTENT"),
					rs.getString("FILES"),
					rs.getDate("STARTDATE"),
					rs.getDate("ENDDATE"),
					rs.getInt("ISQUEST"),
					rs.getInt("ISPRIVATE")
					);
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
			public void insert(final LetterCommand quest) {
				jdbcTemplate.update((Connection con) -> {
						PreparedStatement pstmt = con.prepareStatement(
								"insert into QUEST (NUM, WRITER ,SUBJECT, CONTENT, FILES, "
								+ "  STARTDATE , ENDDATE , ISQUEST , ISPRIVATE) "
								+ "values (QUEST_NUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ");
						pstmt.setString(1, quest.getWRITER());
						pstmt.setString(2, quest.getSUBJECT());
						pstmt.setString(3, quest.getCONTENT());
						pstmt.setString(5, quest.getFILES());
						pstmt.setDate(6, new java.sql.Date(quest.getSTARTDATE().getTime()));
						pstmt.setDate(7, new java.sql.Date(quest.getENDDATE().getTime()));
						pstmt.setInt(8, quest.getISQUEST());
						pstmt.setInt(9, quest.getISPRIVATE());
						return pstmt;
					});
				
			
			}
			public List<QuestBean> questAll(){
				List<QuestBean> quest = jdbcTemplate.
						query("SELECT * FROM QUEST ", QuestRowMapper);
				
				return quest;
			}
			
			
			
				
}
