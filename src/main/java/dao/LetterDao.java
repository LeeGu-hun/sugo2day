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

import bean.LetterBean;
import bean.LetterWriteBean;

public class LetterDao {
	private JdbcTemplate jdbcTemplate;
	
	public LetterDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// 중복 코드 처리
	private RowMapper<LetterBean> LetterRowMapper = new RowMapper<LetterBean>() {
		@Override
		public LetterBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			LetterBean letter = new LetterBean(
					rs.getInt("num"),
					rs.getString("writer"),
					rs.getString("content"),
					rs.getString("files"),
					rs.getDate("regdate"),
					rs.getString("isquest"),
					rs.getString("isprivate"),
					rs.getDate("startdate"),
					rs.getDate("enddate"),
					rs.getString("questcate"));
			return letter;
		}
	};
	
	
	
	// 퀘스트 글 등록하기
	@Transactional
	public void insert(final LetterWriteBean letter) {
		System.out.println(letter.getIsquest() + " = insert 될 때 quest 값");
		System.out.println(letter.getIsprivate() + " = insert 될 때 private 값");
		
		String Qsql = "insert into letter (num, writer, content, files, regdate, "
				+ "isquest, isprivate, startdate, enddate, questcate) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, ?, ?, ?, ?, ? ) ";
		String Nsql = "insert into letter (num, writer, content, files, regdate, "
				+ "isquest, isprivate) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, ?, ?) ";
		String Nullsql = "insert into letter (num, writer, content, files, regdate, "
				+ "isquest, isprivate) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, '일반글', ?) ";
		
		
		if(letter.getIsquest() == null) {
			System.out.println("일반글 값 null 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nullsql);
					pstmt.setString(1, letter.getWriter());
					pstmt.setString(2, letter.getContent());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getIsprivate());
					return pstmt;
			});
			
		} else if (letter.getIsquest() != null && letter.getIsquest().equals("일반글")) {
			System.out.println("일반글 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nsql);
					pstmt.setString(1, letter.getWriter());
					pstmt.setString(2, letter.getContent());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getIsquest());
					pstmt.setString(5, letter.getIsprivate());
					return pstmt;
			});
			
		} else if(letter.getIsquest() != null && letter.getIsquest().equals("퀘스트글")) {
			System.out.println("퀘스트글 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Qsql);
					pstmt.setString(1, letter.getWriter());
					pstmt.setString(2, letter.getContent());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getIsquest());
					pstmt.setString(5, letter.getIsprivate());
					pstmt.setDate(6, new java.sql.Date(letter.getStartdate().getTime()));
					pstmt.setDate(7, new java.sql.Date(letter.getEnddate().getTime()));
					pstmt.setString(8, letter.getQuestcate());
					return pstmt;
			});
		} 
		
	
	}	
	
		
	// 전체 글 보기
	public List<LetterBean> selectAll(String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by num desc) where writer = ? " , LetterRowMapper, writer);
		return results;	
	}
	
	// 퀘스트 글만 보기
	public List<LetterBean> selectQuest(String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by num desc) "
						+ "where isquest = '퀘스트글' and writer = ? ", LetterRowMapper, writer);
		return results;
	}
	
	// 공개글 설정하기
	public void changePrivate(int num, String isprivate) {
		jdbcTemplate.update(
				"update letter set isprivate = ? where num = ? ", isprivate, num);		
	}
	
	// Select 박스 선택될 때마다 Qlist 가져오기
	public List<LetterBean> changeQList(String questcate, String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by num desc) "
						+ "where questcate = ? and writer = ? ", 
						LetterRowMapper, questcate, writer);
		return results;
	}
	

}
