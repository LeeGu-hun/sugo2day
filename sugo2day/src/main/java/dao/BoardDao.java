package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import bean.Board;
import board.edit.BoardCommand;

public class BoardDao {
	private JdbcTemplate jdbcTemplate;
	
	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private RowMapper<Board> boardRowMapper = new RowMapper<Board>() {
		@Override
		public Board mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
			Board board = new Board(rs.getInt("board_num"), 
					rs.getString("board_writer"), rs.getString("board_subject"),
					rs.getString("board_content"), rs.getString("board_file"),
					rs.getInt("board_re_ref"), rs.getInt("board_re_lev"),
					rs.getInt("board_re_seq"), rs.getInt("board_readcount"),
					rs.getDate("board_date"));
			return board;
		}
	};

	public int count() {
		Integer count = jdbcTemplate.queryForObject(
				"select count(*) from user_board ", Integer.class);
		return count;
	}

	public Board selectByEamil(String email){
		List<Board> results = jdbcTemplate.query(
				"select * from user_board where email=? ", 
				boardRowMapper, email);
		return results.isEmpty()?null: results.get(0);
	}
	
	public Board selectBoardAll(){
		List<Board> results = jdbcTemplate.query(
				"select * from user_board ", 
				boardRowMapper);
		return results.isEmpty()?null: results.get(0);
	}
	
	@Transactional
	public void insert(final Board board) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection con) throws SQLException {
			PreparedStatement pstmt = con.prepareStatement(
				"insert into user_board(board_writer, board_subject, board_content, board_file, "
				+ "board_re_ref, board_re_lev, board_re_seq, board_date) " 
				+ "values(?,?,?,?,?,?,?,now())", new String[] { "board_num" });
			pstmt.setString(1, board.getBoard_writer());
			pstmt.setString(2, board.getBoard_subject());
			pstmt.setString(3, board.getBoard_content());
			pstmt.setString(4, board.getBoard_file());
			pstmt.setInt(5, board.getBoard_re_ref());
			pstmt.setInt(6, board.getBoard_re_lev());
			pstmt.setInt(7, board.getBoard_re_seq());
			return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		int num = keyValue.intValue();
		jdbcTemplate.update("update user_board set board_re_ref=? where board_num=?", 
				num, num);
	}
	
	@Transactional
	public void add(final BoardCommand boardCommand) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection con) throws SQLException {
			PreparedStatement pstmt = con.prepareStatement(
					"insert into user_board (board_writer, board_subject, board_content, board_file, "
							+ "board_re_ref, board_re_lev, board_re_seq, board_date) " 
							+ "values(?,?,?,?,0,0,0,now())", new String[] { "board_num" });
			pstmt.setLong(1, boardCommand.getBoard_writer());
			pstmt.setString(2, boardCommand.getBoard_subject());
			pstmt.setString(3, boardCommand.getBoard_content());
			pstmt.setString(4, boardCommand.getBoard_fileName());
	
			return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		int num = keyValue.intValue();
		jdbcTemplate.update("update user_board set board_re_ref=? where board_num=?", 
				num, num);
	}
	
	
	@Transactional
	public void ReplyBoard(final Board board) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement(
								"insert into user_board (writer, board_subject, content, file, "
										+ "re_ref, re_lev, re_seq, regdate) " + "values(?,?,?,?,?,?,?,now())",
								new String[] { "num" });
				pstmt.setString(1, board.getBoard_writer());
				pstmt.setString(2, board.getBoard_subject());
				pstmt.setString(3, board.getBoard_content());
				pstmt.setString(4, board.getBoard_file());
				pstmt.setInt(5, board.getBoard_re_ref());
				pstmt.setInt(6, board.getBoard_re_lev()+1);
				pstmt.setInt(7, board.getBoard_re_seq()+1);
				return pstmt;
			}
		}, keyHolder);
	}
	
