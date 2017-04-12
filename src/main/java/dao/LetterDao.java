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
					rs.getString("subject"),
					rs.getString("content"),
					rs.getString("files"),
					rs.getDate("regdate"),
					rs.getString("isquest"),
					rs.getString("isprivate"),
					rs.getDate("startdate"),
					rs.getDate("enddate"));
			return letter;
		}
	};
	
	
	
	// 퀘스트 글 등록하기
	@Transactional
	public void insert(final LetterWriteBean letter) {
		System.out.println(letter.getIsquest() + " = insert 될 때 quest 값");
		System.out.println(letter.getIsprivate() + " = insert 될 때 private 값");
		
		String Qsql = "insert into letter (num, writer, subject, content, files, regdate, "
				+ "isquest, isprivate, startdate, enddate) "
				+ "values (lnum_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, ? )";
		String Nsql = "insert into letter (num, writer, subject, content, files, regdate, "
				+ "isquest, isprivate) "
				+ "values (lnum_seq.nextval, ?, ?, ?, ?, sysdate, ?, ? )";
		
		if(letter.getIsquest() == "일반글") {
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Qsql);
					pstmt.setString(1, letter.getWriter());
					pstmt.setString(2, letter.getSubject());
					pstmt.setString(3, letter.getContent());
					pstmt.setString(4, letter.getFileName());
					pstmt.setString(5, letter.getIsquest());
					pstmt.setString(6, letter.getIsprivate());
					pstmt.setDate(7, new java.sql.Date(letter.getStartdate().getTime()));
					pstmt.setDate(8, new java.sql.Date(letter.getEnddate().getTime()));
					return pstmt;
			});
		}
		
		if (letter.getIsquest() == "퀘스트글") {
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nsql);
					pstmt.setString(1, letter.getWriter());
					pstmt.setString(2, letter.getSubject());
					pstmt.setString(3, letter.getContent());
					pstmt.setString(4, letter.getFileName());
					pstmt.setString(5, letter.getIsquest());
					pstmt.setString(6, letter.getIsprivate());
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
	public List<LetterBean> selectQuest(LetterBean letter) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by num desc) "
						+ "where isquest = ? and writer = ? ", LetterRowMapper, letter.getIsquest(), letter.getWriter());
		return results;
	}
	
	
	

}
