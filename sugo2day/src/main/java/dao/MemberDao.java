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
	
	// 	중복되는 코드 부분 정리
	private RowMapper<MemberBean> memRowMapper = new RowMapper<MemberBean>() {
		
		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberBean member = new MemberBean(rs.getString("EMAIL"),
					rs.getString("PASSWORD"),
					rs.getString("NAME"),
					rs.getString("BIRTHDAY"),
					rs.getString("GENDER"),
					rs.getTimestamp("REGDATE"),
					rs.getBoolean("ENTERPRISE"));
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
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MemberBean (email, password, name, birthday, gender, regdate, enterprise) values (?, ?, ?, ?, ?, ?, ?) ", new String[] {"ID"});
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getBirthday());
				pstmt.setString(5, member.getGender());
				pstmt.setTimestamp(6, new Timestamp(member.getRegisterDate().getTime()));
				pstmt.setBoolean(7, member.isEnterprise());
				return pstmt;
			}, keyHolder);
		Number keyValue = keyHolder.getKey();
		member.setId(keyValue.longValue());
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
