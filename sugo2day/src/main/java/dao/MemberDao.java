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

import bean.MemberBean;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;
	private long rsId = 0;
	
	// 	중복되는 코드 부분 정리
	private RowMapper<MemberBean> memRowMapper = new RowMapper<MemberBean>() {
		
		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberBean member = new MemberBean(rs.getString("EMAIL"),
					rs.getString("PASSWORD"),
					rs.getString("NAME"),
					rs.getString("BIRTHDAY"),
					rs.getString("GENDER"),
					rs.getTimestamp("REGDATE"));
			member.setId(rs.getLong("ID"));
			return member;
		}
	};
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	// DB에서 Email 로 검색 (member.login)
	public MemberBean selectByEmail(String email) {
		List<MemberBean> results = jdbcTemplate.query(
				"select * from member where email = ? ", memRowMapper, email);
		return results.isEmpty() ? null : results.get(0);
	}
	
	// 회원 신규 등록 (member.register)
	public void insert(final MemberBean member) {
						
		rsId = jdbcTemplate.queryForObject("select max(id) from member ", Integer.class);
		
		if(rsId >= Math.max(rsId, 0)) {
			rsId = rsId + 1;
		} else if(rsId == 0) {
			rsId = 1;
		}
		
		jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBER (id, email, password, name, birthday, gender, regdate) values (?, ?, ?, ?, ?, ?, ?) ", new String[] {"id"});
				pstmt.setLong(1, rsId);
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getPassword());
				pstmt.setString(4, member.getName());
				pstmt.setString(5, member.getBirthday());
				pstmt.setString(6, member.getGender());
				pstmt.setTimestamp(7, new Timestamp(member.getRegisterDate().getTime()));
				return pstmt;
			});
		
	}
	
	// 회원 정보 수정 (member.manage)
	public void update(MemberBean member) {
		jdbcTemplate.update("update member set name=?, password=? where email = ? ",
				member.getName(), member.getPassword(), member.getEmail());
	}
	
	// 회원 정보 삭제 (member.manage)
	public void delete(MemberBean member) {
		jdbcTemplate.update("delete from member where email = ? ",
				member.getEmail());
	}
			
}
