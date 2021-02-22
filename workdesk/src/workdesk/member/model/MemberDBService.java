package workdesk.member.model;


import java.util.List;


public interface MemberDBService {

	public void insertMember(MemberDataBean member) throws Exception;

	public int userCheck(MemberDataBean member) throws Exception;

	public int confirmId(MemberDataBean member) throws Exception;

	public MemberDataBean getMember(String id) throws Exception;

	public void updateMember(MemberDataBean member) throws Exception;

	public int deleteMember(MemberDataBean member) throws Exception;

	MemberDataBean finDataBeanId(String id) throws Exception;
	
	// 체크인
	public void insertSignin(SignDataBean signin) throws Exception;

	// 체크인 날짜 체크
	public int signinCheck(SignDataBean signin) throws Exception;
	
    // 체크아웃
	public void updateSignout(SignDataBean signout) throws Exception;

	public List<SignDataBean> querySignDataBeanById(String id);

	//public int towork(SignDataBean signin)throws Exception;

	public List<MemberDataBean> memberAll();
	
	public MemberDataBean myLevel(String id);
	
	public List<SignDataBean> statusAll();
	
	public List<SignDataBean> myStatus(String id);

	public List<SignDataBean> getSignrecord(String id) throws Exception;
	
	public Integer towork(SignDataBean status) throws Exception;
	
	public Integer offwork(SignDataBean status) throws Exception;
}