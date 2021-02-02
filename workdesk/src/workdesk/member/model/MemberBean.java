package workdesk.member.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
		// 체크 상태 확인
		signin.setAttend_status(1);

		// 체크인 되었지 확인.
		int signinCheck = memberDAO.signinCheck(signin);
		// System.out.println(signinCheck);
		if (signinCheck != 0) {
			System.out.println("이미 체크인 ");
		} else {
			memberDAO.insertSignin(signin);
		}
		// 체크인 시간은 시스템시간으로 다시 출력
		List<SignDataBean> list = memberDAO.querySignDataBeanById(id);
		model.addAttribute("signin", list);
		model.addAttribute("id", memberDAO.querySignDataBeanById(id));
		return "member/attend";
	}

	@RequestMapping("signout.do")
	public String signout(HttpSession session, Model model, SignDataBean signout) throws Exception {
		// 세션 아니디 확인
		String id = (String) session.getAttribute("memId");
		// id 꺼내기
		signout.setId(id);
		// 체크 상태
		signout.setAttend_status(1);
		// 체크아웃 시간 DB 저장
		memberDAO.updateSignout(signout);
		// 체크인 시간은 시스템시간으로 다시 출력
		List<SignDataBean> list = memberDAO.querySignDataBeanById(id);
		model.addAttribute("signout", list);
		model.addAttribute("id", memberDAO.querySignDataBeanById(id));
		return "member/attend";
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("attend.do")
	public String attend(Model model,HttpSession session) {
		// 세션 아니디 확인
		String id = (String) session.getAttribute("memId");
		// 
		model.addAttribute("id", memberDAO.querySignDataBeanById(id));
		return "member/attend";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(MemberDataBean member, HttpSession session, Model model) throws Exception {
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
	
	@RequestMapping("information.do")
	public String information(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("memId");
		MemberDataBean c = memberDAO.getMember(id);
		
		model.addAttribute("level", memberDAO.memberAll());
		model.addAttribute("c", c);
		return "member/information";
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
		model.addAttribute("level", memberDAO.memberAll());
		model.addAttribute("c", c);
		return "member/modifyForm";
	}

	@RequestMapping("modifyPro.do")
	public String modifyPro(MemberDataBean dto) throws Exception {
		memberDAO.updateMember(dto);
		return "member/modifyPro";
	}

}
