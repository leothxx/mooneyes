package com.spring.green2209S_09;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 약관 동의창
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinGet() {
		return "member/mooneyes_join";
	}

	// 회원 가입창
	@RequestMapping(value="/join2", method=RequestMethod.GET)
	public String join2Get(Model model, String member_sms_check, String member_email_check) {
		model.addAttribute("member_sms_check",member_sms_check);
		model.addAttribute("member_email_check",member_email_check);
		return "member/mooneyes_join2";
	}
	
	// 회원 가입창
	@RequestMapping(value="/join3", method=RequestMethod.GET)
	public String join3Get() {
		return "member/mooneyes_join3";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public String idCheckPost(String member_mid) {
		int res = 0;
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(vo == null) res = 1;
		return res+"";
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailCheck",method=RequestMethod.POST)
	public String emailCheckPost(String member_email) {
		int res = 1;
		MemberVO vo = memberService.get_mooneyes_member_emailCheck(member_email);
		if(vo != null) res = 0;
		return res+"";
	}
	
	// 회원 가입
	@RequestMapping(value="/join2", method=RequestMethod.POST)
	public String join2Post(HttpServletRequest request, Model model, MemberVO vo) throws MessagingException {
		
		// 회원가입 이메일 인증 키 만들기
		UUID uid = UUID.randomUUID();
		String email_key = uid.toString().substring(0,8);
		vo.setMember_email_key(email_key);
		
		// 메일 전송
		try {
			String toMail = vo.getMember_email();
			String title = vo.getMember_name()+"님 Mooneyes 가입 이메일 인증 코드 입니다.";
			
			// 메일을 전송하기위한 객체 : MimeMessage() , MimeMessageHelper()
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			// 메일보관함에 회원이 보내온 메세지들을 모두 저장시킨다.
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			
			// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
			String content = "<br><hr><h3>Mooneyes 가입 이메일 인증 코드 입니다.</h3><hr><br>";
			content += "<p>인증번호 : <h3><font color='blue'>"+vo.getMember_email_key()+"</font></h3></p>";
			content += "<p>방문하기 : <a href='http://49.142.157.251:9090/green2209S_09/'>mooneyes 바로가기</a></p>";
			content += "<hr>";
			message.setText(content, "utf-8", "html");
			
			// 메일 전송하기
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "redirect:/msg/mailError?mid="+vo.getMember_name();
		}
		
		// 아이디 중복체크
		if(memberService.get_mooneyes_member_check(vo.getMember_mid()) != null) {
			return "redirect:/msg/memberIdCheckNo";
		}
		
		// 이메일 중복체크
		if(memberService.get_mooneyes_member_emailCheck(vo.getMember_email()) != null) {
			return "redirect:/msg/memberEmailCheckNo";
		}
		
		// 비밀번호 암호화(BCryptPasswordEncoder)
		vo.setMember_pwd(passwordEncoder.encode(vo.getMember_pwd()));
		
		// 회원가입 처리 (DB저장)
		vo.setMember_sms_check(vo.getMember_sms_check().substring(0,1));
		vo.setMember_email_check(vo.getMember_email_check().substring(0,1));
		memberService.set_mooneyes_member_join(vo);
		
		model.addAttribute("vo",vo);
		return "member/mooneyes_join3";
	}
	
	// 로그인 창
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginGet(HttpServletRequest request) {
		// 로그인폼 호출시에 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				request.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
		return "member/mooneyes_login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginPost(HttpServletRequest request, HttpServletResponse response , HttpSession session,
			@RequestParam(name="member_mid", defaultValue = "", required = false) String member_mid,
			@RequestParam(name="member_pwd", defaultValue = "", required = false) String member_pwd,
			@RequestParam(name="mid_save", defaultValue = "", required = false) String mid_save) {
		
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(vo != null && passwordEncoder.matches(member_pwd, vo.getMember_pwd()) && vo.getMember_delete_check().equals("N")) {
			String strLevel = "";
			if(vo.getMember_level() == 0) strLevel = "준회원";
			else if(vo.getMember_level() == 1) strLevel = "정회원";
			else if(vo.getMember_level() == 2) strLevel = "우수회원";
			else if(vo.getMember_level() == 3) strLevel = "운영자";
			else if(vo.getMember_level() == 4) strLevel = "관리자";
			
			session.setAttribute("sLevel", vo.getMember_level());
			session.setAttribute("sStrLevel", strLevel);
			session.setAttribute("sMid", member_mid);
			session.setAttribute("sName", vo.getMember_name());
			
			if(mid_save.equals("on")) {
				Cookie cookie = new Cookie("cMid", member_mid);
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			
			// 로그인한 사용자의 방문 IP와 방문날짜 업데이트
			memberService.set_member_visit_update(vo);
			
			return "redirect:/msg/mooneyes_login_ok?mid="+member_mid;
		}
		else {
			return "redirect:/msg/mooneyes_login_no";
		}
	}
	
	// 카카오 로그인 처리
	@RequestMapping(value="/kakao_login", method=RequestMethod.GET)
	public String kakao_loginGet(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String member_name,
			String member_email,
			String member_signIp) {
		
		// 카카오로그인한 회원이 현재 우리 회원인지를 조회한다.
		// 이미 가입된 회원이라면 서비스를 사용하게 하고, 그렇지 않으면 강제로 회원 가입시킨다.
		MemberVO vo = memberService.get_member_nameEmail_Check(member_name, member_email);
		
		// 현재 우리회원이 아니면 자동회원가입처리..(가입필수사항: 아이디,닉네임,이메일) - 아이디는 이메일주소의 '@'앞쪽 이름을 사용하기로 한다.
		if(vo == null) {
			// 아이디 결정하기
			String mid = member_email.substring(0, member_email.indexOf("@"));
			
			// 임시 비밀번호 발급하기(UUID 8자리로 발급하기로 한다. -> 발급후 암호화시켜 DB에 저장)
			UUID uid = UUID.randomUUID();
			String pwd2 = uid.toString().substring(0,8);
			session.setAttribute("sImsiPwd", pwd2);	// 임시비밀번호를 발급하여 로그인후 변경처리하도록 한다.
			String pwd = passwordEncoder.encode(pwd2);
			
			// 이메일 인증키 발급하기
			uid = UUID.randomUUID();
			String email_key = uid.toString().substring(0,8);
			
			// 새로 발급된 임시비밀번호를 메일로 전송처리한다.
			try {
				String toMail = member_email;
				String title = member_name+"님 Mooneyes 가입 이메일 인증 코드 및 임시 비밀번호 입니다.";
				
				// 메일을 전송하기위한 객체 : MimeMessage() , MimeMessageHelper()
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 메일보관함에 회원이 보내온 메세지들을 모두 저장시킨다.
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				
				// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
				String content = "<br><hr><h3>Mooneyes 가입 이메일 인증 코드 및 임시비밀번호 입니다.</h3><hr><br>";
				content += "<p>인증번호 : <h3><font color='blue'>"+email_key+"</font></h3></p>";
				content += "<p>임시비밀번호 : <h3><font color='red'>"+pwd2+"</font></h3></p>";
				content += "<p>방문하기 : <a href='http://49.142.157.251:9090/green2209S_09/'>mooneyes 바로가기</a></p>";
				content += "<hr>";
				content += "<p>가입된 아이디는 가입하신 카카오 email의 @ 앞부분이 아이디이며,</p>";
				content += "<p>임시 비밀번호는 분실 위험이 있으니, 꼭 비밀번호 변경 후 이용해주세요.</p>";
				content += "<hr>";
				message.setText(content, "utf-8", "html");
				
				// 메일 전송하기
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			vo = new MemberVO();
			// 자동 회원 가입처리한다.
			vo.setMember_mid(mid);
			vo.setMember_pwd(pwd);
			vo.setMember_name(member_name);
			vo.setMember_email(member_email);
			vo.setMember_signIp(member_signIp);
			vo.setMember_phone("010-0000-0000");
			vo.setMember_email_key(email_key);
			memberService.set_kakao_Member_InputOk(vo);
			
			// 가입 처리된 회원의 정보를 다시 읽어와서 vo에 담아준다.
			vo = memberService.get_mooneyes_member_check(mid);
		}
		// 만약에 탈퇴신청한 회원이 카카오로그인처리하였다라면 'userDel'필드를 'NO'로 업데이트한다.
		if(!vo.getMember_delete_check().equals("N")) {
			memberService.set_member_userDelCheck(vo.getMember_mid());
		}
		
		// 회원 인증처리된 경우 수행할 내용? strLevel처리, session에 필요한 자료를 저장, 쿠키값처리, 그날 방문자수 1 증가(방문포인트도 증가), ..
		String strLevel = "";
		if(vo.getMember_level() == 0) strLevel = "준회원";
		else if(vo.getMember_level() == 1) strLevel = "정회원";
		else if(vo.getMember_level() == 2) strLevel = "우수회원";
		else if(vo.getMember_level() == 3) strLevel = "운영자";
		else if(vo.getMember_level() == 4) strLevel = "관리자";
		
		session.setAttribute("sLevel", vo.getMember_level());
		session.setAttribute("sStrLevel", strLevel);
		session.setAttribute("sMid", vo.getMember_mid());
		session.setAttribute("sName", vo.getMember_name());
		
		// 로그인한 사용자의 방문 IP와 방문날짜 업데이트
		memberService.set_member_visit_update(vo);
					
		return "redirect:/msg/mooneyes_login_ok?mid="+vo.getMember_mid();
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		
		session.invalidate();
		
		return "redirect:/msg/mooneyes_logout?mid="+mid;
	}
	
	// 마이페이지
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypageGet(Model model, String id) {
		MemberVO vo = memberService.get_mooneyes_member_check(id);
		model.addAttribute("vo",vo);
		return "member/mooneyes_mypage";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/my_info",method=RequestMethod.GET)
	public String my_infoGet(Model model, String mid) {
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		model.addAttribute("vo",vo);
		return "member/mooneyes_my_info";
	}
	
}
