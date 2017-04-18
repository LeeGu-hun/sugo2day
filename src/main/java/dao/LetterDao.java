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
import bean.LetterBean;

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
					rs.getInt("L_NUM"), rs.getString("L_WRITER"), 
					rs.getString("L_CONTENT"), rs.getString("L_FILES"), 
					rs.getDate("L_REGDATE"), rs.getString("l_ISQUEST"),
					rs.getString("l_ISPRIVATE"),rs.getString("L_QUESTCATE")
					);
			return letter;
		}
	};
	
	
	
	// 퀘스트 글 등록하기
	@Transactional
	public void insert(final LetterWriteBean letter) {
		System.out.println(letter.getL_ISQUEST() + " = insert 될 때 quest 값");
		System.out.println(letter.getL_ISPRIVATE() + " = insert 될 때 private 값");
		
		String Qsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE, L_QUESTCATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, ?, ?, ?, ?, ? ) ";
		String Nsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, ?, ?) ";
		String Nullsql = "insert into letter (L_NUM, L_WRITER, L_CONTENT, L_FILES, L_REGDATE, "
				+ "L_ISQUEST, L_ISPRIVATE) "
				+ "values (lnum_seq.nextval, ?, ?, ?, sysdate, '일반글', ?) ";
		
		
		if(letter.getL_ISQUEST() == null) {
			System.out.println("일반글 값 null 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nullsql);
					pstmt.setString(1, letter.getL_WRITER());
					pstmt.setString(2, letter.getL_CONTENT());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getL_ISQUEST());
					pstmt.setString(5, letter.getL_ISPRIVATE());
					
					return pstmt;
			});
			
		} else if (letter.getL_ISQUEST() != null && letter.getL_ISQUEST().equals("일반글")) {
			System.out.println("일반글 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Nsql);
					pstmt.setString(1, letter.getL_WRITER());
					pstmt.setString(2, letter.getL_CONTENT());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(4, letter.getL_ISQUEST());
					pstmt.setString(4, letter.getL_ISPRIVATE());
					return pstmt;
			});
			
		} else if(letter.getL_ISQUEST() != null && letter.getL_ISQUEST().equals("퀘스트글")) {
			System.out.println("퀘스트글 루트");
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(Qsql);
					pstmt.setString(1, letter.getL_WRITER());
					pstmt.setString(2, letter.getL_CONTENT());
					pstmt.setString(3, letter.getFileName());
					pstmt.setString(5, letter.getL_ISQUEST());
					pstmt.setString(6, letter.getL_QUESTCATE());
					return pstmt;
			});
		} 
		
	
	}	
	
		
	// 전체 글 보기
	public List<LetterBean> selectAll(String L_WRITER) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by L_NUM desc) where L_WRITER = ? " , LetterRowMapper, L_WRITER);
		return results;	
	}
	
	// 퀘스트 글만 보기
	public List<LetterBean> selectQuest(String L_WRITER) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by L_NUM desc) "
						+ "where L_ISQUEST = '퀘스트글' and L_WRITER = ? ", LetterRowMapper, L_WRITER);
		return results;
	}
	
	// 일반글만 보기
	public List<LetterBean> selectNormal(String L_WRITER){
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by L_NUM desc)"
						+ "where L_ISQUEST = '일반글' and L_WRITER = ? ", LetterRowMapper, L_WRITER);
		return results;			
	}
	
	
	// 공개글 설정하기
	public void changePrivate(int L_NUM, String L_ISPRIVATE) {
		jdbcTemplate.update(
				"update letter set L_ISPRIVATE = ? where L_NUM = ? ", L_ISPRIVATE, L_NUM);		
	}
	
	// Select 박스 선택될 때마다 Qlist 가져오기
	public List<LetterBean> changeQList(String L_QUESTCATE, String L_WRITER) {
		List<LetterBean> results = jdbcTemplate.query(
				"select * from (select * from letter order by L_NUM desc) "
						+ "where L_QUESTCATE = ? and L_WRITER = ? ", 
						LetterRowMapper, L_QUESTCATE, L_WRITER);
		return results;
	}
	

}
