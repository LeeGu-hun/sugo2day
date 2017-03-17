package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import bean.BoardBean;
import board.BoardCommand;

public class BoardDao {
	private JdbcTemplate jdbcTemplate;
	// 글 작성과 답글 등록시 board_num 값 처리에 필요함
	// 추후 sequence 적용시 변경 예정.
	private int rsNum = 0;
	
	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 중복 코드 처리
			private RowMapper<BoardBean> boardRowMapper = new RowMapper<BoardBean>() {
				@Override
				public BoardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
					BoardBean board = new BoardBean(
							rs.getInt("board_num"),
							rs.getString("board_writer"),
							rs.getInt("board_pass"),
							rs.getString("board_subject"),
							rs.getString("board_content"),
							rs.getString("board_file"),
							rs.getInt("board_re_ref"),
							rs.getInt("board_re_lev"),
							rs.getInt("board_re_seq"),
							rs.getInt("board_readcount"),
							rs.getDate("board_date"));
					return board;
				}
	 		};
	 		
		// 글의 갯수 구하기
		public int getListCount() {
			Integer count = jdbcTemplate.queryForObject("select count(*) from user_board ", Integer.class);
				return count;
		}
		
		// 글 내용 상세보기
		public BoardBean selectByNum(int num) {
			List<BoardBean> results = jdbcTemplate.query(
					"select * from user_board where num = ? ",
					boardRowMapper, num);
			return results.isEmpty() ? null : results.get(0);
		}
			
		// 글 목록 가져오기
		public List<BoardBean> getBoardList(int page, int limit) {
			String sql = "select * from ( "
					+ "select rownum rnum, board_num, board_writer, board_subject, board_content, "
					+ "board_file, board_re_ref, baord_re_lev, board_re_seq, board_readcount, board_date from ( "
					+ "select * from user_board order by board_re_ref desc, board_re_seq asc)) "
					+ "where rnum >= ? and rnum <= ? ";
			
			int startRow = (page-1) * 10 + 1;
			int endRow = startRow + limit - 1;
			
			List<BoardBean> results = jdbcTemplate.query(sql, boardRowMapper, startRow, endRow);
			return results;
		}
		
		// 글 검색하기
		
		// 글 등록하기
		@Transactional
		public void insert(final BoardCommand board) {
			
			rsNum = jdbcTemplate.queryForObject("select max(board_num) from uesr_board ", Integer.class);
			
			if(rsNum >= Math.max(rsNum, 0)) {
				rsNum = rsNum + 1;
			} else if(rsNum == 0) {
				rsNum = 1;
			}
			
			jdbcTemplate.update((Connection con) -> {
					PreparedStatement pstmt = con.prepareStatement(
							"insert into user_board (board_writer, board_pass, board_subject, board_content, board_file, "
							+ "board_re_ref, board_re_lev, board_re_seq, board_date) values (?, ?, ?, ?, ?, 0, 0, 0, now()) ", new String[] {"num"});
					pstmt.setLong(1, board.getBoard_writer());
					pstmt.setInt(2, board.getBoard_pass());
					pstmt.setString(3, board.getBoard_subject());
					pstmt.setString(4, board.getBoard_content());
					pstmt.setString(5, board.getFileName());
					return pstmt;
				});
			
			jdbcTemplate.update("update user_board set board_re_ref = ? where board_num = ? ",
					rsNum, rsNum);
		}
		
		// 답글 등록
		public void replyBoard(final BoardBean board) {
			
			// 글번호가 0일때 자동으로 1, 아닐때는 글번호를 자동으로 최대값 + 1
			rsNum = jdbcTemplate.queryForObject("select max(board_num) from uesr_board ", Integer.class);
			
			if(rsNum >= Math.max(rsNum, 0)) {
				rsNum = rsNum + 1;
			} else if(rsNum == 0) {
				rsNum = 1;
			}
			
			// 커맨드 객체에서 받아온 re_ref 값과 re_seq 값에 기반하여 seq 값 갱신
			jdbcTemplate.update("update user_board set board_re_seq = board_re_seq+1 "
					+ "where board_re_ref = ? and board_re_seq > ? ", board.getBOARD_RE_REF(), board.getBOARD_RE_SEQ());
			
			// 1번째에 제일 처음 실행한 쿼리 결과에서 받아온 max값을 넣고, 두번째 쿼리를 실행한 결과값 re_ref, re_seq 값을 넣은채로
			// 나머지 값들은 board Alias를 준 커맨드객체 Command로부터 받아와서 주입한다.
			// 람다식을 사용했으므로 Java 1.8 Version 이상 필요.
			jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into user_board (board_num, board_pass, board_writer, board_subject, board_content, "
							+ "board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) "
							+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ", new String[] {"num"});
			pstmt.setInt(1, rsNum);
			pstmt.setInt(2, board.getBOARD_PASS());
			pstmt.setString(3, board.getBOARD_WRITER());
			pstmt.setString(4, board.getBOARD_SUBJECT());
			pstmt.setString(5, board.getBOARD_CONTENT());
			pstmt.setInt(6, board.getBOARD_RE_REF());				// re_ref
			pstmt.setInt(7, board.getBOARD_RE_LEV()+1);			// re_lev
			pstmt.setInt(8, board.getBOARD_RE_SEQ()+1);			// re_seq
			pstmt.setInt(9, 0);								// readcount
			return pstmt;
			});	
			
		}	
			
		// 수정하기
		public void update(BoardBean board) {
			jdbcTemplate.update("update user_board set board_subject = ?, board_content = ? "
					+ "where board_num = ? and  board_pass = ? ",
					board.getBOARD_SUBJECT(), board.getBOARD_CONTENT(), board.getBOARD_NUM(), board.getBOARD_PASS());				
		}

		// 조회수 업데이트
		public void setReadCountUpdate(int num) {
			jdbcTemplate.update("update user_board set board_readcount = "
						+ "board_readcount + 1 where board_num = " + num);
		}
		
		// 전체 선택
		public List<BoardBean> selectAll() {
			List<BoardBean> results = jdbcTemplate.query(
					"select * from user_board ", boardRowMapper);
			return results;
		}

		// 페이지 갯수 구하기
		public int countPage(String srch) {
			Integer count;
			if(srch == null || srch.equals("")) {
				count = jdbcTemplate.queryForObject(
						"select count(*) from user_board ", Integer.class);
			} else {
				count = jdbcTemplate.queryForObject(
						"select count(*) from user_board where( "
				+ "board_subject like '%?%' or "
				+ "board_content like '%?%' or "
				+ "board_writer like '%?%' ) ", Integer.class, srch, srch, srch);
			}
			return count;
		}
		
		// 페이지 보기
		public List<BoardBean> selectPage(String srch, int startPage, int limit) {
						
			List<BoardBean> results;
			if(srch == null || srch.equals("")){
				results = jdbcTemplate.query(
						"select board_num, board_writer, board_subject, board_content, board_re_ref, board_re_lev, "
						+ "board_re_seq, board_readcount, board_date from user_board where "
						+ "board_num >= ? and board_num <= ? "
						+ "order by board_re_ref desc, board_re_seq, board_num ",
						boardRowMapper, startPage, limit);
			} else {
				results = jdbcTemplate.query(
						"select board_num, board_writer, board_subject, board_content, board_re_ref, board_re_lev, "
						+ "board_re_seq, board_readcount, board_date from user_board "
						+ "where (board_subject like '%?%' or board_content like '%?%' or board_writer like '%?%' ) and "
						+ "board_num >= ? and board_num <= ? "
						+ "order by board_re_ref desc, board_re_seq, board_num ",
						boardRowMapper, srch, srch, srch, startPage, limit);
			}
			return results;
		}
		
		// 글 지우기
		public void delete(int num, int pass) {
			jdbcTemplate.update("delete from user_board where board_num = ? and board_pass = ? ", num, pass);
		}
		
		
	}