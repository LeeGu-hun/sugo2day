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
import org.springframework.transaction.annotation.Transactional;

import bean.MemberBean;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;
	
	// 	중복되는 코드 부분 정리
	private RowMapper<MemberBean> memRowMapper = new RowMapper<MemberBean>() {
		
		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberBean member = new MemberBean(
					rs.getString("EMAIL"),
					rs.getString("PASSWORD"),
					rs.getString("NAME"),
					rs.getString("BIRTHDAY"),
					rs.getString("GENDER"),
					rs.getTimestamp("REGDATE"));
			member.setId(rs.getInt("ID"));
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
	@Transactional
	public void insert(final MemberBean member) {
		jdbcTemplate.update((Connection con) -> {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBER (id, email, password, name, birthday, gender, regdate)"
						+ " values (mID_seq.nextval, ?, ?, ?, ?, ?, ?) ", new String[] {"id"});
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getBirthday());
				pstmt.setString(5, member.getGender());
				pstmt.setTimestamp(6, new Timestamp(member.getRegisterDate().getTime()));
				return pstmt;
			});
	
		jdbcTemplate.queryForObject("select mID_seq.currval from dual ", Integer.class);
		
		
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
