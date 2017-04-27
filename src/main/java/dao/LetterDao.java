package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

import bean.LetterBean;
import bean.LetterWriteBean;
import xml.Data;

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
					rs.getString("l_regdate"),
					rs.getString("l_isquest"),
					rs.getString("l_isprivate"),
					rs.getString("l_questcate")
					);
			return letter;
		}
	};
	
	private RowMapper<LetterBean> RowMapper = new RowMapper<LetterBean>() {
		@Override
		public LetterBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			LetterBean letter = new LetterBean(rs.getString("l_questcate"));
			return letter;
		}
	};
	
	// DataRowMapper
	private RowMapper<Data> DataRowMapper = new RowMapper<Data>() {
		@Override
		public Data mapRow(ResultSet rs, int rowNum) throws SQLException {
			Data letter = new Data(
					rs.getInt("l_num"),
					rs.getString("l_writer"),
					rs.getString("l_content"),
					rs.getString("l_files"), 
					rs.getString("l_regdate"),
					rs.getString("l_isquest"),
					rs.getString("l_isprivate"),
					rs.getString("l_questcate")
					);
			return letter;
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
	public List<LetterBean> selectAll(String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter where l_writer = ? order by l_num desc ",
					LetterRowMapper, writer);
		return results;	
	}
	
	// 퀘스트 글만 보기
	public List<LetterBean> selectQuest(String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter "
				+ "where l_writer = ? and l_isquest = 'Y' order by l_num desc ", 
					LetterRowMapper, writer);
		return results;
	}
	
	// 일반글만 보기
	public List<LetterBean> selectNormal(String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter "
				+ "where l_writer = ? and l_isquest = 'N' order by l_num desc ", 
					LetterRowMapper, writer);
		return results;
	}	
	
	// 공개된 전체 글 보기
	public List<LetterBean> selectLetterPublic() {
		List<LetterBean> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter "
				+ "where l_isprivate = 'Y' order by l_num desc ", 
					LetterRowMapper);
		return results;
	}
	
	// 공개된 전체 글 보기
	public List<Data> selectDataPublic() {
		List<Data> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter "
				+ "where l_isprivate = 'Y' order by l_num desc ", 
					DataRowMapper);
		return results;
	}
	
	// 공개글 설정하기
	public void changePrivate(int num, String isprivate) {
		jdbcTemplate.update(
				"update letter set l_isprivate = ? where l_num = ? ", isprivate, num);		
	}
	
	// Select 박스 선택될 때마다 Q-List 가져오기
	public List<LetterBean> changeQList(String title, String writer) {
		List<LetterBean> results = jdbcTemplate.query(
				"select l_num, l_writer, l_content, l_files, to_char(l_regdate, 'YYYY-MM-DD HH24:MI:SS') as l_regdate, "
				+ "l_isquest, l_isprivate, l_questcate from letter, quest "
				+ "where letter.l_questcate = quest.q_title and letter.l_writer =? and letter.l_questcate = ? "
				+ "order by l_num desc ", 
						LetterRowMapper, writer, title);
		return results;
	}	
	
	// 퀘스트 기한 가져오기 (javascript로 글쓰는 단계에서 처리했기에 사용 안함)
	public String getLimit(String questcate) {
		String sql = "select to_char(q_enddate, 'YYYY-MM-DD') as q_enddate from quest where q_title = ? ";
		String limit = jdbcTemplate.queryForObject(sql, String.class, questcate);
		return limit;
	}

	// 게시글 삭제하기
	public void deleteL(int num, String writer) {
		jdbcTemplate.update(
				"delete from letter where l_num = ? and l_writer = ? ", num, writer);
	}
	
	// 가장 많이 작성된 퀘스트 글 갯수 구하기
	public int countHotQL(String questcate) {
		String sql = "select count(l_questcate) from letter where l_questcate = ? ";
		int count = jdbcTemplate.queryForObject(sql, Integer.class, questcate);
		return count;
	}
	
	// 퀘스트 관련 글에서 l_questcate (=q_title) 중복 없이 가져오기
	public List<Map<String,Object>> getlqcate() {
		String sql = "select distinct l_questcate from letter where l_isquest = 'Y' ";
		List<Map<String,Object>> results = jdbcTemplate.queryForList(sql);
		return results;
	}	
	
}
