package member.register;

import java.util.Date;

import bean.MemberBean;
import dao.MemberDao;
import exception.AlreadyExistingMemberException;

public class MemberRegisterService {
	private MemberDao memberDao;

	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void regist(RegisterRequest req) {
		MemberBean member = memberDao.selectByEmail(req.getEmail());
		
		if(member != null) {
			throw new AlreadyExistingMemberException("중복된 아이디 " + req.getEmail());
		}
		
		MemberBean newMember = new MemberBean(req.getEmail(), req.getPassword(), req.getName(), req.getBirthday(), req.getGender(), new Date(), req.isEnterprise());
		memberDao.insert(newMember);
	}
}
