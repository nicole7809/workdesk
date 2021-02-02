package workdesk.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberDAO")
public class MemberDBServiceMybatis implements MemberDBService {

	@Autowired
	SqlSessionTemplate dao = null;

	@Override
	public void insertMember(MemberDataBean member) throws Exception {
		dao.insert("member.insertMember", member);
	}

	@Override
	public int userCheck(MemberDataBean member) throws Exception {
		return dao.selectOne("member.userCheck", member);
	}

	@Override
	public int confirmId(MemberDataBean member) throws Exception {
		return dao.selectOne("member.userCheck", member);
	}

	@Override
	public MemberDataBean getMember(String id) throws Exception {
		return dao.selectOne("member.member", id);
	}

	@Override
	public void updateMember(MemberDataBean member) throws Exception {
		dao.update("member.updateMember", member);
	}

	@Override
	public int deleteMember(MemberDataBean member) throws Exception {
		int check = dao.selectOne("member.deleteMember", member);
		if (check == 1) {
			dao.delete("member.deleteMember", member);
		}
		return check;
	}

	@Override
	public MemberDataBean finDataBeanId(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertSignin(SignDataBean signin) throws Exception {
		dao.insert("member.insertSignrecord", signin);
	}

	@Override
	public int signinCheck(SignDataBean signin) throws Exception {
		return dao.selectOne("member.signinCheck", signin);
	}

	@Override
	public void updateSignout(SignDataBean signout) throws Exception {
		dao.update("member.updateSignout", signout);
	}

	@Override
	public List<SignDataBean> querySignDataBeanById(String id) {
		return dao.selectList("member.querySignDataBeanById", id);
	}

	@Override
	public List<MemberDataBean> memberAll() {
		return dao.selectList("member.all_level");
	}

	
}
