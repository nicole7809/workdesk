package workdesk.member.model;

//import java.sql.Timestamp;
//import java.util.Date;
import java.util.List;

//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import workdesk.member.model.MemberDataBean;
import workdesk.member.model.SignDataBean;

@Controller
@RequestMapping("/member/")
public class MemberBean {

	@Autowired
	private MemberDBService memberDAO = null;

	@RequestMapping("main.do")
	public String main() {
		return "member/main";
	}

	/*
	 * @RequestMapping("signin.do") public String signin(HttpSession session, Model
	 * model, SignDataBean signin) throws Exception {
	 * 
	 * // 세션 아니디 확인 String id = (String) session.getAttribute("memId");
	 * MemberDataBean memberDataBean = memberDAO.getMember(id); // member에 저장된
	 * memId의 name 꺼내기 signin.setName(memberDataBean.getName()); // id 꺼내기
	 * signin.setId(id); // 체크 상태 signin.setAttend_status(1); // 체크인 시간 DB 저장
	 * memberDAO.insertSignin(signin); // 체크인 시간은 시스템시간으로 다시 출력 List<SignDataBean>
	 * list = memberDAO.querySignDataBeanById(id); model.addAttribute("signin",
	 * list); return "member/attend"; }
	 */

	@RequestMapping("signin.do")
	public String signin(HttpSession session, Model model, SignDataBean signin) throws Exception {
		// 세션 아니디 확인
		String id = (String) session.getAttribute("memId");
		signin.setId(id);
		// 체크인 상태 확인
		Integer towork = memberDAO.towork(signin);
		Integer offwork = memberDAO.offwork(signin);
		if (towork == null && offwork == null) {
			signin.setAttend_status("5");
		} else if (offwork == null) {
			signin.setAttend_status("3");
		} else if (towork == null) {
			signin.setAttend_status("2");
		} else if (towork != null && offwork != null) {
			signin.setAttend_status("1");
		}
		// 체크인 되었지 확인.
		int signinCheck = memberDAO.signinCheck(signin);
		// System.out.println(signinCheck);
		if (signinCheck != 0) {
			System.out.println("이미 체크인 ");
		} else {
			memberDAO.insertSignin(signin);
		}
		// 체크인 시간은 시스템시간으로 다시 출력
		// List<SignDataBean> list = memberDAO.querySignDataBeanById(id);
		// model.addAttribute("signin", list);
		// model.addAttribute("id", memberDAO.querySignDataBeanById(id));
		List<SignDataBean> statusAll = memberDAO.myStatus(id);
		model.addAttribute("mystatus", statusAll);
		return "member/attend";
	}

	@RequestMapping("signout.do")
	public String signout(HttpSession session, Model model, SignDataBean signout) 
			throws Exception {
		// 세션 아니디 확인
		String id = (String) session.getAttribute("memId");
		// id 꺼내기
		signout.setId(id);
		// 체크아웃 상태
		Integer towork = memberDAO.towork(signout);
		Integer offwork = memberDAO.offwork(signout);
		if (towork == null && offwork == null) {
			signout.setAttend_status("5");
		} else if (offwork == null && towork != null) {
			signout.setAttend_status("3");
		} else if (towork == null && offwork != null) {
			signout.setAttend_status("2");
		} else if (towork != null && offwork != null) {
			signout.setAttend_status("1");
		}
		System.out.println(signout.getAttend_status());
		// 체크아웃 시간 DB 저장
		memberDAO.updateSignout(signout);
		// 체크인 시간은 시스템시간으로 다시 출력
		// List<SignDataBean> list = memberDAO.querySignDataBeanById(id);
		// model.addAttribute("signout", list);
		// model.addAttribute("id", memberDAO.querySignDataBeanById(id));
		List<SignDataBean> statusAll = memberDAO.myStatus(id);
		// List<SignDataBean> querySignDataBeanById =
		// memberDAO.querySignDataBeanById(id);
		model.addAttribute("mystatus", statusAll);
		return "member/attend";
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("attend.do")
	public String attend(Model model, HttpSession session) throws Exception {
		// 세션 아니디 확인
		String id = (String) session.getAttribute("memId");
		// List<SignDataBean> c = memberDAO.getSignrecord(id);
		// model.addAttribute("c", c);
		List<SignDataBean> statusAll = memberDAO.myStatus(id);
		// List<SignDataBean> querySignDataBeanById =
		// memberDAO.querySignDataBeanById(id);
		model.addAttribute("mystatus", statusAll);
		// model.addAttribute("id", querySignDataBeanById);
		return "member/attend";
	}

	@RequestMapping("information.do")
	public String information(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("memId");
		MemberDataBean c = memberDAO.getMember(id);
		model.addAttribute("c", c);
		MemberDataBean memberAll = memberDAO.myLevel(id);
		model.addAttribute("mylevel", memberAll);
		return "member/information";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(MemberDataBean member, HttpSession session, Model model) 
			throws Exception {
		int check = memberDAO.userCheck(member);
		if (check == 1) {
			session.setAttribute("memId", member.getId());
		}
		model.addAttribute("check", check);
		return "member/loginPro";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}

	@RequestMapping("sign.do")
	public String sign() {
		return "member/sign";
	}

	@RequestMapping("inputForm.do")
	public String inputForm(Model model) {
		model.addAttribute("level", memberDAO.memberAll());
		return "member/inputForm";
	}

	@RequestMapping(value = "inputPro.do", method = RequestMethod.POST)
	public String inputPro(MemberDataBean dto) throws Exception {
		memberDAO.insertMember(dto);
		return "member/inputPro";
	}

	@RequestMapping("confirmId.do")
	public String confirmId(MemberDataBean member, Model model) throws Exception {
		int check = memberDAO.confirmId(member);
		model.addAttribute("check", check);
		model.addAttribute("id", member.getId());
		return "member/confirmId";
	}

	@RequestMapping("confirmId2.do")
	public @ResponseBody String confirmId2(MemberDataBean member) throws Exception {
		int check = memberDAO.confirmId(member);
		return check + "";
	}

	@RequestMapping("modifyForm.do")
	public String modifyForm(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("memId");
		MemberDataBean c = memberDAO.getMember(id);
		model.addAttribute("c", c);
		MemberDataBean memberAll = memberDAO.myLevel(id);
		model.addAttribute("mylevel", memberAll);
		return "member/modifyForm";
	}

	@RequestMapping("modifyPro.do")
	public String modifyPro(MemberDataBean dto) throws Exception {
		memberDAO.updateMember(dto);
		return "member/modifyPro";
	}

}
