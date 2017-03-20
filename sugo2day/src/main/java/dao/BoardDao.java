package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import bean.BoardBean;
import board.BoardCommand;

public class BoardDao {
	private JdbcTemplate jdbcTemplate;

	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 중복 코드 처리
	private RowMapper<BoardBean> boardRowMapper = new RowMapper<BoardBean>() {
		@Override
		public BoardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardBean board = new BoardBean(
					rs.getInt("num"),
					rs.getString("writer"),
					rs.getInt("pass"),
					rs.getString("subject"),
					rs.getString("content"),
					rs.getString("files"),
					rs.getInt("re_ref"),
					rs.getInt("re_lev"),
					rs.getInt("re_seq"),
					rs.getInt("readcount"),
					rs.getDate("regdate"));
			return board;
		}
	};
	
	// 페이지 보기
		public List<BoardBean> selectPage(String srch, int startPage, int limit) {
			System.out.println(startPage + " // StartPage");
			System.out.println(limit + " // limit");
			List<BoardBean> results;
			if(srch == null || srch.equals("")){
				results = jdbcTemplate.query(
						"select num, writer, pass, "
								+ "subject, content, files, re_ref, re_lev, re_seq, readcount, "
								+ "regdate from board "
								+ "where num >= ? and num <= ? "
								+ "order by re_ref desc, re_seq, num ",
						boardRowMapper, startPage, limit);
			} else {
				results = jdbcTemplate.query(
						"select num, writer, pass, "
						+ "subject, content, files, re_ref, re_lev, re_seq, readcount, "
						+ "regdate from board "
						+ "where(subject like '%?%' or content like '%?%' or writer like '%?%' ) "
						+ "and num >= ? and num <= ? "
						+ "order by re_ref desc, re_seq, num ",
						boardRowMapper, srch, srch, srch, startPage, limit);
			}
			return results;
			
			
		}
		
		// 글의 갯수 구하기
		public int getListCount() {
			Integer count = jdbcTemplate.queryForObject("select count(*) from board ", Integer.class);
				return count;
		}
		
		// 페이지 갯수 구하기
		public int countPage(String srch) {
			Integer count;
			if(srch == null || srch.equals("")) {
				count = jdbcTemplate.queryForObject(
						"select count(*) from board ", Integer.class);
			} else {
				count = jdbcTemplate.queryForObject(
						"select count(*) from board where( "
				+ "subject like '%?%' or "
				+ "content like '%?%' or "
				+ "writer like '%?%' ) ", Integer.class, srch, srch, srch);
			}
			return count;
		}
		
		// 전체 선택
		public List<BoardBean> selectAll() {
			List<BoardBean> results = jdbcTemplate.query(
					"select * from board ", boardRowMapper);
			return results;
		}
		
		// 조회수 업데이트
		public void setReadCountUpdate(int num) {
			jdbcTemplate.update("update board set readcount = "
						+ "readcount + 1 where num = " + num);
		}
		
		// 글 등록하기
		@Transactional
		public void insert(final BoardCommand board) {
			jdbcTemplate.update((Connection con) -> {
					PreparedStatement pstmt = con.prepareStatement(
							"insert into board (num, writer, pass, subject, content, files, "
							+ "re_ref, re_lev, re_seq, readcount, regdate) "
							+ "values (bNum_seq.nextval, ?, ?, ?, ?, ?, 0, 0, 0, 0, sysdate) ");
					pstmt.setString(1, board.getWriter());
					pstmt.setInt(2, board.getPass());
					pstmt.setString(3, board.getSubject());
					pstmt.setString(4, board.getContent());
					pstmt.setString(5, board.getFileName());
					return pstmt;
				});
			
			int num = jdbcTemplate.queryForObject("select bNum_seq.currval from dual ", Integer.class);
			
			jdbcTemplate.update("update board set re_ref = ? where num = ? ",
					num, num);
		}
		
		// 글 삭제하기
		public void delete(int num, int pass) {
			jdbcTemplate.update("delete from board where num = ? and pass = ? ",
					num, pass);
		}
		
		// 입력받은 비밀번호를 바탕으로 글 삭제하기
		// 동일한 비밀번호가 여러개일 경우?
		@Transactional
		public void checkBoardPass(int pass) {
			int num = jdbcTemplate.queryForObject("select num from board where pass = ? ", Integer.class);
			jdbcTemplate.update("delete from board where num = ? and pass = ? ", num, pass);
		}
				
}
