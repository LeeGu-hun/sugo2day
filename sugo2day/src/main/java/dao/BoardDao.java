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
		public List<BoardBean> selectPage(String srch, int page, int limit) {
			int startRow = page * 10 + 1;
			int endRow = startRow + limit - 1;
			
			System.out.println(startRow + " // start");
			System.out.println(endRow + " // end");
			
						
			List<BoardBean> results;
			if(srch == null || srch.equals("")){
				results = jdbcTemplate.query(
						"select * from (select rownum rnum, num, writer, subject, pass, "
						+ "content, files, re_ref, re_lev, re_seq, readcount, regdate from ( " 
						+ "select * from board order by re_ref desc, re_seq, num )) "
						+ " where rnum >= ? and rnum <= ? ", boardRowMapper, startRow, endRow);
			} else {
				results = jdbcTemplate.query(
						"select num, writer, pass, "
						+ "subject, content, files, re_ref, re_lev, re_seq, readcount, "
						+ "regdate from board "
						+ "where(subject like '%?%' or content like '%?%' or writer like '%?%' ) "
						+ "and num >= ? and num <= ? "
						+ "order by re_ref desc, re_seq, num ",
						boardRowMapper, srch, srch, srch, startRow, endRow);
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
		
		// num 만 가져오기
		public int selectNum(int num) {
			int result = jdbcTemplate.queryForObject(
					"select num from board where num = ? ", Integer.class, num);
			return result;		
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
		
		// 글 내용 상세보기
		public BoardBean selectByNum(int num) {
			List<BoardBean> results = jdbcTemplate.query(
					"select * from board where num = ? ",
					boardRowMapper, num);
			return results.isEmpty() ? null : results.get(0);
		}
		
		// 본인 확인하기
		public int checkWriter(int num, String writer) {
			int result = jdbcTemplate.queryForObject(
					"select count(*) from board where num = ? and writer = ? ",
					Integer.class, num, writer);
			return result;
		}
				
		// 글 삭제하기
		public void delete(int num, String writer) {
			jdbcTemplate.update("delete from board where num = ? and writer = ? ",
					num, writer);
		}
		
		// 글 수정하기
		@Transactional
		public void update(BoardBean board) {
			jdbcTemplate.update("update board set subject = ?, content = ? where num = ? ",
					board.getSubject(), board.getContent(), board.getNum());
		}
		
		// 답글 등록하기
		
		@Transactional
		public void replyBoard(final BoardBean board) {
							
			// 커맨드 객체에서 받아온 re_ref 값과 re_seq 값에 기반하여 seq 값 갱신
			jdbcTemplate.update("update board set re_seq = re_seq+1 "
					+ "where re_ref = ? and re_seq > ? ", board.getRe_ref(), board.getRe_seq());
			
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into board (num, writer, pass, subject, content, files, "
							+ "re_ref, re_lev, re_seq, readcount, regdate) "
							+ "values (bNum_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate) ");
			
			pstmt.setString(1, board.getWriter());
			pstmt.setInt(2, board.getPass());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, "/");
			pstmt.setInt(6, board.getRe_ref());				// re_ref
			pstmt.setInt(7, board.getRe_lev()+1);			// re_lev
			pstmt.setInt(8, board.getRe_seq()+1);			// re_seq
			return pstmt;
			});	
			
		}	
		
				
}
