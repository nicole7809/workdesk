package workdesk.member.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import workdesk.member.model.MemberDataBean;

@Controller
@RequestMapping("/member/")
public class MemberBean {

	@Autowired
	private MemberDBService memberDAO = null;

	@RequestMapping("main.do")
	public String main() {
		return "member/main";
	}

	@RequestMapping("attence.do")
	public String attence() {
		return "member/attence";
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm";
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
		model.addAttribute("c", c);
		return "member/information";
	}

	@RequestMapping("inputForm.do")
	public String inputForm() {
		return "member/inputForm";
	}

	@RequestMapping("modifyForm.do")
	public String modifyForm(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("memId");
		MemberDataBean c = memberDAO.getMember(id);
		model.addAttribute("c", c);
		return "member/modifyForm";
	}

	@RequestMapping("modifyPro.do")
	public String modifyPro(MemberDataBean dto) throws Exception {
		memberDAO.updateMember(dto);
		return "member/modifyPro";
	}

	@RequestMapping("signRecord.do")
	public String signRecord() {
		return "member/signRecord";
	}

}
