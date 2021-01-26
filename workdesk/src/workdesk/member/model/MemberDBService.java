package workdesk.member.model;

public interface MemberDBService {

	public void insertMember(MemberDataBean member) throws Exception;

	public int userCheck(MemberDataBean member) throws Exception;

	public int confirmId(MemberDataBean member) throws Exception;

	public MemberDataBean getMember(String id) throws Exception;

	public void updateMember(MemberDataBean member) throws Exception;

	public int deleteMember(MemberDataBean member) throws Exception;
	
	MemberDataBean finDataBeanId(String id) throws Exception;
	

	

}