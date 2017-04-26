package member.edit;

import org.springframework.transaction.annotation.Transactional;

import bean.MemberBean;
import dao.MemberDao;
import exception.AlreadyExistPasswordException;
import exception.MemberNotFoundException;

public class ChangePasswordService {
	private MemberDao memberDao;

	public ChangePasswordService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Transactional
	public void changePassword(String email, String oldPwd, String cfnNewPwd) {
		MemberBean member = memberDao.selectByEmail(email);
		if(member == null) {
			throw new MemberNotFoundException();
		} 
		if(oldPwd.equals(cfnNewPwd)) {
			throw new AlreadyExistPasswordException();
		}
		
		member.changePassword(oldPwd, cfnNewPwd);
		memberDao.update(member);
	}
	
}
