package kr.co.bit.login.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.bit.member.service.MemberService;
import kr.co.bit.member.vo.MemberVO;


@SessionAttributes("userVO")
@RequestMapping("/login")
@Controller
public class LoginController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginForm() {
		
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(MemberVO member, HttpSession session, Model model) {
		MemberVO userVO = service.login(member);

		if(userVO == null) {
			return "login/login";
		} 
		
		// 로그인 성공
		//session.setAttribute("userVO", userVO);
		model.addAttribute("userVO", userVO);

		return "redirect:/";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(
			HttpSession session, SessionStatus sessionStatus) {

		//session.invalidate();
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
}