//	@Transactional
//	public void replyInsert(final Board board) {
//		KeyHolder keyHolder = new GeneratedKeyHolder();
//		jdbcTemplate.update(new PreparedStatementCreator() {
//			@Override
//			public PreparedStatement createPreparedStatement(
//					Connection con) throws SQLException {
//			PreparedStatement pstmt = con.prepareStatement(
//				"insert into Board (writer, board_subject, content, file, "
//				+ "re_ref, re_lev, re_seq, regdate) " 
//				+ "values(?,?,?,?,?,?,?,now())", new String[] { "num" });
//			pstmt.setString(1, board.getWriter());
//			pstmt.setString(2, board.getSubject());
//			pstmt.setString(3, board.getContent());
//			pstmt.setString(4, board.getFile());
//			pstmt.setInt(5, board.getRe_ref());
//			pstmt.setInt(6, board.getRe_lev()+1);
//			pstmt.setInt(7, board.getRe_seq()+1);
//			return pstmt;
//			}
//		}, keyHolder);
//	
//	}
	
	public Board selectByNum(int num){
		List<Board> results = jdbcTemplate.query(
				"select * from user_board where num=? and readcount+1", 
				boardRowMapper, num);
		return results.isEmpty()?null: results.get(0);
	}
	
	
//	public void update(Board board){
//		jdbcTemplate.update("update board set board_subject=?, "
//				+ "content=? where num=?", board.getSubject(),
//				board.getContent(), board.getNum());
//	}
	
//	public void updateReadcount(Board board){
//		jdbcTemplate.update("update board set readcount= ? + 1, "
//				+" where num=? ", board.getReadcount(), board.getNum());
//	}
	//UPDATE board SET readcount = readcount + 1 WHERE num = '1';
	public List<Board> selectAll() {
		List<Board> results = jdbcTemplate.query(
				"select * from user_board ", boardRowMapper);
		return results;
	}
	public int countPage(String srch) {
		Integer count;
		if(srch == null || srch.equals("")){
			count = jdbcTemplate.queryForObject(
				"select count(*) from user_board ", 
				Integer.class);
		} else {
			count = jdbcTemplate.queryForObject(
				"select count(*) from user_board where( "
				+ "board_subject like '%?%' or "
				+ "content like '%?%' or "
				+ "writer like '%?%' ) ", 
				Integer.class, srch, srch, srch);
		}
		return count;
	}
	
	public int boardNumMax() {
		Integer boardNumMax = jdbcTemplate.queryForObject("select count(*) from user_board ", Integer.class);
		return boardNumMax;
	}
	

//	public Board updateReply(Board board) {
//		System.out.println(board.getRe_ref());
//		System.out.println(board.getRe_seq());
//		jdbcTemplate.update("update board set re_seq=re_seq+1 where re_ref =? and re_seq > ? ", board.getRe_ref(),
//				board.getRe_seq());
//		return board;
//	}
	
	public List<Board> selectPage(String srch, 
			int startPage, int limit) {
		List<Board> results;
		if(srch == null || srch.equals("")){
			results = jdbcTemplate.query(
					"select num, (select name from member where id = writer) "
					+"writer, board_subject , content, file, re_ref, re_lev, "
					+" re_seq, readcount, regdate from board  order by re_ref desc,re_seq limit ?,? ",
					boardRowMapper, startPage, limit);
		} else {
			results = jdbcTemplate.query(
				"select num, (select name from member where id = writer ) "
				+"writer, board_subject , content, file, re_ref, re_lev, "
				+" re_seq, readcount, regdate from board where( "
				+ "board_subject like '%?%' or "
				+ "content like '%?%' or "
				+ "writer like '%?%' ) order by re_ref desc,re_seq limit ?,? ", 
				boardRowMapper, srch, srch, srch, startPage, limit);
		}
		return results;
	}
	public void boardDelete(Board board) {
		jdbcTemplate.update(
				"delete * from user_board where num = ?", 
				board.getBoard_num());
	}
	
	public int updateReadCount(Board board) {
		return jdbcTemplate.update("UPDATE user_board SET READCOUNT = "
				+ "READCOUNT+1 WHERE NUM=? ",board.getBoard_num());
	}	
}
//insert into board values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)
