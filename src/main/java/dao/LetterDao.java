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

import bean.JoinBean;
import bean.LetterBean;
import bean.LetterWriteBean;
import bean.QuestBean;

public class LetterDao {
	private JdbcTemplate jdbcTemplate;
	
	public LetterDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// LetterRowMapper
	private RowMapper<LetterBean> LetterRowMapper = new RowMapper<LetterBean>() {
		@Override
		public LetterBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			LetterBean letter = new LetterBean(
					rs.getInt("l_num"),
					rs.getString("l_writer"),
					rs.getString("l_content"),
					rs.getString("l_files"), 
					rs.getDate("l_regdate"),
					rs.getString("l_isquest"),
					rs.getString("l_isprivate"),
					rs.getString("l_questcate")
					);
			return letter;
		}
	};
	
	// QuestRowMapper
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
					rs.getString("q_writer"),
					rs.getString("q_maincate"),
					rs.getString("q_subcate"));
			return quest;
		}
	};
	
	
	// JoinRowMapper
	private RowMapper<JoinBean> JoinRowMapper = new RowMapper<JoinBean>() {
		@Override
		public JoinBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			JoinBean join = new JoinBean(
					rs.getInt("l_num"),
					rs.getString("l_writer"),
					rs.getString("l_content"),
					rs.getString("l_files"), 
					rs.getDate("l_regdate"),
					rs.getString("l_isquest"),
					rs.getString("l_isprivate"),
					rs.getString("l_questcate"),
					rs.getInt("q_num"),
					rs.getString("q_title"),
					rs.getString("q_descript"),
					rs.getDate("q_startdate"),
					rs.getDate("q_enddate"),
					rs.getString("q_isprivate"),
					rs.getString("q_writer"),
					rs.getString("q_maincate"),
					rs.getString("q_subcate"));
			return join;
		}
	};
	
	// 퀘스트 글 등록하기
	@Transactional
	public void insert(final LetterWriteBean letter) {		
		String Qsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE, L_QUESTCATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, 'Y', ?, ?) ";
		String Nsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, 'N', ?) ";
		String Nullsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, 'N', ?) ";
		
		
		if(letter.getL_isquest() == null) {
			System.out.println("일반글 값 null 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nullsql);
					pstmt.setString(1, letter.getL_writer());
					pstmt.setString(2, letter.getL_content());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getL_isprivate());
					return pstmt;
			});
			
		} else if (letter.getL_isquest() != null && letter.getL_isquest().equals("N")) {
			System.out.println("일반글 루트");
			System.out.println(letter.getL_questcate() + " = questCate");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nsql);
					pstmt.setString(1, letter.getL_writer());
					pstmt.setString(2, letter.getL_content());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getL_isprivate());
					return pstmt;
			});
			
		} else if(letter.getL_isquest() != null && letter.getL_isquest().equals("Y") && letter.getL_questcate() != null) {
			System.out.println("퀘스트글 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Qsql);
					pstmt.setString(1, letter.getL_writer());
					pstmt.setString(2, letter.getL_content());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getL_isprivate());
					pstmt.setString(5, letter.getL_questcate());
					return pstmt;
			});
		} 
		
	
	}	
	
		
	// 전체 글 보기
	public List<JoinBean> selectAll(String writer) {
		List<JoinBean> results = jdbcTemplate.query(
				"select * from letter, quest where letter.l_writer = quest.q_writer and letter.l_writer = ? order by letter.l_num desc ",
					JoinRowMapper, writer);
		return results;	
	}
	
	// 퀘스트 글만 보기
	public List<JoinBean> selectQuest(String writer) {
		List<JoinBean> results = jdbcTemplate.query(
				"select * from letter lt, quest qt where lt.l_writer = qt.q_writer "
				+ "and lt.l_writer = ? and lt.l_isquest = 'Y' order by lt.l_num desc ", 
					JoinRowMapper, writer);
		return results;
	}
	
	// 일반글만 보기
	public List<JoinBean> selectNormal(String writer) {
		List<JoinBean> results = jdbcTemplate.query(
				"select * from letter lt, quest qt where lt.l_writer = qt.q_writer "
				+ "and lt.l_writer = ? and lt.l_isquest = 'N' order by lt.l_num desc ", 
					JoinRowMapper, writer);
		return results;
	}
	
	// 공개글 설정하기
	public void changePrivate(int num, String isprivate) {
		jdbcTemplate.update(
				"update letter set l_isprivate = ? where num = ? ", isprivate, num);		
	}
	
	// Select 박스 선택될 때마다 Q-List 가져오기
	public List<JoinBean> changeQList(Integer num, String title, String writer) {
		List<JoinBean> results = jdbcTemplate.query(
				"select * from letter lt, quest qt where lt.l_writer = qt.q_writer "
				+ "and lt.l_writer = ? and qt.q_title = ? and lt.l_num = ? "
				+ "order by lt.l_num desc ", 
						JoinRowMapper, writer, title, num);
		return results;
	}
	

}
